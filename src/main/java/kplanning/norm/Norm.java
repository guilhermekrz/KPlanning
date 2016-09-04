package kplanning.norm;

import kplanning.plan.Plan;

interface Norm {
	boolean isViolationPlan(Plan plan);
}
