package kplanning.norm;

import javaff.data.Action;
import javaff.planning.STRIPSState;
import kplanning.plan.Plan;

import java.util.List;

public abstract class Norm {
	public boolean isViolationPlan(Plan plan) {
		return isViolationPlan(plan.getStates(), plan.getActions());
	}

	public abstract boolean isViolationPlan(List<STRIPSState> states, List<Action> actions);
}
