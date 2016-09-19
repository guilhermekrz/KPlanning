package kplanning.planner;

import kplanning.DomainProblemAdapter;
import kplanning.util.DomainProblemUtil;

// TODO: add a flag to run/not run this
public class PerformanceTest {

//	@Test
	public void testGraphplanBlocksworld() {
		for(int i=0;i<=7;i++) {
			planGraphplan("blocksworld", i);
		}
	}

//	@Test
	public void testGraphplanBlocksworld8() {
		planGraphplan("blocksworld", 8);
	}

//	@Test
	public void testJavagpBlocksworld() {
		for(int i=0;i<=7;i++) {
			planJavagp("blocksworld", i);
		}
	}

//	@Test
	public void testJavagpBlocksworld8() {
		planJavagp("blocksworld", 8);
	}

	/**
	 * Utils
	 */

	private void planGraphplan(String problemName, int problemNumber) {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem(problemName, problemNumber));
		GraphplanPlanner planner = new GraphplanPlanner(adapter);
		planner.plan();
	}

	private void planJavagp(String problemName, int problemNumber) {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem(problemName, problemNumber));
		adapter.getGraphplanAdapter().getPlanSolution();
	}
}
