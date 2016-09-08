package kplanning.bitset;

import kplanning.DomainProblemAdapter;
import kplanning.util.DomainProblemUtil;
import org.junit.Before;
import org.junit.Test;

import java.util.BitSet;

import static org.junit.Assert.assertEquals;

public class BitSetFactTest {
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
		// B1
		BitSetFact b1 = new BitSetFact(adapter, adapter.getJavaffParser().getAction("move a b").getPreconditions());
		BitSet expectedPreOrBitSet1 = new BitSet();
		expectedPreOrBitSet1.set(2);
		expectedPreOrBitSet1.set(3);
		BitSet expectedPreEqualsBitSet1 = new BitSet();
		expectedPreEqualsBitSet1.set(0);
		expectedPreEqualsBitSet1.or(expectedPreOrBitSet1);
		assertEquals(expectedPreEqualsBitSet1, b1.getEqualsBitSet());
		assertEquals(expectedPreOrBitSet1, b1.getOrBitSet());

		// B2
		BitSetFact b2 = new BitSetFact(adapter, adapter.getJavaffParser().getAction("drink bara").getPreconditions());
		BitSet expectedPreOrBitSet2 = new BitSet();
		expectedPreOrBitSet2.set(0);
		expectedPreOrBitSet2.set(1);
		expectedPreOrBitSet2.set(2);
		BitSet expectedPreEqualsBitSet2 = new BitSet();
		expectedPreEqualsBitSet2.set(3);
		expectedPreEqualsBitSet2.or(expectedPreOrBitSet2);
		assertEquals(expectedPreEqualsBitSet2, b2.getEqualsBitSet());
		assertEquals(expectedPreOrBitSet2, b2.getOrBitSet());

		// B3
		BitSetFact b3 = new BitSetFact(adapter, adapter.getJavaffParser().getAction("move b a").getPreconditions());
		BitSet expectedPreOrBitSet3 = new BitSet();
		expectedPreOrBitSet3.set(2);
		expectedPreOrBitSet3.set(3);
		BitSet expectedPreEqualsBitSet3 = new BitSet();
		expectedPreEqualsBitSet3.set(1);
		expectedPreEqualsBitSet3.or(expectedPreOrBitSet3);
		assertEquals(expectedPreEqualsBitSet3, b3.getEqualsBitSet());
		assertEquals(expectedPreOrBitSet3, b3.getOrBitSet());
	}
}