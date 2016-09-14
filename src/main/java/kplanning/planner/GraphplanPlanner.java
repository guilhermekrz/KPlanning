package kplanning.planner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.ParallelPlan;
import kplanning.plan.Plan;
import kplanning.planner.graphplan.PlanningGraph;

public class GraphplanPlanner extends Planner {

	public GraphplanPlanner(DomainProblemAdapter adapter) {
		super(adapter);
	}

	@Override
	public Plan plan() {
		PlanningGraph planningGraph = new PlanningGraph(this.adapter);
		while(!planningGraph.isGoalPossible()) {
			planningGraph.expandGraph();
		}
		System.out.println(planningGraph.toString());
		System.out.println(planningGraph.isGoalPossible());
		ParallelPlan parallelPlan = planningGraph.extractSolution();
		System.out.println(parallelPlan);
		return null;
	}
}
