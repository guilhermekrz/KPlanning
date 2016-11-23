package kplanning.planner.normPlanner;

import kplanning.DomainProblemAdapter;
import kplanning.norm.Norm;
import kplanning.plan.PlanSolution;
import kplanning.planner.graphplan.NormPlanningGraph;
import org.jetbrains.annotations.NotNull;
import org.pmw.tinylog.Logger;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.util.Set;

public class GraphplanNormPlanner extends NormPlanner {
	private NormPlanningGraph planningGraph;

	public GraphplanNormPlanner(DomainProblemAdapter adapter, Set<? extends Norm> norms) {
		super(adapter, norms);
		this.planningGraph = new NormPlanningGraph(adapter, norms);
	}

	@Override
	public @NotNull PlanSolution internalPlan(boolean foundAllSolutions, int levels) {
		throw new NotImplementedException();
	}

	@Override
	public @NotNull PlanSolution internalPlanNormCompliant(boolean foundAllSolutions, int levels) {
		return planNormAware(foundAllSolutions, levels, true);
	}

	@Override
	public @NotNull PlanSolution internalPlanNormViolation(boolean foundAllSolutions, int levels) {
		return planNormAware(foundAllSolutions, levels, false);
	}

	private @NotNull PlanSolution planNormAware(boolean foundAllSolutions, int levels, boolean returnNormCompliant) {
		this.planningGraph.setReturnNormCompliantPlans(returnNormCompliant);
		while (true) {
			if (planningGraph.isGoalPossible()) {
				PlanSolution planSolution = planningGraph.extractSolution(foundAllSolutions);
				if (planSolution.hasSolution()) {
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
				return PlanSolution.getNoSolutionPlanSolution(adapter);
			}
			planningGraph.expandGraph();
		}
	}
}