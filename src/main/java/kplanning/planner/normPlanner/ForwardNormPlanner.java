package kplanning.planner.normPlanner;

import fr.uga.pddl4j.parser.Connective;
import javaff.data.Action;
import javaff.data.GroundFact;
import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;
import kplanning.norm.LtlNorm;
import kplanning.plan.Plan;
import kplanning.plan.PlanSolution;
import org.jetbrains.annotations.Nullable;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.util.*;

public class ForwardNormPlanner extends NormPlanner {

	public ForwardNormPlanner(DomainProblemAdapter adapter) {
		super(adapter);
	}

	@Override
	public @Nullable PlanSolution planNormCompliant(boolean foundAllSolutions, int levels) {
		return planNormAware(foundAllSolutions, levels, true);
	}

	@Override
	public @Nullable PlanSolution planNormViolation(boolean foundAllSolutions, int levels) {
		return planNormAware(foundAllSolutions, levels, false);
	}

	@Override
	public @Nullable PlanSolution plan(boolean foundAllSolutions, int levels) {
		throw new NotImplementedException();
	}

	// Solution from the other paper is quite clever, because it uses the already implemented mechanism to perform this...
	private class NormKeeper {

		Set<LtlNorm> ltlNorms;
		Set<LtlNorm> curretlyiolationNorms;
		Set<LtlNorm> abolsuteViolationNorms;

		NormKeeper() {
			this(true);
		}

		private NormKeeper(boolean init) {
			if(init) {
				ltlNorms = new HashSet<>();
				curretlyiolationNorms = new HashSet<>();
				abolsuteViolationNorms = new HashSet<>();

				for(LtlNorm ltlNorm : adapter.getNormAdapter().getLtlNorms()) {
					if(ltlNorm.getConnective().equals(Connective.ALWAYS)) {
						ltlNorms.add(ltlNorm);
					} else if(ltlNorm.getConnective().equals(Connective.SOMETIME)) {
						curretlyiolationNorms.add(ltlNorm);
					}
				}
			}
		}

		void update(STRIPSState newState) {
			// Add to pending violation
			for(LtlNorm ltlNorm : ltlNorms) {
				if(ltlNorm.getConnective().equals(Connective.ALWAYS)) {
					curretlyiolationNorms.add(ltlNorm);
				}
			}

			// Update norms
			Set<LtlNorm> newAbsoluteViolations = new HashSet<>();
			Set<LtlNorm> newNotViolations = new HashSet<>();
			for(LtlNorm ltlNorm : curretlyiolationNorms) {
				if(ltlNorm.getConnective().equals(Connective.ALWAYS)) {
					if(ltlNorm.isTrue(newState)) {
						newNotViolations.add(ltlNorm);
					} else {
						newAbsoluteViolations.add(ltlNorm);
					}
				} else if(ltlNorm.getConnective().equals(Connective.SOMETIME)) {
					if(ltlNorm.isTrue(newState)) {
						newNotViolations.add(ltlNorm);
					}
				}
			}

			curretlyiolationNorms.removeAll(newAbsoluteViolations);
			curretlyiolationNorms.removeAll(newNotViolations);
			abolsuteViolationNorms.addAll(newAbsoluteViolations);
		}

		boolean isCurrentlyViolation() {
			return isAbsoluteViolation() || !curretlyiolationNorms.isEmpty();
		}

		boolean isAbsoluteViolation() {
			return !abolsuteViolationNorms.isEmpty();
		}

		@Override
		protected Object clone() {
			NormKeeper normKeeper = new NormKeeper(false);
			normKeeper.ltlNorms = new HashSet<>(this.ltlNorms);
			normKeeper.abolsuteViolationNorms = new HashSet<>(this.abolsuteViolationNorms);
			normKeeper.curretlyiolationNorms = new HashSet<>(this.curretlyiolationNorms);
			return normKeeper;
		}

		@Override
		public String toString() {
			return "Norm Keeper:\n\tCurrently violation norms:" + curretlyiolationNorms + "\n\tAbsolute violation norms:" + abolsuteViolationNorms;
		}
	}

	private @Nullable PlanSolution planNormAware(boolean foundAllSolutions, int levels, boolean returnNormCompliant) {
		if(foundAllSolutions || levels > 0) {
			// TODO: implement found all solutions to bfs search
			throw new NotImplementedException();
		}

		NormKeeper normKeeper = new NormKeeper();

		Set<Action> actions = adapter.getJavaffParser().getGroundProblem().getActions();
		GroundFact goalGroundFact = adapter.getJavaffParser().getGroundProblem().getGoal();

		STRIPSState completeInitState = adapter.getJavaffParser().getCompleteInitState();
		SearchNode searchNode = new SearchNode(completeInitState, normKeeper);
		if(goalGroundFact.isTrue(completeInitState)) {
			return solution(searchNode);
		}

		PriorityQueue<SearchNode> frontier = new PriorityQueue<>((s1, s2) -> Integer.compare(s1.getCurrentCost(), s2.getCurrentCost()));
		frontier.add(searchNode);

		Set<STRIPSState> explored = new HashSet<>();

		while(true) {
			if(frontier.isEmpty()) {
				return null;
			}
			searchNode = frontier.remove();
			explored.add(searchNode.getState());
			for(Action action : actions) {
				if(action.isApplicable(searchNode.getState())) {
					STRIPSState newState = (STRIPSState) searchNode.getState().clone();
					action.apply(newState);

					SearchNode childNode = new SearchNode(searchNode, action, newState, searchNode.getCurrentCost() + 1, searchNode.getCloneNormKeeper()); // Actions always have cost 1
					if (!frontier.contains(childNode) && !explored.contains(childNode.getState())) {
						childNode.getNormKeeper().update(newState);

						// If norm compliant
						//noinspection SimplifiableBooleanExpression
						if(returnNormCompliant) {
							if(!childNode.getNormKeeper().isAbsoluteViolation()) {
								if (goalGroundFact.isTrue(childNode.getState()) && !childNode.getNormKeeper().isCurrentlyViolation()) {
									return solution(childNode);
								}
								frontier.add(childNode);
							}
						} else {
							// !returnNormCompliant
							if (goalGroundFact.isTrue(childNode.getState()) && childNode.getNormKeeper().isCurrentlyViolation()) {
								return solution(childNode);
							}
							frontier.add(childNode);
						}
					}
				}
			}
		}
	}

	private PlanSolution solution(SearchNode searchNode) {
		List<Action> actions = new ArrayList<>();
		SearchNode currentNode = searchNode;
		while(currentNode.getPreviousAction() != null) {
			actions.add(0, currentNode.getPreviousAction());
			currentNode = currentNode.getPreviousNode();
		}
		System.out.println(searchNode.getNormKeeper());
		return new PlanSolution(adapter, Plan.newPlanFromActions(actions, adapter));
	}

	private class SearchNode {
		private SearchNode previousNode;
		private Action previousAction;
		private STRIPSState state;
		private int currentCost;
		private NormKeeper normKeeper;

		SearchNode(STRIPSState state, NormKeeper normKeeper) {
			this(null, null, state, 0, normKeeper);
		}

		SearchNode(SearchNode previousNode, Action previousAction, STRIPSState state, int currentCost, NormKeeper normKeeper) {
			this.previousNode = previousNode;
			this.previousAction = previousAction;
			this.state = state;
			this.currentCost = currentCost;
			this.normKeeper = normKeeper;
		}

		SearchNode getPreviousNode() {
			return previousNode;
		}

		STRIPSState getState() {
			return state;
		}

		Action getPreviousAction() {
			return previousAction;
		}

		int getCurrentCost() {
			return currentCost;
		}

		NormKeeper getNormKeeper() {
			return normKeeper;
		}

		NormKeeper getCloneNormKeeper() {
			return (NormKeeper) normKeeper.clone();
		}

		@Override
		public int hashCode() {
			return state.hashCode();
		}
	}
}
