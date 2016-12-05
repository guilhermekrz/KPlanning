package kplanning.norm;

import javaff.data.Action;
import javaff.data.CompoundLiteral;
import javaff.data.Fact;
import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;

import java.util.Collection;
import java.util.List;

public class GroundConditionalNorm extends Norm implements GroundNorm {
	private DomainProblemAdapter adapter;
	private String name;
	private NormModality normModality;
	private CompoundLiteral compoundLiteral;
	private int cost;
	private Action action;

	public GroundConditionalNorm(DomainProblemAdapter adapter, String name, NormModality normModality, CompoundLiteral compoundLiteral, int cost, Action action) {
		this.adapter = adapter;
		this.name = name;
		this.normModality = normModality;
		this.compoundLiteral = compoundLiteral;
		this.cost = cost;
		this.action = action;
	}

	public String getName() {
		return name;
	}

	public NormModality getNormModality() {
		return normModality;
	}

	public CompoundLiteral getCompoundLiteral() {
		return compoundLiteral;
	}

	public int getCost() {
		return cost;
	}

	public Action getAction() {
		return action;
	}

	/**
	 * Violations - States, actions and plans
	 */

	public boolean isPossibleViolationState(Collection<Fact> facts) {
		return adapter.getJavaffParser().isTrue(facts, compoundLiteral);
	}

	public boolean isPossibleViolationAction(Action performedAction) {
		return this.action.equals(performedAction);
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

	@Override
	public String toString() {
		return name + "=(" + normModality + "," + compoundLiteral + "," + action + ", C=" + cost + ")";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
		if (!(obj instanceof GroundConditionalNorm)) return false;

		GroundConditionalNorm norm = (GroundConditionalNorm) obj;
		return norm.compoundLiteral.equals(compoundLiteral) && norm.normModality == normModality && norm.action.equals(action) && norm.cost == cost && norm.adapter == adapter;
	}

	@Override
	public int hashCode() {
		int h = 0;
		h = 37 * h + compoundLiteral.hashCode();
		h = 37 * h + normModality.hashCode();
		h = 37 * h + action.hashCode();
		h = 37 * h + adapter.hashCode();
		return h;
	}

	@Override
	public String toFile(String name, int cost) {
		return "ground;" + name + ";"
				+ getNormModality() + ";"
				+ getCompoundLiteral().getFacts().toString().replace("[", "").replace("]", "") + ";"
				+ getAction() + ";"
				+ cost;
	}
}
