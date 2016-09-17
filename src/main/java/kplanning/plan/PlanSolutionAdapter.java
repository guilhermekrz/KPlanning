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
		for(List<Operator> operators : plans) {
			allPlans.add(Plan.newPlanFromOperators(operators, adapter));
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

	@Override
	public String toString() {
		String s = "Found " + allPlans.size() + " plans:\n";
		for(Plan plan : allPlans) {
			s += "\t" + plan + "\n";
		}
		return s;
	}
}
