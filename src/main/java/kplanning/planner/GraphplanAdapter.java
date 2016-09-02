package kplanning.planner;

import graphplan.Graphplan;
import kplanning.DomainProblemAdapter;
import kplanning.plan.PlanSolutionAdapter;

public class GraphplanAdapter {

	private DomainProblemAdapter adapter;
	private Graphplan graphplan;

	/**
	 * Constructors
	 */

	public static GraphplanAdapter newInstance(DomainProblemAdapter adapter) {
		return new GraphplanAdapter(adapter);
	}

	private GraphplanAdapter(DomainProblemAdapter adapter) {
		this.adapter = adapter;
		graphplan = new Graphplan.Builder().setDomainFilename(adapter.getDomainProblem().getDomain()).setProblemFilename(adapter.getDomainProblem().getProblem()).build();
	}

	/**
	 * Getters
	 */

	public Graphplan getGraphplan() {
		return graphplan;
	}

	public PlanSolutionAdapter getPlanSolution(boolean extractAllPossibleSolutions, int maxLength) {
		graphplan.setExtractAllPossibleSolutions(extractAllPossibleSolutions);
		graphplan.setExtractAllPossibleSolutionsWithMaxLength(maxLength);
		return new PlanSolutionAdapter(graphplan.getPlanSolution(), adapter);
	}

}
