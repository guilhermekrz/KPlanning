package kplanning.planner.normPlanner;

import kplanning.DomainProblemAdapter;
import kplanning.norm.Norm;
import kplanning.plan.PlanSolution;
import kplanning.planner.Planner;
import kplanning.util.statistic.TimeStatistic;
import org.jetbrains.annotations.NotNull;

import java.util.Set;

public abstract class NormPlanner extends Planner {

	Set<? extends Norm> norms;

	NormPlanner(DomainProblemAdapter adapter, Set<? extends Norm> norms) {
		super(adapter);
		this.norms = norms;
	}

	// Return norm compliant plan
	@NotNull
	public PlanSolution planNormCompliant() {
		return planNormCompliant(false);
	}

	@NotNull
	private PlanSolution planNormCompliant(boolean foundAllSolutions) {
		return planNormCompliant(foundAllSolutions, 0);
	}

	@NotNull
	private PlanSolution planNormCompliant(boolean foundAllSolutions, int levels) {
		TimeStatistic timeStatistic = new TimeStatistic();
		timeStatistic.init();
		PlanSolution planSolution = internalPlanNormCompliant(foundAllSolutions, levels);
		timeStatistic.stop();
		planSolution.addStatistic(timeStatistic);
		return planSolution;
	}

	@NotNull
	public abstract PlanSolution internalPlanNormCompliant(boolean foundAllSolutions, int levels);

	// Return norm violation plan
	@NotNull
	public PlanSolution planNormViolation() {
		return planNormViolation(false);
	}

	@NotNull
	private PlanSolution planNormViolation(boolean foundAllSolutions) {
		return planNormViolation(foundAllSolutions, 0);
	}

	@NotNull
	private PlanSolution planNormViolation(boolean foundAllSolutions, int levels) {
		TimeStatistic timeStatistic = new TimeStatistic();
		timeStatistic.init();
		PlanSolution planSolution = internalPlanNormViolation(foundAllSolutions, levels);
		timeStatistic.stop();
		planSolution.addStatistic(timeStatistic);
		return planSolution;
	}

	@NotNull
	public abstract PlanSolution internalPlanNormViolation(boolean foundAllSolutions, int levels);
}
