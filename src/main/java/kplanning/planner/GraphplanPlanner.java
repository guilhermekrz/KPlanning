package kplanning.planner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.PlanSolution;
import kplanning.planner.graphplan.PlanningGraph;
import org.jetbrains.annotations.Nullable;

// Assumption: Close-world
public class GraphplanPlanner {

	protected DomainProblemAdapter adapter;

	public GraphplanPlanner(DomainProblemAdapter adapter) {
		this.adapter = adapter;
	}

	@Nullable
	public PlanSolution plan() {
		return plan(false);
	}

	@Nullable
	public PlanSolution plan(boolean foundAllSolutions) {
		return plan(foundAllSolutions, 0);
	}

	@Nullable
	public PlanSolution plan(boolean foundAllSolutions, int levels) {
		if(!foundAllSolutions && levels > 0) {
			throw new IllegalStateException("If found all solutions is false, then levels should be zero");
		}
		PlanningGraph planningGraph = new PlanningGraph(this.adapter);
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
		PlanningGraph planningGraph = new PlanningGraph(this.adapter);
		while(!planningGraph.hasLevelledOff()) {
			if(planningGraph.isGoalPossible()) {
				planningGraph.extractSolution(false);
			}
			planningGraph.expandGraph();
		}
		return planningGraph;
	}
}
