package kplanning.reachableStates;

import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;
import kplanning.util.DomainProblemUtil;
import org.junit.Before;
import org.junit.Test;

import java.util.Set;

import static org.junit.Assert.*;

public class GraphplanReachableStatesStrategyTest {

	private DomainProblemAdapter adapter1, adapter3;

	@Before
	public void setup() {
		adapter1 = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 1));
		adapter3 = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 3));
	}

	@Test
	public void getReachableStates1() throws Exception {
		Set<STRIPSState> allReachableStates = adapter1.getJavaffParser().getAllReachableStates(new GraphplanReachableStatesStrategy());
		for(STRIPSState stripsState : allReachableStates) {
			// TODO: check if inconsistency support is ok
			System.out.println(stripsState);
		}
		assertEquals(8, allReachableStates.size());
		assertTrue(allReachableStates.contains(adapter1.getJavaffParser().getStripsState("not at a, not at b, inbar bara, drunk")));
		assertTrue(allReachableStates.contains(adapter1.getJavaffParser().getStripsState("not at a, not at b, inbar bara, not drunk")));
		assertTrue(allReachableStates.contains(adapter1.getJavaffParser().getStripsState("at a, not at b, not inbar bara, drunk")));
		assertTrue(allReachableStates.contains(adapter1.getJavaffParser().getStripsState("at a, not at b, not inbar bara, not drunk")));
		assertTrue(allReachableStates.contains(adapter1.getJavaffParser().getStripsState("not at a, at b, not inbar bara, drunk")));
		assertTrue(allReachableStates.contains(adapter1.getJavaffParser().getStripsState("not at a, at b, not inbar bara, not drunk")));

		// False positives
		assertTrue(allReachableStates.contains(adapter1.getJavaffParser().getStripsState("not at a, not at b, not inbar bara, not drunk")));
		assertTrue(allReachableStates.contains(adapter1.getJavaffParser().getStripsState("not at a, not at b, not inbar bara, drunk")));
	}

	@Test
	public void getReachableStates3() throws Exception {
		Set<STRIPSState> allReachableStates = adapter3.getJavaffParser().getAllReachableStates(new GraphplanReachableStatesStrategy());
		assertEquals(22, allReachableStates.size());
		assertTrue(allReachableStates.contains(adapter3.getJavaffParser().getStripsState("not at a, not at b, inbar bara, drunk")));
		assertTrue(allReachableStates.contains(adapter3.getJavaffParser().getStripsState("not at a, not at b, inbar bara, not drunk")));
		assertTrue(allReachableStates.contains(adapter3.getJavaffParser().getStripsState("at a, not at b, not inbar bara, drunk")));
		assertTrue(allReachableStates.contains(adapter3.getJavaffParser().getStripsState("at a, not at b, not inbar bara, not drunk")));
		assertTrue(allReachableStates.contains(adapter3.getJavaffParser().getStripsState("not at a, at b, not inbar bara, drunk")));
		assertTrue(allReachableStates.contains(adapter3.getJavaffParser().getStripsState("not at a, at b, not inbar bara, not drunk")));
		assertTrue(allReachableStates.contains(adapter3.getJavaffParser().getStripsState("at e, not drunk")));
		assertTrue(allReachableStates.contains(adapter3.getJavaffParser().getStripsState("at e, drunk")));
		assertTrue(allReachableStates.contains(adapter3.getJavaffParser().getStripsState("at g, not drunk")));
		assertTrue(allReachableStates.contains(adapter3.getJavaffParser().getStripsState("at g, drunk")));
		assertTrue(allReachableStates.contains(adapter3.getJavaffParser().getStripsState("at f, not drunk")));
		assertTrue(allReachableStates.contains(adapter3.getJavaffParser().getStripsState("at f, drunk")));

		// False positives
		assertTrue(allReachableStates.contains(adapter3.getJavaffParser().getStripsState("drunk")));
		assertTrue(allReachableStates.contains(adapter3.getJavaffParser().getStripsState("")));

		// False
		assertFalse(allReachableStates.contains(adapter3.getJavaffParser().getStripsState("at a, at b, not inbar bara, not drunk")));
	}

}