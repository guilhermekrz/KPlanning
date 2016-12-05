package kplanning.planner.normPlanner;

import kplanning.DomainProblemAdapter;
import kplanning.norm.Norm;
import kplanning.plan.Plan;
import kplanning.plan.PlanSolution;
import kplanning.util.DomainProblemUtil;
import org.junit.Test;

import java.util.Set;

import static org.junit.Assert.assertEquals;

// TODO: Add more tests
public class ForwardNormPlannerTest {

	private void testWithAndWithoutNormKeeper(DomainProblemAdapter adapter, Plan plan1, Plan plan2, Set<? extends Norm> norms) {
		ForwardNormPlanner planner1 = new ForwardNormPlanner(adapter, false, norms);
		ForwardNormPlanner planner2 = new ForwardNormPlanner(adapter, true, norms);

		PlanSolution planSolution11 = planner1.planNorm(NormPlanner.NormPlannerType.NORM_COMPLIANT);
		PlanSolution planSolution12 = planner2.planNorm(NormPlanner.NormPlannerType.NORM_COMPLIANT);
		if(plan1 == null) {
			assertEquals(PlanSolution.getNoSolutionPlanSolution(adapter), planSolution11);
			assertEquals(PlanSolution.getNoSolutionPlanSolution(adapter), planSolution12);
		} else {
			assertEquals(plan1, planSolution11.getPlan());
			assertEquals(plan1, planSolution12.getPlan());
		}

		PlanSolution planSolution21 = planner1.planNorm(NormPlanner.NormPlannerType.NORM_VIOLATION);
		PlanSolution planSolution22 = planner2.planNorm(NormPlanner.NormPlannerType.NORM_VIOLATION);
		assertEquals(plan2, planSolution21.getPlan());
		assertEquals(plan2, planSolution22.getPlan());
	}

	@Test
	public void testDrinkAndDriveNorms11() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive-constraints", 11));
		testWithAndWithoutNormKeeper(adapter, null, Plan.newPlanFromStringActions(adapter, "move a b"),
				adapter.getNormAdapter().getGroundLtlNorms());
	}

	@Test
	public void testDrinkAndDriveNorms12() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive-constraints", 12));
		testWithAndWithoutNormKeeper(adapter, Plan.newPlanFromStringActions(adapter, "move a b"),
				Plan.newPlanFromStringActions(adapter, "enter a bara", "drink bara", "exit a bara", "move a b"),
				adapter.getNormAdapter().getGroundLtlNorms());
	}

	@Test
	public void testDrinkAndDriveNorms13() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive-constraints", 13));
		testWithAndWithoutNormKeeper(adapter, Plan.newPlanFromStringActions(adapter, "enter a bara", "drink bara", "exit a bara", "move a b"),
				Plan.newPlanFromStringActions(adapter, "move a b"),
				adapter.getNormAdapter().getGroundLtlNorms());
	}

	@Test
	public void testDrinkAndDriveNorms14() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive-constraints", 14));
		testWithAndWithoutNormKeeper(adapter, Plan.newPlanFromStringActions(adapter, "move b a", "enter a bara", "drink bara", "exit a bara"),
				Plan.newPlanFromStringActions(adapter, "move b a"),
				adapter.getNormAdapter().getGroundLtlNorms());
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