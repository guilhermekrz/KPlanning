package kplanning.planner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.PlanSolution;
import kplanning.planner.graphplan.PlanningGraph;
import kplanning.util.DomainProblemUtil;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class GraphplanPlannerTest {

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

	@Test
	public void testAllSolutionsBlocksworld4() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("blocksworld", 4));
		GraphplanPlanner planner = new GraphplanPlanner(adapter);
		PlanSolution planSolution1 = planner.plan(true);
		assert planSolution1 != null;
		assertEquals(72, planSolution1.getSolutions().size());
	}

}