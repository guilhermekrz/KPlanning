package kplanning.planner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.PlanSolution;
import kplanning.planner.graphplan.PlanningGraph;

// Assumption: Close-world
public class GraphplanPlanner extends Planner {

	private PlanningGraph planningGraph;

	public GraphplanPlanner(DomainProblemAdapter adapter) {
		super(adapter);
		this.planningGraph = new PlanningGraph(adapter);
	}

	@Override
	public PlanSolution plan(boolean foundAllSolutions, int levels) {
		if(!foundAllSolutions && levels > 0) {
			throw new IllegalStateException("If found all solutions is false, then levels should be zero");
		}
		while(true) {
			if(planningGraph.isGoalPossible()) {
				PlanSolution planSolution = planningGraph.extractSolution(foundAllSolutions);
				if(planSolution != null) {
					if(levels == 0) {
						return planSolution;
					} else {
						while(levels > 0) {
							planningGraph.expandGraph();
							levels--;
						}
						return planningGraph.extractSolution(foundAllSolutions);
					}
				}
			}
			if(planningGraph.hasLevelledOff()) {
				return null;
			}
			planningGraph.expandGraph();
		}
	}

	public PlanningGraph getLevelledOffPlanningGraph() {
		while(!planningGraph.hasLevelledOff()) {
			if(planningGraph.isGoalPossible()) {
				planningGraph.extractSolution(false);
			}
			planningGraph.expandGraph();
		}
		return planningGraph;
	}
}
