package kplanning.planner.normPlanner;

import javaff.data.Action;
import javaff.planning.STRIPSState;
import kplanning.norm.Norm;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

abstract class NormSearchNode {
	private static final int DEFAULT_ACTION_COST = 1;

	NormSearchNode previousNode;
	private Action previousAction;
	STRIPSState state;
	private int currentCost;
	private int actionCost;
	int totalNormCost, absoluteNormCost, currentNormCost;
	private boolean hasCurrentCostInTotalCost;
	Set<? extends Norm> norms;

	NormSearchNode(NormSearchNode previousNode, Action previousAction, STRIPSState state, Set<? extends Norm> norms) {
		this.previousNode = previousNode;
		this.previousAction = previousAction;
		this.state = state;
		if(this.previousNode == null) {
			this.actionCost = 1;
		} else {
			this.actionCost = this.previousNode.getActionCost() + DEFAULT_ACTION_COST;
		}
		this.norms = norms;
		this.hasCurrentCostInTotalCost = false;
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

	public int getActionCost() {
		return actionCost;
	}

	public int getTotalNormCost() {
		return totalNormCost;
	}

	public int getAbsoluteNormCost() {
		return absoluteNormCost;
	}

	public int getCurrentNormCost() {
		return currentNormCost;
	}

	public void setCurrentCost(int currentCost) {
		this.currentCost = currentCost;
	}

	int getCurrentCost() {
		return currentCost;
	}

	public boolean hasCurrentCostInTotalCost() {
		return hasCurrentCostInTotalCost;
	}

	public void setHasCurrentCostInTotalCost(boolean hasCurrentCostInTotalCost) {
		this.hasCurrentCostInTotalCost = hasCurrentCostInTotalCost;
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

	public boolean equals(Object obj) {
		if(obj instanceof NormSearchNode) {
			NormSearchNode s = (NormSearchNode)obj;
			return s.state.equals(s.getState());
		} else {
			return false;
		}
	}

	@Override
	public int hashCode() {
		return state.hashCode();
	}

	@Override
	public String toString() {
		return "[" + state.toString() + "," + currentCost + "]";
	}
}
