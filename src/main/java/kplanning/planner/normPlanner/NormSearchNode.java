package kplanning.planner.normPlanner;

import javaff.data.Action;
import javaff.planning.STRIPSState;
import kplanning.norm.Norm;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

abstract class NormSearchNode {
	NormSearchNode previousNode;
	private Action previousAction;
	STRIPSState state;
	private int currentCost;
	Set<? extends Norm> norms;

	NormSearchNode(NormSearchNode previousNode, Action previousAction, STRIPSState state, Set<? extends Norm> norms) {
		this.previousNode = previousNode;
		this.previousAction = previousAction;
		this.state = state;
		if(this.previousNode == null) {
			this.currentCost = 0;
		} else {
			this.currentCost = this.previousNode.getCurrentCost() + 1; // Actions always have cost 1
		}
		this.norms = norms;
	}

	private NormSearchNode getPreviousNode() {
		return previousNode;
	}

	public STRIPSState getState() {
		return state;
	}

	private Action getPreviousAction() {
		return previousAction;
	}

	int getCurrentCost() {
		return currentCost;
	}

	// There is no way that this search will return a non-violation plan
	public abstract boolean isAbsoluteViolation();

	// The plan is currently violation some norm, but in the future it could be a non-violation plan
	public abstract boolean isCurrentlyViolation();

	public List<Action> getActions() {
		List<Action> actions = new ArrayList<>();
		NormSearchNode currentNode = this;
		while(currentNode.getPreviousAction() != null) {
			actions.add(0, currentNode.getPreviousAction());
			currentNode = currentNode.getPreviousNode();
		}
		return actions;
	}

	List<STRIPSState> getStates() {
		List<STRIPSState> states = new ArrayList<>();
		NormSearchNode currentNode = this;
		do {
			states.add(0, currentNode.getState());
			currentNode = currentNode.getPreviousNode();
		} while(currentNode != null);
		return states;
	}

	@Override
	public int hashCode() {
		return state.hashCode();
	}
}
