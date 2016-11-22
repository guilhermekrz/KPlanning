package kplanning.planner.normPlanner;

import kplanning.DomainProblemAdapter;
import kplanning.norm.Norm;
import kplanning.plan.PlanSolution;
import kplanning.planner.Planner;
import org.jetbrains.annotations.Nullable;

import java.util.Set;

public abstract class NormPlanner extends Planner {

	Set<? extends Norm> norms;

	public NormPlanner(DomainProblemAdapter adapter, Set<? extends Norm> norms) {
		super(adapter);
		this.norms = norms;
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
