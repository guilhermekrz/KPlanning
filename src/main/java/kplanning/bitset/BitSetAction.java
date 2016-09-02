package kplanning.bitset;

import javaff.data.Action;
import javaff.data.Fact;
import javaff.data.strips.Proposition;
import kplanning.DomainProblemAdapter;

import java.util.BitSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class BitSetAction {
	private DomainProblemAdapter domainProblemAdapter;
	private Action action;
	private BitSet preOrBitSet, preEqualsBitSet;
	private BitSet effOrAddList, effAndDeleteList;

	public BitSetAction(DomainProblemAdapter domainProblemAdapter, Action action) {
		this.domainProblemAdapter = domainProblemAdapter;
		this.action = action;
		populatePreconditionBitSet();
		populateEffectBitSet();
	}

	private void populatePreconditionBitSet() {
		BitSetAdapter adapter = this.domainProblemAdapter.getBitSetAdapter();
		List<Fact> preconditionsList = adapter.asSortedList(action.getPreconditions(), adapter.getDefaultFactComparator());
		Iterator<Fact> iterator = preconditionsList.iterator();
		Fact currentPrecondition = (iterator.hasNext())? iterator.next() : null;
		List<Fact> list = adapter.asSortedList(domainProblemAdapter.getJavaffParser().getGroundedFacts(), adapter.getDefaultFactComparator());
		preOrBitSet = new BitSet();
		preEqualsBitSet = new BitSet();
		for(int i = 0; i< list.size(); i++) {
			Fact fact = list.get(i);
			if(currentPrecondition == null) {
				preOrBitSet.set(i);
			} else {
				boolean isTrue = domainProblemAdapter.getJavaffParser().isGroundFactTrue(currentPrecondition);
				Proposition currentLiteralFact = domainProblemAdapter.getJavaffParser().getBaseGroundProposition(currentPrecondition);

				if(fact.equals(currentLiteralFact)) {
					preEqualsBitSet.set(i, isTrue);
					currentPrecondition = (iterator.hasNext())? iterator.next() : null;
				} else {
					preOrBitSet.set(i);
				}
			}
		}
		preEqualsBitSet.or(preOrBitSet);
	}

	private void populateEffectBitSet() {
		BitSetAdapter adapter = this.domainProblemAdapter.getBitSetAdapter();
		List<Fact> addPropositions = adapter.asSortedList(action.getAddPropositions(), adapter.getDefaultFactComparator());
		Iterator<Fact> addIterator = addPropositions.iterator();
		Fact currentAddEffect = (addIterator.hasNext())? addIterator.next() : null;
		@SuppressWarnings("unchecked")
		List<Fact> deletePropositions = adapter.asSortedList((Set<Fact>) (Set<?>) action.getDeletePropositions(), adapter.getDefaultFactComparator());
		Iterator<Fact> deleteIterator = deletePropositions.iterator();
		Fact currentDeleteEffect = (deleteIterator.hasNext())? deleteIterator.next() : null;

		List<Fact> list = adapter.asSortedList(domainProblemAdapter.getJavaffParser().getGroundedFacts(), adapter.getDefaultFactComparator());
		effOrAddList = new BitSet();
		effAndDeleteList = new BitSet();

		for(int i = 0; i< list.size(); i++) {
			Fact fact = list.get(i);
			if(currentAddEffect != null) {
				Proposition currentLiteralFact = domainProblemAdapter.getJavaffParser().getBaseGroundProposition(currentAddEffect);
				if(fact.equals(currentLiteralFact)) {
					effOrAddList.set(i);
					currentAddEffect = (addIterator.hasNext())? addIterator.next() : null;
				}
			}
			if(currentDeleteEffect != null) {
				Proposition currentLiteralFact = domainProblemAdapter.getJavaffParser().getBaseGroundProposition(currentDeleteEffect);
				if(fact.equals(currentLiteralFact)) {
					effAndDeleteList.set(i);
					currentDeleteEffect = (deleteIterator.hasNext())? deleteIterator.next() : null;
				}
			}
		}
		effAndDeleteList.flip(0, list.size());
	}

	BitSet getPreOrBitSet() {
		return preOrBitSet;
	}

	BitSet getPreEqualsBitSet() {
		return preEqualsBitSet;
	}

	BitSet getEffOrAddList() {
		return effOrAddList;
	}

	BitSet getEffAndDeleteList() {
		return effAndDeleteList;
	}

	public boolean isApplicable(BitSet state) {
		BitSet currentState = (BitSet) state.clone();
		currentState.or(preOrBitSet);
		return currentState.equals(preEqualsBitSet);
	}

	public BitSet applyActionToState(BitSet state) {
		if(!isApplicable(state)) {
			throw new IllegalStateException("Can not apply action " + action + " to state: " + domainProblemAdapter.getBitSetAdapter().getStateFromBitSet(state));
		}
		BitSet nextState = (BitSet) state.clone();
		nextState.or(effOrAddList);
		nextState.and(effAndDeleteList);
		return nextState;
	}
}
