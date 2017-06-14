package kplanning.norm;

import javaff.data.Action;
import javaff.data.CompoundLiteral;
import javaff.data.Fact;
import javaff.data.strips.UngroundInstantAction;
import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ConditionalNorm extends Norm {

	// Main info
	private DomainProblemAdapter adapter;
	private NormModality normModality;
	private String name;
	private int cost;

	// Context
	private CompoundLiteral context;
	private Set<CompoundLiteral> groundContext;

	// Action
	private UngroundInstantAction actionTriggerCondition;
	private Set<Action> groundActionTriggerConditions;

	public ConditionalNorm(DomainProblemAdapter adapter, String name, NormModality normModality, int cost, CompoundLiteral context, UngroundInstantAction actionTriggerCondition) {
		this.adapter = adapter;
		this.name = name;
		this.normModality = normModality;
		this.cost = cost;
		this.context = context;
		this.groundContext = adapter.getJavaffParser().getGroundedCompoundLiteral(context);
		this.actionTriggerCondition = actionTriggerCondition;
		this.groundActionTriggerConditions = adapter.getJavaffParser().getGroundActions(actionTriggerCondition);
	}

	/**
	 * Violations - States, actions and plans
	 */

	public boolean isPossibleViolationState(Collection<Fact> facts) {
		for (CompoundLiteral compoundLiteral : groundContext) {
			if(adapter.getJavaffParser().isTrue(facts, compoundLiteral)) {
				return true;
			}
		}
		return false;
	}

	public boolean isPossibleViolationAction(Action performedAction) {
		for (Action action : groundActionTriggerConditions) {
			if (action.equals(performedAction)) {
				return true;
			}
		}
		return false;
	}

	// Is violation state if:
	// 1 - Is a possible violation state
	// 2 - A violation action was actually performed
	public boolean isViolation(STRIPSState state, Action performedAction) {
		return isPossibleViolationAction(performedAction) && isPossibleViolationState(state.getFacts());
	}

	@Override
	public boolean isViolationPlan(List<STRIPSState> states, List<Action> actions) {
		for(int i=0;i<states.size()-1;i++) {
			if(isViolation(states.get(i), actions.get(i))) {
				return true;
			}
		}
		return false;
	}

	/**
	 * Custom
	 */

	// Ground this conditional norm into multiple GroundConditionalNorm
	public Set<GroundConditionalNorm> ground() {
		Set<GroundConditionalNorm> groundConditionalNorms = new HashSet<>();
		for(Action action : groundActionTriggerConditions) {
			for(CompoundLiteral compoundLiteral : groundContext) {
				GroundConditionalNorm groundConditionalNorm = new GroundConditionalNorm(adapter, name, normModality, compoundLiteral, cost, action);
				groundConditionalNorms.add(groundConditionalNorm);
			}
		}
		return groundConditionalNorms;
	}

	/**
	 * Default
	 */

	@Override
	public String toString() {
		return name + "=(" + normModality + "," + context + "," + actionTriggerCondition.name + ", C=" + cost + ")";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
		if (!(obj instanceof ConditionalNorm)) return false;

		ConditionalNorm norm = (ConditionalNorm) obj;
		return norm.groundContext.equals(groundContext) && norm.normModality == normModality && norm.actionTriggerCondition.equals(actionTriggerCondition) && norm.adapter == adapter;
	}

	@Override
	public int hashCode() {
		int h = 438;
		h = 37 * h + context.hashCode();
		h = 37 * h + normModality.hashCode();
		h = 37 * h + actionTriggerCondition.hashCode();
		h = 37 * h + adapter.hashCode();
		return h;
	}
}
