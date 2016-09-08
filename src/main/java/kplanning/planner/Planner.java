package kplanning.planner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.Plan;

public abstract class Planner {
	protected DomainProblemAdapter adapter;

	public Planner(DomainProblemAdapter adapter) {
		this.adapter = adapter;
	}

	public abstract Plan plan();
}
