package kplanning.planner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.Plan;
import kplanning.util.DomainProblemUtil;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class BFSSearchPlannerTest {

	@Test
	public void testPlanBlocksworld1() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("blocksworld", 1));
		BFSSearchPlanner planner = new BFSSearchPlanner(adapter);
		Plan plan = planner.plan();
		assertEquals(2, plan.getActions().size());
	}

	@Test
	public void testPlanBlocksworld2() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("blocksworld", 2));
		BFSSearchPlanner planner = new BFSSearchPlanner(adapter);
		Plan plan = planner.plan();
		assertEquals(6, plan.getActions().size());
		System.out.println(plan);
	}



}