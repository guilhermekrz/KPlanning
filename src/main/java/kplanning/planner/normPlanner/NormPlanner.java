package kplanning.planner.normPlanner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.PlanSolution;
import kplanning.planner.Planner;
import org.jetbrains.annotations.Nullable;

public abstract class NormPlanner extends Planner {
	public NormPlanner(DomainProblemAdapter adapter) {
		super(adapter);
	}

	// Return norm compliant plan
	@Nullable
	public PlanSolution planNormCompliant() {
		return planNormCompliant(false);
	}

	@Nullable
	public PlanSolution planNormCompliant(boolean foundAllSolutions) {
		return planNormCompliant(foundAllSolutions, 0);
	}

	@Nullable
	public abstract PlanSolution planNormCompliant(boolean foundAllSolutions, int levels);

	// Return norm violation plan
	@Nullable
	public PlanSolution planNormViolation() {
		return planNormViolation(false);
	}

	@Nullable
	public PlanSolution planNormViolation(boolean foundAllSolutions) {
		return planNormViolation(foundAllSolutions, 0);
	}

	@Nullable
	public abstract PlanSolution planNormViolation(boolean foundAllSolutions, int levels);
}
