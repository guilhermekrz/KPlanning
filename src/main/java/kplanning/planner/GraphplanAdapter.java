package kplanning.planner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.PlanSolutionAdapter;

// TODO: extend from Planner, and change name to JavaGP
public class GraphplanAdapter {

	private DomainProblemAdapter adapter;
	private graphplan.Graphplan graphplan;

	/**
	 * Constructors
	 */

	public static GraphplanAdapter newInstance(DomainProblemAdapter adapter) {
		return GraphplanAdapter.newInstance(adapter, false);
	}

	public static GraphplanAdapter newInstance(DomainProblemAdapter adapter, boolean setupLogger) {
		return new GraphplanAdapter(adapter, setupLogger);
	}

	private GraphplanAdapter(DomainProblemAdapter adapter, boolean setupLogger) {
		this.adapter = adapter;
		graphplan = new graphplan.Graphplan.Builder().setDomainFilename(adapter.getDomainProblem().getDomain()).setSetupLogger(setupLogger).setProblemFilename(adapter.getDomainProblem().getProblem()).build();
	}

	/**
	 * Getters
	 */

	public graphplan.Graphplan getGraphplan() {
		return graphplan;
	}

	public graphplan.PlanSolution getPlanSolution() {
		return getPlanSolution(false, 0);
	}

	public graphplan.PlanSolution getPlanSolution(boolean extractAllPossibleSolutions, int maxLength) {
		graphplan.setExtractAllPossibleSolutions(extractAllPossibleSolutions);
		graphplan.setExtractAllPossibleSolutionsWithMaxLength(maxLength);
		return graphplan.getPlanSolution();
	}

	public PlanSolutionAdapter getPlanSolutionAdapter() {
		return getPlanSolutionAdapter(false, 0);
	}

	public PlanSolutionAdapter getPlanSolutionAdapter(boolean extractAllPossibleSolutions, int maxLength) {
		graphplan.setExtractAllPossibleSolutions(extractAllPossibleSolutions);
		graphplan.setExtractAllPossibleSolutionsWithMaxLength(maxLength);
		return new PlanSolutionAdapter(graphplan.getPlanSolution(), adapter);
	}

}
