package kplanning.planner;

import javaff.data.Plan;
import javaff.planning.PlanningGraph;
import kplanning.DomainProblemAdapter;
import org.jetbrains.annotations.Nullable;

// TODO: extend from Planner
public class JavaffGraphplanPlanner {

	protected DomainProblemAdapter adapter;

	public JavaffGraphplanPlanner(DomainProblemAdapter adapter) {
		this.adapter = adapter;
	}

	@Nullable
	public Plan plan() {
		PlanningGraph planningGraph = new PlanningGraph(this.adapter.getJavaffParser().getGroundProblem());
		return planningGraph.getPlan(this.adapter.getJavaffParser().getGroundProblem().getSTRIPSInitialState());
	}

}
