package kplanning.planner.normPlanner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.PlanSolution;
import kplanning.util.DomainProblemUtil;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

// TODO: add more tests
public class GraphplanNormPlannerTest {

	@Test
	public void testDrinkAndDriveNorms1() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 1), "planning-examples/drinkanddrive/pb1.conditionalNorms");
		GraphplanNormPlanner planner = new GraphplanNormPlanner(adapter, adapter.getNormAdapter().getGroundConditionalNorms());
		PlanSolution planSolution1 = planner.planNorm(NormPlanner.NormPlannerType.NORM_COMPLIANT);
		assertEquals(PlanSolution.getNoSolutionPlanSolution(adapter), planSolution1);
	}

	@Test
	public void testDrinkAndDriveNorms21() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 2), "planning-examples/drinkanddrive/pb1.conditionalNorms");
		GraphplanNormPlanner planner = new GraphplanNormPlanner(adapter, adapter.getNormAdapter().getGroundConditionalNorms());
		PlanSolution planSolution1 = planner.planNorm(NormPlanner.NormPlannerType.NORM_COMPLIANT);
		assertEquals(PlanSolution.getNoSolutionPlanSolution(adapter), planSolution1);
	}

	@Test
	public void testDrinkAndDriveNorms22() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 2), "planning-examples/drinkanddrive/pb1.conditionalNorms");
		GraphplanNormPlanner planner = new GraphplanNormPlanner(adapter, adapter.getNormAdapter().getGroundConditionalNorms());
		PlanSolution planSolution1 = planner.planNorm(NormPlanner.NormPlannerType.NORM_VIOLATION);
		assertEquals(1, planSolution1.getPlans().size());
	}

	@Test
	public void testBlocksworld() {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("blocksworld", 1), "planning-examples/blocksworld/normsP1/norms3");
		GraphplanNormPlanner planner = new GraphplanNormPlanner(adapter, adapter.getNormAdapter().getGroundConditionalNorms());
		PlanSolution planSolution1 = planner.planNorm(NormPlanner.NormPlannerType.NORM_VIOLATION);
		assertEquals(2, planSolution1.getPlans().size());
	}

}