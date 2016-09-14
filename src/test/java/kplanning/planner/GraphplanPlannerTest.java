package kplanning.planner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.Plan;
import kplanning.util.DomainProblemUtil;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class GraphplanPlannerTest {
	@Test
	public void testPlanBlocksworld1() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("blocksworld", 2));
		Planner planner = new GraphplanPlanner(adapter);
		Plan plan = planner.plan();
		assertEquals(2, plan.getActions().size());
	}
}