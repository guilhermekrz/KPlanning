package kplanning;

import javaff.planning.STRIPSState;
import kplanning.util.DomainProblemUtil;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class DomainProblemAdapterTest {

	@Test
	public void testGetStripsState() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 1));

		STRIPSState s1 = adapter.getJavaffParser().getStripsState("at a, at b");
		assertEquals(2, s1.getTrueFacts().size());
		assertEquals(2, s1.getFalseFacts().size());
		assertEquals(4, s1.getFacts().size());

		STRIPSState s2 = adapter.getJavaffParser().getStripsState("at b");
		assertEquals(1, s2.getTrueFacts().size());
		assertEquals(3, s2.getFalseFacts().size());
		assertEquals(4, s2.getFacts().size());

		STRIPSState s3 = adapter.getJavaffParser().getStripsState("at a, at b, drunk");
		assertEquals(3, s3.getTrueFacts().size());
		assertEquals(1, s3.getFalseFacts().size());
		assertEquals(4, s3.getFacts().size());

		STRIPSState s4 = adapter.getJavaffParser().getStripsState("");
		assertEquals(0, s4.getTrueFacts().size());
		assertEquals(4, s4.getFalseFacts().size());
		assertEquals(4, s4.getFacts().size());

		STRIPSState s5 = adapter.getJavaffParser().getStripsState("not at a, not at b, drunk");
		assertEquals(1, s5.getTrueFacts().size());
		assertEquals(3, s5.getFalseFacts().size());
		assertEquals(4, s5.getFacts().size());
	}
}