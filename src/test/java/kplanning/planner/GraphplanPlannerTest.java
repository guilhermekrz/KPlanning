package kplanning.planner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.PlanSolution;
import kplanning.planner.graphplan.PlanningGraph;
import kplanning.util.DomainProblemUtil;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class GraphplanPlannerTest {

	@Test
	public void testPlanBlocksworld0to6() {
		for(int i=0;i<=6;i++) {
			assertNumberOfSteps("blocksworld", i);
		}
	}

	@Test
	public void testPlanBlocksworld7() {
		assertNumberOfSteps("blocksworld", 7);
	}

	/**
	 * Levelled off
	 */

	@Test
	public void testLevelledOffBlocksworld1() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("blocksworld", 2));
		GraphplanPlanner planner = new GraphplanPlanner(adapter);
		PlanningGraph levelledOffPlanningGraph = planner.getLevelledOffPlanningGraph();
		System.out.println(levelledOffPlanningGraph);
	}

	/**
	 * Found all solutions
	 */

	@Test
	public void testAllSolutionsBlocksworld1() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("blocksworld", 1));
		GraphplanPlanner planner = new GraphplanPlanner(adapter);
		PlanSolution planSolution1 = planner.plan(true);
		assert planSolution1 != null;
		assertEquals(1, planSolution1.getSolutions().size());
	}

	@Test
	public void testAllSolutionsBlocksworld2() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("blocksworld", 2));
		GraphplanPlanner planner = new GraphplanPlanner(adapter);
		PlanSolution planSolution1 = planner.plan(true);
		assert planSolution1 != null;
		assertEquals(4, planSolution1.getSolutions().size());
	}

	@Test
	public void testAllSolutionsBlocksworld3() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("blocksworld", 3));
		GraphplanPlanner planner = new GraphplanPlanner(adapter);
		PlanSolution planSolution1 = planner.plan(true);
		assert planSolution1 != null;
		assertEquals(2, planSolution1.getSolutions().size());
	}

	// This takes too long
//	@Test
//	public void testAllSolutionsBlocksworld4() {
//		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("blocksworld", 4));
//		GraphplanPlanner planner = new GraphplanPlanner(adapter);
//		PlanSolution planSolution1 = planner.plan(true);
//		assert planSolution1 != null;
//		assertEquals(2, planSolution1.getSolutions().size());
//	}

	/**
	 * Utils
	 */

	private void assertNumberOfSteps(String problemName, int problemNumber) {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem(problemName, problemNumber));
		GraphplanPlanner planner = new GraphplanPlanner(adapter);
		PlanSolution planSolution1 = planner.plan();
		graphplan.PlanSolution planSolution2 = adapter.getGraphplanAdapter().getPlanSolution();
		assert planSolution1 != null;
		assertEquals(planSolution1.getSolutions().size(), planSolution2.getNumberOfHighlevelPlans());
	}
}