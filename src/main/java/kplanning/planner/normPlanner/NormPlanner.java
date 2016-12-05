package kplanning.planner.normPlanner;

import kplanning.DomainProblemAdapter;
import kplanning.norm.Norm;
import kplanning.plan.PlanSolution;
import kplanning.planner.Planner;
import kplanning.util.statistic.MemoryStatistic;
import kplanning.util.statistic.TimeStatistic;
import org.jetbrains.annotations.NotNull;

import java.time.Duration;
import java.util.Set;
import java.util.concurrent.*;

public abstract class NormPlanner extends Planner {

	private static final int TIMEOUT_IN_SECONDS = 90;
	public enum NormPlannerType {
		NORM_COMPLIANT, NORM_VIOLATION, NORM_MINIMUM_COST
	}

	Set<? extends Norm> norms;

	// Temp variable
	private PlanSolution planSolution;

	NormPlanner(DomainProblemAdapter adapter, Set<? extends Norm> norms) {
		super(adapter);
		this.norms = norms;
	}

	// Return norm compliant plan
	@NotNull
	public PlanSolution planNorm(NormPlannerType normPlannerType) {
		return planNorm(normPlannerType, false);
	}

	@NotNull
	private PlanSolution planNorm(NormPlannerType normPlannerType, boolean foundAllSolutions) {
		return planNorm(normPlannerType, foundAllSolutions, 0);
	}

	@NotNull
	private PlanSolution planNorm(NormPlannerType normPlannerType, boolean foundAllSolutions, int levels) {
		MemoryStatistic memoryStatistic = new MemoryStatistic();
		memoryStatistic.init();
		TimeStatistic timeStatistic = new TimeStatistic();
		timeStatistic.init();

		// With timeout
		final Duration timeout = Duration.ofSeconds(TIMEOUT_IN_SECONDS);
		ExecutorService executor = Executors.newSingleThreadExecutor();

		final Future handler = executor.submit(new Callable() {
			@Override
			public Void call() throws Exception {
				NormPlanner.this.planSolution = internalPlanNorm(normPlannerType, foundAllSolutions, levels);
				return null;
			}
		});

		try {
			handler.get(timeout.toMillis(), TimeUnit.MILLISECONDS);
		} catch (InterruptedException | ExecutionException | TimeoutException | OutOfMemoryError e) {
			handler.cancel(true);
			e.printStackTrace();
			this.planSolution = PlanSolution.getNoSolutionPlanSolution(adapter);
			this.planSolution.setTimeout(true);
			System.out.println("Timeout: " + timeStatistic.getCurrentDiff());
		}

		executor.shutdownNow();
		// With timeout

		timeStatistic.stop();
		memoryStatistic.stop();
		planSolution.addStatistic(memoryStatistic);
		planSolution.addStatistic(timeStatistic);

		return planSolution;
	}

	@NotNull
	public abstract PlanSolution internalPlanNorm(NormPlannerType normPlannerType, boolean foundAllSolutions, int levels);
}
