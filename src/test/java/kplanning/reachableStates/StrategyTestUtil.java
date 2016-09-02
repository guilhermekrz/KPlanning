package kplanning.reachableStates;

import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;

import java.util.Set;

import static org.junit.Assert.*;

class StrategyTestUtil {

	static void assertReachableStatesOfProblem1(DomainProblemAdapter adapter, Set<STRIPSState> allReachableStates) {
		assertEquals(6, allReachableStates.size());
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("not at a, not at b, inbar bara, drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("not at a, not at b, inbar bara, not drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("at a, not at b, not inbar bara, drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("at a, not at b, not inbar bara, not drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("not at a, at b, not inbar bara, drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("not at a, at b, not inbar bara, not drunk")));
	}

	static void assertReachableStatesOfProblem3(DomainProblemAdapter adapter, Set<STRIPSState> allReachableStates) {
		assertEquals(20, allReachableStates.size());
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("not at a, not at b, inbar bara, drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("not at a, not at b, inbar bara, not drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("at a, not at b, not inbar bara, drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("at a, not at b, not inbar bara, not drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("not at a, at b, not inbar bara, drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("not at a, at b, not inbar bara, not drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("at e, not drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("at e, drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("at g, not drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("at g, drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("at f, not drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("at f, drunk")));

		// False
		assertFalse(allReachableStates.contains(adapter.getJavaffParser().getStripsState("at a, at b, not inbar bara, not drunk")));
	}

	static void assertReachableStatesOfProblem4(DomainProblemAdapter adapter, Set<STRIPSState> allReachableStates) {
		assertEquals(56, allReachableStates.size());
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("not at a, not at b, inbar bara, drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("not at a, not at b, inbar bara, not drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("at a, not at b, not inbar bara, drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("at a, not at b, not inbar bara, not drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("not at a, at b, not inbar bara, drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("not at a, at b, not inbar bara, not drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("at e, not drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("at e, drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("at g, not drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("at g, drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("at f, not drunk")));
		assertTrue(allReachableStates.contains(adapter.getJavaffParser().getStripsState("at f, drunk")));

		// False
		assertFalse(allReachableStates.contains(adapter.getJavaffParser().getStripsState("at a, at b, not inbar bara, not drunk")));
	}
}
