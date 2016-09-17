package kplanning.planner.graphplan;

import javaff.data.Action;
import javaff.data.Fact;
import javaff.data.strips.Not;
import kplanning.DomainProblemAdapter;
import kplanning.util.ArrayUtil;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class MutexHelper {
	public static final int NO_MUTEX = 0;

	// Action
	public static final int INCONSISTENT_EFFECTS = 1;
	public static final int INTERFERENCE = 2;
	public static final int COMPETING_NEEDS = 4;

	// Fact
	public static final int INCONSISTENT_SUPPORT = 8;

	private DomainProblemAdapter adapter;
	private Set<Action> actions;
	private Map<Action, Integer> actionIndexes;
	private Map<Fact, Integer> factIndexes;
	private int[][] basicFactMutex;

	MutexHelper(DomainProblemAdapter adapter, Set<Action> actions) {
		this.adapter = adapter;
		this.actions = actions;
		populateFactIndexes();
		populateActionIndexes();
	}

	public DomainProblemAdapter getAdapter() {
		return adapter;
	}

	private void populateActionIndexes() {
		this.actionIndexes = new HashMap<>();
		int index = 0;
		for(Action action : actions) {
			actionIndexes.put(action, index);
			index++;
		}
	}

	public int index(Action action) {
		return actionIndexes.get(action);
	}

	/**
	 * Fact mutex
	 */

	private void populateFactIndexes() {
		this.factIndexes = new HashMap<>();
		int index = 0;
		for(Fact fact : adapter.getJavaffParser().getGroundedPropositions()) {
			factIndexes.put(fact, index);
			index++;
			factIndexes.put(new Not(fact), index);
			index++;
		}
	}

	// Only basic mutexes are fact true vs not true
	public int[][] getBasicFactMutex() {
		if(basicFactMutex == null) {
			int size = adapter.getJavaffParser().getGroundedPropositions().size() * 2;
			basicFactMutex = new int[size][size];
			for (int i = 0; i < size; i += 2) {
				// This is only possible because we true/not true facts are added sequentially
				basicFactMutex[i][i + 1] = basicFactMutex[i][i + 1] | INCONSISTENT_SUPPORT;
				basicFactMutex[i + 1][i] = basicFactMutex[i + 1][i] | INCONSISTENT_SUPPORT;
			}
		}
		return ArrayUtil.cloneArray(basicFactMutex);
	}

	public int index(Fact fact) {
		return factIndexes.get(fact);
	}
}
