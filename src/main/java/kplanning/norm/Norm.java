package kplanning.norm;

import kplanning.plan.Plan;

abstract class Norm {
	abstract boolean isViolationPlan(Plan plan);
}
