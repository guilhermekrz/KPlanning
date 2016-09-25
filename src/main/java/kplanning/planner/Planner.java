package kplanning.planner;

import kplanning.DomainProblemAdapter;
import kplanning.plan.Plan;

// TODO: make this more generic, to be able to use JavaGP under this (return multiple plans? IDK) - and JavaFF?
public abstract class Planner {
	protected DomainProblemAdapter adapter;

	public Planner(DomainProblemAdapter adapter) {
		this.adapter = adapter;
	}

	public abstract Plan plan();
}
