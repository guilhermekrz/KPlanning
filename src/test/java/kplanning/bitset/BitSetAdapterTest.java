package kplanning.bitset;

import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;
import kplanning.util.DomainProblemUtil;
import org.junit.Before;
import org.junit.Test;

import java.util.BitSet;

import static org.junit.Assert.assertEquals;

public class BitSetAdapterTest {
	private DomainProblemAdapter adapter;
	private BitSetAdapter bitSetAdapter;

	@Before
	public void setup() {
		adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 1));
		bitSetAdapter = adapter.getBitSetAdapter();
	}

	@Test
	public void testGetBitSetFromState() {
		BitSet b11 = bitSetAdapter.getBitSetFromState(adapter.getJavaffParser().getStripsState("at a, at b, inbar bara, drunk"));
		BitSet b12 = bitSetAdapter.getBitSetFromState(adapter.getJavaffParser().getStripsState("inbar bara, at b, drunk, at a"));
		assertEquals(b11, b12);

		BitSet b21 = bitSetAdapter.getBitSetFromState(adapter.getJavaffParser().getStripsState("not at a, not at b, not inbar bara, not drunk"));
		BitSet b22 = bitSetAdapter.getBitSetFromState(adapter.getJavaffParser().getStripsState("not at a, not drunk, not at b, not inbar bara"));
		assertEquals(b21, b22);

		BitSet b31 = bitSetAdapter.getBitSetFromState(adapter.getJavaffParser().getStripsState("not at a, at b, not inbar bara, not drunk"));
		BitSet b32 = bitSetAdapter.getBitSetFromState(adapter.getJavaffParser().getStripsState("not at a, not inbar bara, not drunk, at b"));
		assertEquals(b31, b32);

		BitSet b41 = bitSetAdapter.getBitSetFromState(adapter.getJavaffParser().getStripsState("at a, at b, not inbar bara, not drunk"));
		BitSet b42 = bitSetAdapter.getBitSetFromState(adapter.getJavaffParser().getStripsState("at b, not inbar bara, at a, not drunk"));
		assertEquals(b41, b42);
	}

	@Test
	public void testGetStateFromBitSet() {
		testGetStateFromBitSetAux("at a, at b, inbar bara, drunk", "inbar bara, at b, drunk, at a");
		testGetStateFromBitSetAux("not at a, not at b, not inbar bara, not drunk", "not at a, not drunk, not at b, not inbar bara");
		testGetStateFromBitSetAux("not at a, at b, not inbar bara, not drunk", "not at a, not inbar bara, not drunk, at b");
		testGetStateFromBitSetAux("at a, at b, not inbar bara, not drunk", "at b, not inbar bara, at a, not drunk");
	}

	private void testGetStateFromBitSetAux(String s1, String s2) {
		STRIPSState sb11 = adapter.getJavaffParser().getStripsState(s1);
		BitSet b11 = bitSetAdapter.getBitSetFromState(sb11);
		STRIPSState sa11 = bitSetAdapter.getStateFromBitSet(b11);
		assertEquals(sb11, sa11);

		STRIPSState sb12 = adapter.getJavaffParser().getStripsState(s2);
		BitSet b12 = bitSetAdapter.getBitSetFromState(sb12);
		STRIPSState sa12 = bitSetAdapter.getStateFromBitSet(b12);
		assertEquals(sb12, sa12);

		assertEquals(sb11, sb12);
		assertEquals(sa11, sa12);
		assertEquals(sa11, sb12);
		assertEquals(sb11, sa12);
	}
}
