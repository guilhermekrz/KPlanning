package kplanning.plan;

import graphplan.domain.Operator;
import javaff.data.Action;
import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;

import java.util.ArrayList;
import java.util.List;

public class Plan {
	private List<Action> actions;
	private List<STRIPSState> states;

	public Plan(List<Operator> operators, DomainProblemAdapter adapter) {
		this.actions = new ArrayList<>();
		this.states = new ArrayList<>();

		STRIPSState currentState = adapter.getJavaffParser().getCompleteInitState();
		this.states.add(currentState);

		for (Operator op : operators) {
			Action action = adapter.getGraphplanJavaffConverter().getAction(op);
			this.actions.add(action);
			currentState = getNextState(currentState, action);
			this.states.add(currentState);
		}
	}

	// Used only for test purposes
	public static Plan newTestInstance(DomainProblemAdapter adapter, String... stringActions) {
		List<Action> actions = new ArrayList<>();
		for(String action : stringActions) {
			actions.add(adapter.getJavaffParser().getAction(action));
		}
		return new Plan(true, actions, adapter);
	}

	private Plan(boolean isTest, List<Action> actions, DomainProblemAdapter adapter) {
		this.actions = new ArrayList<>();
		this.states = new ArrayList<>();

		STRIPSState currentState = adapter.getJavaffParser().getCompleteInitState();
		this.states.add(currentState);

		for (Action action : actions) {
			this.actions.add(action);
			currentState = getNextState(currentState, action);
			this.states.add(currentState);
		}
	}

	public List<Action> getActions() {
		return actions;
	}

	public List<STRIPSState> getStates() {
		return states;
	}

	public List<STRIPSState> getIntermediateStates() {
		return states.subList(0,states.size()-1);
	}

	// Assuming that this action is applicable to current state
	private STRIPSState getNextState(STRIPSState currentState, Action action) {
		return (STRIPSState) currentState.apply(action);
	}

	@Override
	public String toString() {
		return actions.toString();
	}
}
