package kplanning.planner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.PlanSolution;
import kplanning.util.statistic.MemoryStatistic;
import kplanning.util.statistic.TimeStatistic;
import org.jetbrains.annotations.NotNull;

public abstract class Planner {
	protected DomainProblemAdapter adapter;

	public Planner(DomainProblemAdapter adapter) {
		this.adapter = adapter;
	}

	@NotNull
	public PlanSolution plan() {
		return plan(false);
	}

	@NotNull
	public PlanSolution plan(boolean foundAllSolutions) {
		return plan(foundAllSolutions, 0);
	}

	@NotNull
	public final PlanSolution plan(boolean foundAllSolutions, int levels) {
		MemoryStatistic memoryStatistic = new MemoryStatistic();
		memoryStatistic.init();
		TimeStatistic timeStatistic = new TimeStatistic();
		timeStatistic.init();
		PlanSolution planSolution = internalPlan(foundAllSolutions, levels);
		timeStatistic.stop();
		memoryStatistic.stop();
		planSolution.addStatistic(memoryStatistic);
		planSolution.addStatistic(timeStatistic);
		return planSolution;
	}

	@NotNull
	public abstract PlanSolution internalPlan(boolean foundAllSolutions, int levels);
}
