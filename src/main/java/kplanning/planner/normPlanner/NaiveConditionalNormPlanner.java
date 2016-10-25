package kplanning.planner.normPlanner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.PlanSolution;
import kplanning.planner.graphplan.PlanningGraph;
import org.jetbrains.annotations.Nullable;
import org.pmw.tinylog.Logger;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

public class NaiveConditionalNormPlanner extends NormPlanner {
	private PlanningGraph planningGraph;

	public NaiveConditionalNormPlanner(DomainProblemAdapter adapter) {
		super(adapter);
		this.planningGraph = new PlanningGraph(adapter);
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
		while(true) {
			if(planningGraph.isGoalPossible()) {
				// We need to try to extract allPossiblePlans, even if we want just one plan.
				// This is because the first found plan can be not the one we want (accordingly to "returnNormCompliant" parameter)
				PlanSolution planSolution = planningGraph.extractSolution(true);
				if(planSolution != null) {
					PlanSolution filteredPlans = planSolution.filterPlansBasedOnNorms(adapter.getNormAdapter().getConditionalNorms(), returnNormCompliant);
					if(filteredPlans != null) {
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
							if(planSolutionLevel == null) {
								throw new IllegalStateException("Plan Solution Level should never be null, because in a previous level we already found one");
							}
							PlanSolution filteredPlansSolutionLevel = planSolutionLevel.filterPlansBasedOnNorms(adapter.getNormAdapter().getConditionalNorms(), returnNormCompliant);
							if(filteredPlansSolutionLevel == null) {
								throw new IllegalStateException("Plan Solution Level should never be null, because in a previous level we already found one");
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
				return null;
			}
			planningGraph.expandGraph();
		}
	}
}
