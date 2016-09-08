package kplanning.bitset;

import javaff.data.Fact;
import javaff.data.strips.And;
import javaff.data.strips.Proposition;
import kplanning.DomainProblemAdapter;

import java.util.BitSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class BitSetFact {
	private DomainProblemAdapter adapter;
	private Fact fact;
	private BitSet orBitSet, equalsBitSet;

	public BitSetFact(DomainProblemAdapter adapter, Fact fact) {
		this.adapter = adapter;
		this.fact = fact;
		populateBitSet();
	}

	public BitSetFact(DomainProblemAdapter adapter, Set<Fact> facts) {
		this.adapter = adapter;
		And and = new And();
		facts.forEach(and::add);
		this.fact = and;
		populateBitSet();
	}

	BitSet getOrBitSet() {
		return orBitSet;
	}

	BitSet getEqualsBitSet() {
		return equalsBitSet;
	}

	private void populateBitSet() {
		And and = (And) fact;
		BitSetAdapter bitSetAdapter = this.adapter.getBitSetAdapter();
		List<Fact> factList = bitSetAdapter.asSortedList(and.getFacts(), bitSetAdapter.getDefaultFactComparator());
		Iterator<Fact> iterator = factList.iterator();
		Fact currentFact = (iterator.hasNext())? iterator.next() : null;
		List<Fact> list = bitSetAdapter.asSortedList(this.adapter.getJavaffParser().getGroundedFacts(), bitSetAdapter.getDefaultFactComparator());
		orBitSet = new BitSet();
		equalsBitSet = new BitSet();
		for(int i = 0; i< list.size(); i++) {
			Fact fact = list.get(i);
			if(currentFact == null) {
				orBitSet.set(i);
			} else {
				boolean isTrue = this.adapter.getJavaffParser().isGroundFactTrue(currentFact);
				Proposition currentLiteralFact = this.adapter.getJavaffParser().getBaseGroundProposition(currentFact);

				if(fact.equals(currentLiteralFact)) {
					equalsBitSet.set(i, isTrue);
					currentFact = (iterator.hasNext())? iterator.next() : null;
				} else {
					orBitSet.set(i);
				}
			}
		}
		equalsBitSet.or(orBitSet);
	}

	public boolean isTrue(BitSet state) {
		BitSet currentState = (BitSet) state.clone();
		currentState.or(orBitSet);
		return currentState.equals(equalsBitSet);
	}

	@Override
	public String toString() {
		return fact.toString();
	}
}
