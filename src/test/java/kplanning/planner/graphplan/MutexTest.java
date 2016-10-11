package kplanning.planner.graphplan;

import kplanning.DomainProblemAdapter;
import kplanning.util.DomainProblemUtil;
import org.junit.Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class MutexTest {
	@Test
	public void testMutexBlocksWorld() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("blocksworld", 1));
		PlanningGraph planningGraph = new PlanningGraph(adapter);
		planningGraph.expandGraph();
		ActionLevel actionLevel = planningGraph.getActionLevel(0);
		assertFalse(actionLevel.isActionMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("pickup a")));
		assertFalse(actionLevel.isActionMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("stack a b")));
		assertFalse(actionLevel.isActionMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("unstack a b")));
		assertFalse(actionLevel.isActionMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("putdown a")));
		assertFalse(actionLevel.isActionMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("stack b b")));
		assertFalse(actionLevel.isActionMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("stack b a")));
		assertFalse(actionLevel.isActionMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("unstack b b")));
		assertFalse(actionLevel.isActionMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("unstack b a")));
		assertFalse(actionLevel.isActionMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("putdown b")));
		assertFalse(actionLevel.isActionMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("pickup b")));
		assertFalse(actionLevel.isActionMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("stack a a")));
		assertFalse(actionLevel.isActionMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("unstack a a")));
	}

	@Test
	public void testMutexDrinkAndDrive() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 1));
		PlanningGraph planningGraph = new PlanningGraph(adapter);
		planningGraph.expandGraph();
		ActionLevel actionLevel = planningGraph.getActionLevel(0);
		assertFalse(actionLevel.isActionMutex(adapter.getJavaffParser().getAction("sleep a"), adapter.getJavaffParser().getAction("sleep a")));
		assertFalse(actionLevel.isActionMutex(adapter.getJavaffParser().getAction("sleep a"), adapter.getJavaffParser().getAction("sleep b")));
		assertTrue(actionLevel.isActionMutex(adapter.getJavaffParser().getAction("sleep a"), adapter.getJavaffParser().getAction("move a b")));
		assertFalse(actionLevel.isActionMutex(adapter.getJavaffParser().getAction("sleep a"), adapter.getJavaffParser().getAction("move b a")));
		assertTrue(actionLevel.isActionMutex(adapter.getJavaffParser().getAction("sleep a"), adapter.getJavaffParser().getAction("enter a bara")));
		assertFalse(actionLevel.isActionMutex(adapter.getJavaffParser().getAction("sleep a"), adapter.getJavaffParser().getAction("exit a bara")));
		assertFalse(actionLevel.isActionMutex(adapter.getJavaffParser().getAction("sleep a"), adapter.getJavaffParser().getAction("drink bara")));

		assertFalse(actionLevel.isActionMutex(adapter.getJavaffParser().getAction("move a b"), adapter.getJavaffParser().getAction("move b a")));
	}
}