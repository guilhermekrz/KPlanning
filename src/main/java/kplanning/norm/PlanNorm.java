package kplanning.norm;

import kplanning.plan.Plan;

import java.util.HashSet;
import java.util.Set;

public class PlanNorm {
	private Set<Plan> violationPlans;
	private Set<Plan> nonViolationPlans;
	private Set<Norm> norms;

	public PlanNorm(Set<Plan> allPlans, Set<Norm> norms) {
		this.norms = norms;
		violationPlans = new HashSet<>();
		nonViolationPlans = new HashSet<>();
		for(Plan plan : allPlans) {
			boolean isViolationPlan = false;
			for(Norm norm : norms) {
				if(norm.isViolationPlan(plan)) {
					isViolationPlan = true;
					break;
				}
			}
			if(isViolationPlan) {
				violationPlans.add(plan);
			} else {
				nonViolationPlans.add(plan);
			}
		}
	}

	public Set<Plan> getViolationPlans() {
		return violationPlans;
	}

	public Set<Plan> getNonViolationPlans() {
		return nonViolationPlans;
	}

	public Set<Norm> getNorms() {
		return norms;
	}
}
