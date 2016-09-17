package kplanning.planner.graphplan;

import kplanning.DomainProblemAdapter;
import kplanning.util.DomainProblemUtil;
import org.junit.Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class MutexHelperTest {
	@Test
	public void testInconsistentEffectsMutexBlocksWorld() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("blocksworld", 1));
		PlanningGraph planningGraph = new PlanningGraph(adapter);
		planningGraph.expandGraph();
		ActionLevel actionLevel = planningGraph.getActionLevel(0);
		assertFalse(actionLevel.isInconsistentEffectsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("pickup a")));
		assertTrue(actionLevel.isInconsistentEffectsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("stack a b")));
		assertFalse(actionLevel.isInconsistentEffectsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("unstack a b")));
		assertTrue(actionLevel.isInconsistentEffectsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("putdown a")));
		assertFalse(actionLevel.isInconsistentEffectsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("stack b b")));
		assertFalse(actionLevel.isInconsistentEffectsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("stack b a")));
		assertFalse(actionLevel.isInconsistentEffectsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("unstack b b")));
		assertTrue(actionLevel.isInconsistentEffectsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("unstack b a")));
		assertFalse(actionLevel.isInconsistentEffectsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("putdown b")));
		assertFalse(actionLevel.isInconsistentEffectsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("pickup b")));
		assertTrue(actionLevel.isInconsistentEffectsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("stack a a")));
		assertTrue(actionLevel.isInconsistentEffectsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("unstack a a")));
	}

	@Test
	public void testInterferenceMutexBlocksWorld() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("blocksworld", 1));
		PlanningGraph planningGraph = new PlanningGraph(adapter);
		planningGraph.expandGraph();
		ActionLevel actionLevel = planningGraph.getActionLevel(0);
		assertFalse(actionLevel.isInterferenceMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("pickup a")));
		assertFalse(actionLevel.isInterferenceMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("stack a b")));
		assertTrue(actionLevel.isInterferenceMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("unstack a b")));
		assertFalse(actionLevel.isInterferenceMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("putdown a")));
		assertFalse(actionLevel.isInterferenceMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("stack b b")));
		assertTrue(actionLevel.isInterferenceMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("stack b a")));
		assertFalse(actionLevel.isInterferenceMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("unstack b b")));
		assertFalse(actionLevel.isInterferenceMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("unstack b a")));
		assertFalse(actionLevel.isInterferenceMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("putdown b")));
		assertFalse(actionLevel.isInterferenceMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("pickup b")));
		assertTrue(actionLevel.isInterferenceMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("stack a a")));
		assertTrue(actionLevel.isInterferenceMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("unstack a a")));
	}

	@Test
	public void testCompetingNeedsMutexBlocksWorld() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("blocksworld", 1));
		PlanningGraph planningGraph = new PlanningGraph(adapter);
		planningGraph.expandGraph();
		ActionLevel actionLevel = planningGraph.getActionLevel(0);
		assertFalse(actionLevel.isCompetingNeedsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("pickup a")));
		assertFalse(actionLevel.isCompetingNeedsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("stack a b")));
		assertFalse(actionLevel.isCompetingNeedsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("unstack a b")));
		assertFalse(actionLevel.isCompetingNeedsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("putdown a")));
		assertFalse(actionLevel.isCompetingNeedsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("stack b b")));
		assertFalse(actionLevel.isCompetingNeedsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("stack b a")));
		assertFalse(actionLevel.isCompetingNeedsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("unstack b b")));
		assertFalse(actionLevel.isCompetingNeedsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("unstack b a")));
		assertFalse(actionLevel.isCompetingNeedsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("putdown b")));
		assertFalse(actionLevel.isCompetingNeedsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("pickup b")));
		assertFalse(actionLevel.isCompetingNeedsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("stack a a")));
		assertFalse(actionLevel.isCompetingNeedsMutex(adapter.getJavaffParser().getAction("pickup a"), adapter.getJavaffParser().getAction("unstack a a")));
	}

	@Test
	public void testCompetingNeedsDrinkAndDrive() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 1));
		PlanningGraph planningGraph = new PlanningGraph(adapter);
		planningGraph.expandGraph();
		ActionLevel actionLevel = planningGraph.getActionLevel(0);
		assertFalse(actionLevel.isCompetingNeedsMutex(adapter.getJavaffParser().getAction("sleep a"), adapter.getJavaffParser().getAction("sleep a")));
		assertFalse(actionLevel.isCompetingNeedsMutex(adapter.getJavaffParser().getAction("sleep a"), adapter.getJavaffParser().getAction("sleep b")));
		assertFalse(actionLevel.isCompetingNeedsMutex(adapter.getJavaffParser().getAction("sleep a"), adapter.getJavaffParser().getAction("move a b")));
		assertTrue(actionLevel.isCompetingNeedsMutex(adapter.getJavaffParser().getAction("sleep a"), adapter.getJavaffParser().getAction("move b a")));
		assertFalse(actionLevel.isCompetingNeedsMutex(adapter.getJavaffParser().getAction("sleep a"), adapter.getJavaffParser().getAction("enter a bara")));
		assertFalse(actionLevel.isCompetingNeedsMutex(adapter.getJavaffParser().getAction("sleep a"), adapter.getJavaffParser().getAction("exit a bara")));
		assertFalse(actionLevel.isCompetingNeedsMutex(adapter.getJavaffParser().getAction("sleep a"), adapter.getJavaffParser().getAction("drink bara")));

		assertTrue(actionLevel.isCompetingNeedsMutex(adapter.getJavaffParser().getAction("move a b"), adapter.getJavaffParser().getAction("move b a")));
	}
}