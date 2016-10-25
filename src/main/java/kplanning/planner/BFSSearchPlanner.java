package kplanning.planner;

import javaff.data.Action;
import kplanning.DomainProblemAdapter;
import kplanning.bitset.BitSetAction;
import kplanning.bitset.BitSetFact;
import kplanning.plan.Plan;
import kplanning.plan.PlanSolution;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.util.*;

public class BFSSearchPlanner extends Planner {

	public BFSSearchPlanner(DomainProblemAdapter adapter) {
		super(adapter);
	}

	@Override
	public PlanSolution plan(boolean foundAllSolutions, int levels) {
		if(foundAllSolutions || levels > 0) {
			// TODO: implement found all solutions to bfs search
			throw new NotImplementedException();
		}

		Set<BitSetAction> bitSetActions = adapter.getBitSetAdapter().getActions();
		BitSetFact bitSetGoalFact = adapter.getBitSetAdapter().getBitSetFact(adapter.getJavaffParser().getGroundProblem().getGoal());

		BitSet completeInitState = adapter.getBitSetAdapter().getCompleteInitState();
		SearchNode searchNode = new SearchNode(completeInitState);
		if(bitSetGoalFact.isTrue(completeInitState)) {
			return solution(searchNode);
		}

		List<SearchNode> frontier = new ArrayList<>(); frontier.add(searchNode);
		Set<BitSet> explored = new HashSet<>();

		while(true) {
			if(frontier.isEmpty()) {
				return null;
			}
			searchNode = frontier.remove(0);
			explored.add(searchNode.getState());
			for(BitSetAction bitSetAction : bitSetActions) {
				if(bitSetAction.isApplicable(searchNode.getState())) {
					SearchNode childNode = new SearchNode(searchNode, bitSetAction, bitSetAction.applyActionToState(searchNode.getState()));
					if(!frontier.contains(childNode) && !explored.contains(childNode.getState())) {
						if(bitSetGoalFact.isTrue(childNode.getState())) {
							return solution(childNode);
						}
						frontier.add(childNode);
					}
				}
			}
		}
	}

	private PlanSolution solution(SearchNode searchNode) {
		List<Action> actions = new ArrayList<>();
		SearchNode currentNode = searchNode;
		while(currentNode.getPreviousAction() != null) {
			actions.add(0, currentNode.getPreviousAction().getAction());
			currentNode = currentNode.getPreviousNode();
		}
		return new PlanSolution(adapter, Plan.newPlanFromActions(actions, adapter));
	}

	private class SearchNode {
		private SearchNode previousNode;
		private BitSetAction previousAction;
		private BitSet state;

		SearchNode(BitSet state) {
			this.state = state;
		}

		SearchNode(SearchNode previousNode, BitSetAction previousAction, BitSet state) {
			this.previousNode = previousNode;
			this.previousAction = previousAction;
			this.state = state;
		}

		SearchNode getPreviousNode() {
			return previousNode;
		}

		BitSet getState() {
			return state;
		}

		BitSetAction getPreviousAction() {
			return previousAction;
		}

		@Override
		public int hashCode() {
			return state.hashCode();
		}
	}
}
