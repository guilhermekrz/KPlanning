package kplanning.planner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.PlanSolution;
import kplanning.util.DomainProblemUtil;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class BFSSearchPlannerTest {

	@Test
	public void testPlanBlocksworld1() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("blocksworld", 1));
		Planner planner = new BFSSearchPlanner(adapter);
		PlanSolution planSolution = planner.plan();
		assert planSolution != null;
		assertEquals(1, planSolution.getPlans().size());
		assertEquals(2, planSolution.getPlan().getActions().size());
	}

	@Test
	public void testPlanBlocksworld2() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("blocksworld", 2));
		Planner planner = new BFSSearchPlanner(adapter);
		PlanSolution planSolution = planner.plan();
		assert planSolution != null;
		assertEquals(1, planSolution.getPlans().size());
		assertEquals(6, planSolution.getPlan().getActions().size());
	}

}