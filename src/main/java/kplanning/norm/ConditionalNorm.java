package kplanning.norm;

import javaff.data.Action;
import javaff.data.CompoundLiteral;
import javaff.data.strips.UngroundInstantAction;
import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;
import kplanning.plan.Plan;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public class ConditionalNorm extends Norm {
	private DomainProblemAdapter adapter;
	private NormModality normModality;

	// Context
	private CompoundLiteral context;
	private Set<CompoundLiteral> groundContext;

	// Action
	private UngroundInstantAction actionTriggerCondition;
	private Set<Action> groundActionTriggerConditions;

	public ConditionalNorm(DomainProblemAdapter adapter, NormModality normModality, CompoundLiteral context, UngroundInstantAction actionTriggerCondition) {
		this.adapter = adapter;
		this.normModality = normModality;
		this.context = context;
		this.groundContext = adapter.getJavaffParser().getGroundedCompoundLiteral(context);
		this.actionTriggerCondition = actionTriggerCondition;
		this.groundActionTriggerConditions = adapter.getJavaffParser().getGroundActions(actionTriggerCondition);
	}

	public Set<STRIPSState> getAllPossibleViolationStates(Set<STRIPSState> allPossibleStates) {
		return allPossibleStates.stream().filter(this::isPossibleViolationState).collect(Collectors.toSet());
	}

	// A state s is a possible violation of this norm if:
	// 1 - Contains all positive literals of context
	// 2 - Does not contain any negative literal from context
	boolean isPossibleViolationState(STRIPSState state) {
		for (CompoundLiteral compoundLiteral : groundContext) {
			if (state.isTrue(compoundLiteral)) {
				// Check if we are able to perform this action in this state (only if this norm is a prohibition norm; otherwise, we need to include this state, as it will always cause a violation)
				if (normModality == NormModality.PROHIBITION) {
					for (Action action : groundActionTriggerConditions) {
						if (action.isApplicable(state)) {
							return true;
						}
					}
				} else {
					return true;
				}
			}
		}
		return false;
	}

	// Is violation state if:
	// 1 - Is a possible violation state
	// 2 - A violation action was actually performed
	public boolean isViolationState(STRIPSState state, Action performedAction) {
		if(isPossibleViolationState(state)) {
			for (Action action : groundActionTriggerConditions) {
				if (action.equals(performedAction)) {
					return true;
				}
			}
		}
		return false;
	}

	@Override
	public boolean isViolationPlan(Plan plan) {
		List<STRIPSState> states = plan.getStates();
		List<Action> actions = plan.getActions();
		for(int i=0;i<states.size()-1;i++) {
			if(isViolationState(states.get(i), actions.get(i))) {
				return true;
			}
		}
		return false;
	}

	@Override
	public String toString() {
		return "n=(" + normModality + "," + context + "," + actionTriggerCondition.name + ")";
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
		int h = 0;
		h = 37 * h + context.hashCode();
		h = 37 * h + normModality.hashCode();
		h = 37 * h + actionTriggerCondition.hashCode();
		h = 37 * h + adapter.hashCode();
		return h;
	}
}
