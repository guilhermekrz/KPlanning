package kplanning.plan;

import graphplan.PlanSolution;
import graphplan.domain.Operator;
import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class PlanSolutionAdapter {
	private Set<Plan> allPlans;

	public PlanSolutionAdapter(PlanSolution planSolution, DomainProblemAdapter adapter) {
		allPlans = new HashSet<>();
		Set<List<Operator>> plans = planSolution.getAllPlans();
		for(List<Operator> plan:plans) {
			allPlans.add(new Plan(plan, adapter));
		}
	}

	public Set<Plan> getAllPlans() {
		return allPlans;
	}

	public Set<STRIPSState> getAllIntermediateStatesFromAllPlans() {
		Set<STRIPSState> set = new HashSet<>();
		for(Plan plan:allPlans) {
			set.addAll(plan.getIntermediateStates());
		}
		return set;
	}

	public Set<Set<STRIPSState>> getIntermediateStatesFromAllPlans() {
		Set<Set<STRIPSState>> set = new HashSet<>();
		for(Plan plan:allPlans) {
			set.add(new HashSet<>(plan.getIntermediateStates()));
		}
		return set;
	}
}