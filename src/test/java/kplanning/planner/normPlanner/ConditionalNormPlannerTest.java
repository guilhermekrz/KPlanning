package kplanning.planner.normPlanner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.PlanSolution;
import kplanning.util.DomainProblemUtil;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class ConditionalNormPlannerTest {

	@Test
	public void testDrinkAndDriveNorms() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 1), "planning-examples/drinkanddrive/pb1.conditionalNorms");
		ConditionalNormPlanner planner = new ConditionalNormPlanner(adapter);
		PlanSolution planSolution1 = planner.planNormCompliant();
		assertEquals(null, planSolution1);
	}

}