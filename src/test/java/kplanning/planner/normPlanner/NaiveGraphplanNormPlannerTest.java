package kplanning.planner.normPlanner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.PlanSolution;
import kplanning.util.DomainProblemUtil;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class NaiveGraphplanNormPlannerTest {

	@Test
	public void testDrinkAndDriveNorms1Conditional() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 1), "planning-examples/drinkanddrive/pb1.conditionalNorms");
		NormPlanner planner = new NaiveGraphplanNormPlanner(adapter, adapter.getNormAdapter().getGroundConditionalNorms());
		PlanSolution planSolution = planner.planNormCompliant();
		assertEquals(PlanSolution.getNoSolutionPlanSolution(adapter), planSolution);
	}

	@Test
	public void testDrinkAndDriveNorms1Ltl() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive-constraints", 11));
		NormPlanner planner = new NaiveGraphplanNormPlanner(adapter, adapter.getNormAdapter().getLtlNorms());
		PlanSolution planSolution = planner.planNormCompliant();
		assertEquals(PlanSolution.getNoSolutionPlanSolution(adapter), planSolution);
	}

	@Test
	public void testDrinkAndDriveNorms2Conditional() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 2), "planning-examples/drinkanddrive/pb1.conditionalNorms");
		NormPlanner planner = new NaiveGraphplanNormPlanner(adapter, adapter.getNormAdapter().getGroundConditionalNorms());
		PlanSolution planSolution = planner.planNormCompliant();
		assertEquals(PlanSolution.getNoSolutionPlanSolution(adapter), planSolution);
	}

	@Test
	public void testDrinkAndDriveNorms2Ltl() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive-constraints", 31));
		NormPlanner planner = new NaiveGraphplanNormPlanner(adapter, adapter.getNormAdapter().getLtlNorms());
		PlanSolution planSolution = planner.planNormCompliant();
		assertEquals(PlanSolution.getNoSolutionPlanSolution(adapter), planSolution);
	}

}