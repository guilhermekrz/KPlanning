package kplanning.planner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.PlanSolution;
import org.jetbrains.annotations.Nullable;

// TODO: make this more generic, to be able to use JavaGP under this (return multiple plans? IDK) - and JavaFF?
public abstract class Planner {
	protected DomainProblemAdapter adapter;

	public Planner(DomainProblemAdapter adapter) {
		this.adapter = adapter;
	}

	@Nullable
	public PlanSolution plan() {
		return plan(false);
	}

	@Nullable
	public PlanSolution plan(boolean foundAllSolutions) {
		return plan(foundAllSolutions, 0);
	}

	@Nullable
	public abstract PlanSolution plan(boolean foundAllSolutions, int levels);
}
