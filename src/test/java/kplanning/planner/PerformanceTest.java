package kplanning.planner;

import kplanning.DomainProblemAdapter;
import kplanning.util.DomainProblemUtil;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assume.assumeTrue;

public class PerformanceTest {

	@Before
	public void setup() {
		assumeTrue(TestConfig.RUN_PERFORMANCE_TESTS);
	}

	/**
	 * Graphplan
	 */

	@Test
	public void testGraphplanBlocksworld() {
		for(int i=0;i<=7;i++) {
			planGraphplan("blocksworld", i);
		}
	}

	@Test
	public void testGraphplanBlocksworld8() {
		planGraphplan("blocksworld", 8);
	}

	/**
	 * JavaGP
	 */

	@Test
	public void testJavagpBlocksworld() {
		for(int i=0;i<=7;i++) {
			planJavagp("blocksworld", i);
		}
	}

	@Test
	public void testJavagpBlocksworld8() {
		planJavagp("blocksworld", 8);
	}

	/**
	 * JavaFF
	 */

	@Test
	public void testJavaffBlocksworld() {
		for(int i=0;i<=7;i++) {
			planJavaff("blocksworld", i);
		}
	}

	@Test
	public void testJavaffBlocksworld8() {
		planJavaff("blocksworld", 8);
	}

	@Test
	public void testJavaffGraphplanBlocksworld() {
		for(int i=0;i<=7;i++) {
			planJavaffGraphplan("blocksworld", i);
		}
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

	private void planJavaff(String problemName, int problemNumber) {
		new JavaffPlanner(DomainProblemUtil.getDomainProblem(problemName, problemNumber)).plan();
	}

	private void planJavaffGraphplan(String problemName, int problemNumber) {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem(problemName, problemNumber));
		new JavaffGraphplanPlanner(adapter).plan();
	}
}
