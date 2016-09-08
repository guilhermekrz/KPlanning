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

		// Effects
		BitSet expectedEffOrAddList2 = new BitSet();
		expectedEffOrAddList2.set(2);
		BitSet expectedEffAndDeleteList2 = new BitSet();
		expectedEffAndDeleteList2.flip(0, adapter.getJavaffParser().getGroundedPropositions().size());
		assertEquals(expectedEffOrAddList2, a2.getEffOrAddList());
		assertEquals(expectedEffAndDeleteList2, a2.getEffAndDeleteList());

		// A3
		BitSetAction a3 = new BitSetAction(adapter, adapter.getJavaffParser().getAction("move b a"));

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