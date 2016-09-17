package kplanning.planner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.PlanSolution;
import kplanning.plan.PlanSolutionAdapter;
import kplanning.planner.graphplan.PlanningGraph;
import kplanning.util.DomainProblemUtil;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class GraphplanPlannerTest {

//	@Test
//	public void testPlanBlocksworld0() {
//		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("blocksworld", 0));
//		GraphplanPlanner planner = new GraphplanPlanner(adapter);
//		PlanSolution planSolution = planner.plan(false);
//		System.out.println(planSolution);
//		System.out.println(planSolution.getPlansString());
//
//		PlanSolutionAdapter planSolution1 = adapter.getGraphplanAdapter().getPlanSolution(false, 0);
//		System.out.println(planSolution1);
//
//		assertEquals(planSolution.getPlans(), planSolution1.getAllPlans());
//	}
//
//	@Test
//	public void testPlanBlocksworld4() {
//		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("blocksworld", 4));
//		GraphplanPlanner planner = new GraphplanPlanner(adapter);
//		PlanSolution planSolution = planner.plan(false);
//		System.out.println(planSolution);
//		System.out.println(planSolution.getPlansString());
//
//		PlanSolutionAdapter planSolution1 = adapter.getGraphplanAdapter().getPlanSolution(false, 0);
//		System.out.println(planSolution1);
//
//		assertEquals(planSolution.getPlans(), planSolution1.getAllPlans());
//	}

	@Test
	public void testPlanBlocksworld1() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("blocksworld", 1));
		GraphplanPlanner planner = new GraphplanPlanner(adapter);
		PlanSolution planSolution = planner.plan(false);
		PlanSolutionAdapter planSolution1 = adapter.getGraphplanAdapter().getPlanSolution(false, 0);
		assertEquals(planSolution.getPlans(), planSolution1.getAllPlans());
	}

	@Test
	public void testPlanBlocksworld2() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("blocksworld", 2));
		GraphplanPlanner planner = new GraphplanPlanner(adapter);
		PlanSolution planSolution = planner.plan(false);
		PlanSolutionAdapter planSolution1 = adapter.getGraphplanAdapter().getPlanSolution(false, 0);
		assertEquals(planSolution.getPlans(), planSolution1.getAllPlans());
	}

	@Test
	public void testPlanBlocksworld3() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("blocksworld", 3));
		GraphplanPlanner planner = new GraphplanPlanner(adapter);
		PlanSolution planSolution = planner.plan(false);
		PlanSolutionAdapter planSolution1 = adapter.getGraphplanAdapter().getPlanSolution(false, 0);
		assertEquals(planSolution.getPlans(), planSolution1.getAllPlans());
	}

	@Test
	public void testLevelledOffBlocksworld1() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("blocksworld", 2));
		GraphplanPlanner planner = new GraphplanPlanner(adapter);
		PlanningGraph levelledOffPlanningGraph = planner.getLevelledOffPlanningGraph();
		System.out.println(levelledOffPlanningGraph);
	}
}