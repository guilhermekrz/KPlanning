package kplanning.planner.normPlanner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.PlanSolution;
import kplanning.planner.graphplan.NormPlanningGraph;
import org.jetbrains.annotations.Nullable;
import org.pmw.tinylog.Logger;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

public class ConditionalNormPlanner extends NormPlanner {
	private NormPlanningGraph planningGraph;

	public ConditionalNormPlanner(DomainProblemAdapter adapter) {
		super(adapter);
		this.planningGraph = new NormPlanningGraph(adapter);
	}

	@Override
	public @Nullable PlanSolution plan(boolean foundAllSolutions, int levels) {
		throw new NotImplementedException();
	}

	@Override
	public @Nullable PlanSolution planNormCompliant(boolean foundAllSolutions, int levels) {
		return planNormAware(foundAllSolutions, levels, true);
	}

	@Override
	public @Nullable PlanSolution planNormViolation(boolean foundAllSolutions, int levels) {
		return planNormAware(foundAllSolutions, levels, false);
	}

	private @Nullable PlanSolution planNormAware(boolean foundAllSolutions, int levels, boolean returnNormCompliant) {
		this.planningGraph.setReturnNormCompliantPlans(returnNormCompliant);
		while (true) {
			if (planningGraph.isGoalPossible()) {
				PlanSolution planSolution = planningGraph.extractSolution(foundAllSolutions);
				if (planSolution != null) {
					if (levels == 0) {
						return planSolution;
					} else {
						while (levels > 0) {
							planningGraph.expandGraph();
							levels--;
						}
						return planningGraph.extractSolution(foundAllSolutions);
					}
				}
			}
			if (planningGraph.hasLevelledOff()) {
				Logger.debug("Graph has levelled off and we did not found any solution");
				return null;
			}
			planningGraph.expandGraph();
		}
	}
}