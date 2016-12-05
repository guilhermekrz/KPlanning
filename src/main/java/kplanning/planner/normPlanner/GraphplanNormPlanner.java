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

	public @NotNull PlanSolution internalPlanNorm(NormPlannerType normPlannerType, boolean foundAllSolutions, int levels) {
		if(normPlannerType.equals(NormPlannerType.NORM_COMPLIANT)) {
			this.planningGraph.setReturnNormCompliantPlans(true);
		} else if(normPlannerType.equals(NormPlannerType.NORM_VIOLATION)) {
			this.planningGraph.setReturnNormCompliantPlans(false);
		} else {
			throw new NotImplementedException();
		}
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