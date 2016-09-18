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
		PlanningGraph planningGraph = new PlanningGraph(this.adapter);
		while(true) {
			if(planningGraph.isGoalPossible()) {
				PlanSolution planSolution = planningGraph.extractSolution(foundAllSolutions);
				if(planSolution != null) {
					return planSolution;
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
