package kplanning.planner.normPlanner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.PlanSolution;
import kplanning.util.DomainProblemUtil;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class NaiveConditionalNormPlannerTest {

	@Test
	public void testDrinkAndDriveNorms1() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 1));
		NormPlanner planner = new NaiveConditionalNormPlanner(adapter);
		PlanSolution planSolution1 = planner.planNormCompliant();
		assertEquals(null, planSolution1);
	}

	@Test
	public void testDrinkAndDriveNorms2() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 2));
		NormPlanner planner = new NaiveConditionalNormPlanner(adapter);
		PlanSolution planSolution1 = planner.planNormCompliant();
		assertEquals(null, planSolution1);
	}

}