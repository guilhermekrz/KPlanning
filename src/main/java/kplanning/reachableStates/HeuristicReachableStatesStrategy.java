package kplanning.reachableStates;

import heuristic.FFPlanningHeuristic;
import heuristic.Heuristic;
import javaff.data.strips.And;
import javaff.planning.STRIPSState;
import javaff.search.UnreachableGoalException;
import kplanning.DomainProblemAdapter;

import java.util.HashSet;
import java.util.Set;

/**
 * This strategy generates all reachable states by checking if a state is reachable using the FFPlanningHeuristic.
 * As this heuristic constructs a plan for each possible state, it is really slow and not efficient.
 */
public class HeuristicReachableStatesStrategy implements GetReachableStatesStrategy {

	@Override
	public Set<STRIPSState> getReachableStates(DomainProblemAdapter adapter) {
		Set<STRIPSState> allPossibleStates = adapter.getJavaffParser().getAllPossibleStates();
		Set<STRIPSState> reachableStates = new HashSet<>();
		for(STRIPSState state : allPossibleStates) {
			if(isReachable(adapter, state)) {
				reachableStates.add(state);
			}
		}
		return reachableStates;
	}

	private boolean isReachable(DomainProblemAdapter adapter, STRIPSState state) {
		Heuristic heuristic = new FFPlanningHeuristic(adapter.getJavaffParser().getGroundProblem(), adapter.getJavaffParser().getGroundProblem().getSTRIPSInitialState().getFacts());
		try {
			int estimate = heuristic.getEstimate(new And(state.getFacts()));
			return estimate >= 0 && estimate != Heuristic.UNREACHABLE;
		} catch (UnreachableGoalException e) {
			e.printStackTrace();
		}
		return false;
	}
}
