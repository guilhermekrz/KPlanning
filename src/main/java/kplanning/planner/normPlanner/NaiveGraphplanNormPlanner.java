package kplanning.planner.normPlanner;

import kplanning.DomainProblemAdapter;
import kplanning.norm.Norm;
import kplanning.plan.PlanSolution;
import kplanning.planner.graphplan.PlanningGraph;
import org.jetbrains.annotations.NotNull;
import org.pmw.tinylog.Logger;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.util.Set;

public class NaiveGraphplanNormPlanner extends NormPlanner {
	private PlanningGraph planningGraph;

	public NaiveGraphplanNormPlanner(DomainProblemAdapter adapter, Set<? extends Norm> norms) {
		super(adapter, norms);
		this.planningGraph = new PlanningGraph(adapter);
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
		while(true) {
			if(planningGraph.isGoalPossible()) {
				// We need to try to extract allPossiblePlans, even if we want just one plan.
				// This is because the first found plan can be not the one we want (accordingly to "returnNormCompliant" parameter)
				PlanSolution planSolution = planningGraph.extractSolution(true);
				if(planSolution.hasSolution()) {
					PlanSolution filteredPlans = planSolution.filterPlansBasedOnNorms(norms, returnNormCompliant);
					if(filteredPlans.hasSolution()) {
						if(levels == 0) {
							if(foundAllSolutions) {
								return filteredPlans;
							} else {
								return filteredPlans.getSinglePlanSolution();
							}
						} else {
							while(levels > 0) {
								planningGraph.expandGraph();
								levels--;
							}
							PlanSolution planSolutionLevel = planningGraph.extractSolution(true);
							if(!planSolutionLevel.hasSolution()) {
								throw new IllegalStateException("Plan Solution Level should never have no solutions, because in a previous level we already found one");
							}
							PlanSolution filteredPlansSolutionLevel = planSolutionLevel.filterPlansBasedOnNorms(norms, returnNormCompliant);
							if(!filteredPlansSolutionLevel.hasSolution()) {
								throw new IllegalStateException("Plan Solution Level should never have no solutions, because in a previous level we already found one");
							}
							if(foundAllSolutions) {
								return filteredPlansSolutionLevel;
							} else {
								return filteredPlansSolutionLevel.getSinglePlanSolution();
							}
						}
					} else {
						Logger.debug("Found solution is not the desired norm compliant/violation. Continuing the search...");
					}
				}
			}
			if(planningGraph.hasLevelledOff()) {
				return PlanSolution.getNoSolutionPlanSolution(adapter);
			}
			planningGraph.expandGraph();
		}
	}
}
