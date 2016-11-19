package kplanning.planner.normPlanner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.PlanSolution;
import kplanning.util.DomainProblemUtil;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

// TODO: add more tests
public class ConditionalNormPlannerTest {

	@Test
	public void testDrinkAndDriveNorms1() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 1), "planning-examples/drinkanddrive/pb1.conditionalNorms");
		ConditionalNormPlanner planner = new ConditionalNormPlanner(adapter);
		PlanSolution planSolution1 = planner.planNormCompliant();
		assertEquals(null, planSolution1);
	}

	@Test
	public void testDrinkAndDriveNorms21() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 2), "planning-examples/drinkanddrive/pb1.conditionalNorms");
		ConditionalNormPlanner planner = new ConditionalNormPlanner(adapter);
		PlanSolution planSolution1 = planner.planNormCompliant();
		assertEquals(null, planSolution1);
	}

	@Test
	public void testDrinkAndDriveNorms22() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 2), "planning-examples/drinkanddrive/pb1.conditionalNorms");
		ConditionalNormPlanner planner = new ConditionalNormPlanner(adapter);
		PlanSolution planSolution1 = planner.planNormViolation();
		assertEquals(1, planSolution1.getPlans().size());
	}

}