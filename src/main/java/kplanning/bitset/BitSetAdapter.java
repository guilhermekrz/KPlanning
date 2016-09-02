package kplanning.bitset;

import javaff.data.Action;
import javaff.data.Fact;
import javaff.data.strips.Not;
import javaff.data.strips.Proposition;
import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;

import java.util.*;

public class BitSetAdapter {

	private DomainProblemAdapter adapter;

	// Lazy init
	private Set<BitSetAction> bitSetActions;

	/**
	 * Constructors
	 */

	public static BitSetAdapter newInstance(DomainProblemAdapter adapter) {
		return new BitSetAdapter(adapter);
	}

	private BitSetAdapter(DomainProblemAdapter adapter) {
		this.adapter = adapter;
	}

	public BitSet getCompleteInitState() {
		return getBitSetFromState(adapter.getJavaffParser().getCompleteInitState());
	}

	public Set<BitSetAction> getActions() {
		if(bitSetActions == null) {
			bitSetActions = new HashSet<>();
			for (Action action : adapter.getJavaffParser().getGroundProblem().getActions()) {
				bitSetActions.add(new BitSetAction(adapter, action));
			}
		}
		return bitSetActions;
	}

	public BitSet getBitSetFromState(STRIPSState stripsState) {
		List<Fact> list = asSortedList(stripsState.getFacts(), getDefaultFactComparator());
		BitSet bitSet = new BitSet();
		for(int i=0;i<list.size();i++) {
			Fact fact = list.get(i);
			boolean isTrue;
			if(fact instanceof Proposition) {
				isTrue = true;
			} else if(fact instanceof Not) {
				isTrue = false;
			} else {
				throw new IllegalStateException("Fact should be either a Proposition or a Not. Found: " + fact.getClass());
			}
			bitSet.set(i, isTrue);
		}
		return bitSet;
	}

	public STRIPSState getStateFromBitSet(BitSet bitSet) {
		List<Fact> list = asSortedList(adapter.getJavaffParser().getGroundedFacts(), getDefaultFactComparator());
		Set<Fact> trueFacts = new HashSet<>();
		Set<Not> negatedFacts = new HashSet<>();
		for(int i=0;i<bitSet.size() && i<list.size() ;i++) {
			Fact f = list.get(i);
			if(bitSet.get(i)) {
				trueFacts.add(f);
			} else {
				negatedFacts.add(new Not(f));
			}
		}
		return new STRIPSState(adapter.getJavaffParser().getGroundProblem().getActions(), trueFacts, negatedFacts, adapter.getJavaffParser().getGroundProblem().getGoal());
	}

	<T> List<T> asSortedList(Set<T> set, Comparator<T> comparator) {
		List<T> list = new ArrayList<>(set);
		Collections.sort(list, comparator);
		return list;
	}

	Comparator<Fact> getDefaultFactComparator() {
		return (f1, f2) -> {
			Proposition p1 = adapter.getJavaffParser().getBaseGroundProposition(f1);
			Proposition p2 = adapter.getJavaffParser().getBaseGroundProposition(f2);

			if(p1.equals(p2)) {
				return 0;
			} else {
				int c = p1.getPredicateSymbol().getName().compareTo(p2.getPredicateSymbol().getName());
				if(c != 0) {
					return c;
				} else {
					if(p1.getParameters().equals(p2.getParameters())) {
						throw new IllegalStateException("This should never happen");
					}
					return p1.getParameters().hashCode() - p2.getParameters().hashCode();
				}
			}
		};
	}
}
