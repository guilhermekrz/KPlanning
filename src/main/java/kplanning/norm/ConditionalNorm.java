package kplanning.norm;

import javaff.data.Action;
import javaff.data.CompoundLiteral;
import javaff.data.Fact;
import javaff.data.strips.Not;
import javaff.data.strips.Proposition;
import javaff.data.strips.UngroundInstantAction;
import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;
import kplanning.plan.Plan;

import java.util.*;
import java.util.stream.Collectors;

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
	 * Getters
	 */

	public Set<Action> getGroundActionTriggerConditions() {
		return groundActionTriggerConditions;
	}

	public Set<STRIPSState> getAllPossibleViolationStates(Set<STRIPSState> allPossibleStates) {
		return allPossibleStates.stream().filter(this::isPossibleViolationState).collect(Collectors.toSet());
	}

	/**
	 * Violations - States, actions and plans
	 */

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

	public boolean isPossibleViolationState(Collection<Fact> facts) {
		for (CompoundLiteral compoundLiteral : groundContext) {
			if(isTrue(facts, compoundLiteral)) {
				return true;
			}
		}
		return false;
	}

	private boolean isTrue(Collection<Fact> facts, CompoundLiteral compoundLiteral) {
		Iterator var2 = compoundLiteral.getCompoundFacts().iterator();

		boolean res;
		do {
			if(!var2.hasNext()) {
				return true;
			}

			Fact c = (Fact)var2.next();

			if(c.isStatic()) {
				res = true;
			} else if(c instanceof Proposition) {
				res = facts.contains(c);
			} else if(c instanceof Not) {
				res = facts.contains(c);
			} else {
				throw new IllegalArgumentException("STRIPSStates can only check whether Propositions or Nots are true");
			}
		} while(res);
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
	public boolean isViolationState(STRIPSState state, Action performedAction) {
		return isPossibleViolationAction(performedAction) && isPossibleViolationState(state);
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

	/**
	 * Custom
	 */

	// Ground this conditional norm into multiple GroundConditionalNorm
	public Set<GroundConditionalNorm> ground() {
		Set<GroundConditionalNorm> groundConditionalNorms = new HashSet<>();
		for(Action action : groundActionTriggerConditions) {
			Set<Fact> preconditions = action.getPreconditions();
			Set<Fact> truePreconditions = new HashSet<>();
			for(Fact pre : preconditions) {
				if(pre instanceof Not) {
					truePreconditions.add(((Not) pre).getLiteral());
				} else {
					truePreconditions.add(pre);
				}
			}
			for(CompoundLiteral compoundLiteral : groundContext) {
				Set<Fact> trueFacts = new HashSet<>(truePreconditions);
				trueFacts.addAll(compoundLiteral.getFacts());
				GroundConditionalNorm groundConditionalNorm = new GroundConditionalNorm(adapter, name, normModality, trueFacts, cost, action);
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
		int h = 0;
		h = 37 * h + context.hashCode();
		h = 37 * h + normModality.hashCode();
		h = 37 * h + actionTriggerCondition.hashCode();
		h = 37 * h + adapter.hashCode();
		return h;
	}
}
