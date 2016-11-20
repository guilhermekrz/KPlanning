package kplanning.planner.normPlanner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.Plan;
import kplanning.plan.PlanSolution;
import kplanning.util.DomainProblemUtil;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

// TODO: add tests with all connectives
// TODO: add large problems
public class ForwardNormPlannerTest {

	@Test
	public void testDrinkAndDriveNorms11() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive-constraints", 11));
		ForwardNormPlanner planner = new ForwardNormPlanner(adapter);

		PlanSolution planSolution1 = planner.planNormCompliant();
		assertEquals(null, planSolution1);

		PlanSolution planSolution2 = planner.planNormViolation();
		assertEquals(Plan.newPlanFromStringActions(adapter, "move a b"), planSolution2.getPlan());
	}

	@Test
	public void testDrinkAndDriveNorms12() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive-constraints", 12));
		ForwardNormPlanner planner = new ForwardNormPlanner(adapter);

		PlanSolution planSolution1 = planner.planNormCompliant();
		assertEquals(Plan.newPlanFromStringActions(adapter, "move a b"), planSolution1.getPlan());

		PlanSolution planSolution2 = planner.planNormViolation();
		assertEquals(Plan.newPlanFromStringActions(adapter, "enter a bara", "drink bara", "exit a bara", "move a b"), planSolution2.getPlan());
	}

	@Test
	public void testDrinkAndDriveNorms13() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive-constraints", 13));
		ForwardNormPlanner planner = new ForwardNormPlanner(adapter);

		PlanSolution planSolution1 = planner.planNormCompliant();
		assertEquals(Plan.newPlanFromStringActions(adapter, "enter a bara", "drink bara", "exit a bara", "move a b"), planSolution1.getPlan());

		PlanSolution planSolution2 = planner.planNormViolation();
		assertEquals(Plan.newPlanFromStringActions(adapter, "move a b"), planSolution2.getPlan());
	}

	@Test
	public void testDrinkAndDriveNorms14() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive-constraints", 14));
		ForwardNormPlanner planner = new ForwardNormPlanner(adapter);

		PlanSolution planSolution1 = planner.planNormCompliant();
		assertEquals(Plan.newPlanFromStringActions(adapter, "move b a", "enter a bara", "drink bara", "exit a bara"), planSolution1.getPlan());

		PlanSolution planSolution2 = planner.planNormViolation();
		assertEquals(Plan.newPlanFromStringActions(adapter, "move b a"), planSolution2.getPlan());
	}

//	@Test
//	public void testDrinkAndDriveNorms21() {
//		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 2), "planning-examples/drinkanddrive/pb1.conditionalNorms");
//		ForwardNormPlanner planner = new ForwardNormPlanner(adapter);
//		PlanSolution planSolution1 = planner.planNormCompliant();
//		assertEquals(null, planSolution1);
//	}
//
//	@Test
//	public void testDrinkAndDriveNorms22() {
//		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 2), "planning-examples/drinkanddrive/pb1.conditionalNorms");
//		ForwardNormPlanner planner = new ForwardNormPlanner(adapter);
//		PlanSolution planSolution1 = planner.planNormViolation();
//		assertEquals(1, planSolution1.getPlans().size());
//	}

}