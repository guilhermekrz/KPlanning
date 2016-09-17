package kplanning.planner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.PlanSolution;
import kplanning.plan.PlanSolutionAdapter;
import kplanning.planner.graphplan.PlanningGraph;
import kplanning.util.DomainProblemUtil;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class GraphplanPlannerTest {

	@Test
	public void testPlanBlocksworld0() {
		assertNumberOfSteps("blocksworld", 0);
	}

	@Test
	public void testPlanBlocksworld1() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("blocksworld", 1));
		GraphplanPlanner planner = new GraphplanPlanner(adapter);
		PlanSolution planSolution = planner.plan();
		PlanSolutionAdapter planSolution1 = adapter.getGraphplanAdapter().getPlanSolutionAdapter();
		assertEquals(planSolution.getPlans(), planSolution1.getAllPlans());
	}

	@Test
	public void testPlanBlocksworld2() {
		assertNumberOfSteps("blocksworld", 2);
	}

	@Test
	public void testPlanBlocksworld3() {
		assertNumberOfSteps("blocksworld", 3);
	}

	@Test
	public void testPlanBlocksworld4() {
		assertNumberOfSteps("blocksworld", 4);
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
	 * Utils
	 */

	private void assertNumberOfSteps(String problemName, int problemNumber) {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem(problemName, problemNumber));
		GraphplanPlanner planner = new GraphplanPlanner(adapter);
		PlanSolution planSolution1 = planner.plan();
		graphplan.PlanSolution planSolution2 = adapter.getGraphplanAdapter().getPlanSolution();
		assertEquals(planSolution1.getSolutions().size(), planSolution2.getNumberOfHighlevelPlans());
	}
}