package kplanning.bitset;

import kplanning.DomainProblemAdapter;
import kplanning.util.DomainProblemUtil;
import org.junit.Before;
import org.junit.Test;

import java.util.BitSet;

import static org.junit.Assert.*;

public class BitSetActionTest {
	private DomainProblemAdapter adapter;
	private BitSetAdapter bitSetAdapter;

	@Before
	public void setup() {
		adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 1));
		bitSetAdapter = adapter.getBitSetAdapter();
	}

	// Order: at a, at b, drunk, inbar bara
	@Test
	public void testGetBitSetFromState() {
		// A1
		BitSetAction a1 = new BitSetAction(adapter, adapter.getJavaffParser().getAction("move a b"));

		// Preconditions
		BitSet expectedPreOrBitSet1 = new BitSet();
		expectedPreOrBitSet1.set(2);
		expectedPreOrBitSet1.set(3);
		BitSet expectedPreEqualsBitSet1 = new BitSet();
		expectedPreEqualsBitSet1.set(0);
		expectedPreEqualsBitSet1.or(expectedPreOrBitSet1);
		assertEquals(expectedPreEqualsBitSet1, a1.getPreEqualsBitSet());
		assertEquals(expectedPreOrBitSet1, a1.getPreOrBitSet());

		// Effects
		BitSet expectedEffOrAddList1 = new BitSet();
		expectedEffOrAddList1.set(1);
		BitSet expectedEffAndDeleteList1 = new BitSet();
		expectedEffAndDeleteList1.set(0);
		expectedEffAndDeleteList1.flip(0, adapter.getJavaffParser().getGroundedPropositions().size());
		assertEquals(expectedEffOrAddList1, a1.getEffOrAddList());
		assertEquals(expectedEffAndDeleteList1, a1.getEffAndDeleteList());

		// A2
		BitSetAction a2 = new BitSetAction(adapter, adapter.getJavaffParser().getAction("drink bara"));

		// Preconditions
		BitSet expectedPreOrBitSet2 = new BitSet();
		expectedPreOrBitSet2.set(0);
		expectedPreOrBitSet2.set(1);
		expectedPreOrBitSet2.set(2);
		BitSet expectedPreEqualsBitSet2 = new BitSet();
		expectedPreEqualsBitSet2.set(3);
		expectedPreEqualsBitSet2.or(expectedPreOrBitSet2);
		assertEquals(expectedPreEqualsBitSet2, a2.getPreEqualsBitSet());
		assertEquals(expectedPreOrBitSet2, a2.getPreOrBitSet());

		// Effects
		BitSet expectedEffOrAddList2 = new BitSet();
		expectedEffOrAddList2.set(2);
		BitSet expectedEffAndDeleteList2 = new BitSet();
		expectedEffAndDeleteList2.flip(0, adapter.getJavaffParser().getGroundedPropositions().size());
		assertEquals(expectedEffOrAddList2, a2.getEffOrAddList());
		assertEquals(expectedEffAndDeleteList2, a2.getEffAndDeleteList());

		// A3
		BitSetAction a3 = new BitSetAction(adapter, adapter.getJavaffParser().getAction("move b a"));

		// Preconditions
		BitSet expectedPreOrBitSet3 = new BitSet();
		expectedPreOrBitSet3.set(2);
		expectedPreOrBitSet3.set(3);
		BitSet expectedPreEqualsBitSet3 = new BitSet();
		expectedPreEqualsBitSet3.set(1);
		expectedPreEqualsBitSet3.or(expectedPreOrBitSet3);
		assertEquals(expectedPreEqualsBitSet3, a3.getPreEqualsBitSet());
		assertEquals(expectedPreOrBitSet3, a3.getPreOrBitSet());

		// Effects
		BitSet expectedEffOrAddList3 = new BitSet();
		expectedEffOrAddList3.set(0);
		BitSet expectedEffAndDeleteList3 = new BitSet();
		expectedEffAndDeleteList3.set(1);
		expectedEffAndDeleteList3.flip(0, adapter.getJavaffParser().getGroundedPropositions().size());
		assertEquals(expectedEffOrAddList3, a3.getEffOrAddList());
		assertEquals(expectedEffAndDeleteList3, a3.getEffAndDeleteList());
	}

	@Test
	public void testIsApplicable() {
		BitSet state1 = bitSetAdapter.getBitSetFromState(adapter.getJavaffParser().getStripsState("at a, not at b, not inbar bara, not drunk"));
		BitSetAction a1 = new BitSetAction(adapter, adapter.getJavaffParser().getAction("move a b"));
		assertTrue(a1.isApplicable(state1));
		BitSetAction a2 = new BitSetAction(adapter, adapter.getJavaffParser().getAction("move b a"));
		assertFalse(a2.isApplicable(state1));
		BitSetAction a3 = new BitSetAction(adapter, adapter.getJavaffParser().getAction("drink bara"));
		assertFalse(a3.isApplicable(state1));

		BitSet state2 = bitSetAdapter.getBitSetFromState(adapter.getJavaffParser().getStripsState("not at a, not at b, inbar bara, not drunk"));
		assertTrue(a3.isApplicable(state2));
	}

	@Test
	public void testApplyActionToState() {
		BitSet state1 = bitSetAdapter.getBitSetFromState(adapter.getJavaffParser().getStripsState("at a, not at b, not inbar bara, not drunk"));
		BitSet state2 = bitSetAdapter.getBitSetFromState(adapter.getJavaffParser().getStripsState("not at a, at b, not inbar bara, not drunk"));
		BitSetAction a1 = new BitSetAction(adapter, adapter.getJavaffParser().getAction("move a b"));
		BitSet resultState1 = a1.applyActionToState(state1);
		assertEquals(resultState1, state2);
	}
}