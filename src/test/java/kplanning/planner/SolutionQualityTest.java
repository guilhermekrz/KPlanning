package kplanning.planner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.PlanSolution;
import kplanning.util.DomainProblemUtil;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class SolutionQualityTest {

	@Test
	public void testPlanBlocksworld0to6() {
		for(int i=0;i<=6;i++) {
			assertNumberOfSteps("blocksworld", i);
		}
	}

	@Test
	public void testPlanBlocksworld7() {
		assertNumberOfSteps("blocksworld", 7);
	}

	/**
	 * Utils
	 */

	private void assertNumberOfSteps(String problemName, int problemNumber) {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem(problemName, problemNumber));
		GraphplanPlanner planner = new GraphplanPlanner(adapter);
		PlanSolution planSolution1 = planner.plan();
		graphplan.PlanSolution planSolution2 = adapter.getGraphplanAdapter().getPlanSolution();
		assert planSolution1 != null;
		assertEquals(planSolution1.getSolutions().size(), planSolution2.getNumberOfHighlevelPlans());
	}


}
