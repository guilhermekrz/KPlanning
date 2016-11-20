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

// Solution from the other paper is quite clever, because it uses the already implemented mechanism to perform this...
public class ForwardNormPlanner extends NormPlanner {

	private static final boolean USE_NORM_KEEPER = false;

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

	private @Nullable PlanSolution planNormAware(boolean foundAllSolutions, int levels, boolean returnNormCompliant) {
		if(foundAllSolutions || levels > 0) {
			// TODO: implement found all solutions to bfs search
			throw new NotImplementedException();
		}

		Set<Action> actions = adapter.getJavaffParser().getGroundProblem().getActions();
		GroundFact goalGroundFact = adapter.getJavaffParser().getGroundProblem().getGoal();

		STRIPSState completeInitState = adapter.getJavaffParser().getCompleteInitState();
		SearchNode searchNode = new SearchNode(completeInitState);
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

					SearchNode childNode = new SearchNode(searchNode, action, newState);
					if (!frontier.contains(childNode) && !explored.contains(childNode.getState())) {
						// If norm compliant
						//noinspection SimplifiableBooleanExpression
						if(returnNormCompliant) {
							if(!childNode.isAbsoluteViolation()) {
								if (goalGroundFact.isTrue(childNode.getState()) && !childNode.isCurrentlyViolation()) {
									return solution(childNode);
								}
								frontier.add(childNode);
							}
						} else {
							// !returnNormCompliant
							if (goalGroundFact.isTrue(childNode.getState()) && childNode.isCurrentlyViolation()) {
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
		// TODO: return this NormKeeper in Plan Solution!!!
//		System.out.println(searchNode.getNormKeeper());
		return new PlanSolution(adapter, Plan.newPlanFromActions(searchNode.getActions(), adapter));
	}

	// TODO: separate norm keeper and current solution
	public class SearchNode {
		private SearchNode previousNode;
		private Action previousAction;
		private STRIPSState state;
		private int currentCost;

		// Norm keeper
		private NormKeeper normKeeper;
		private boolean normKeeperUpdated = false;

		// Runtime
		private boolean violationUpdated, isAbsoluteViolation, isCurrentlyViolation;

		SearchNode(STRIPSState state) {
			this(null, null, state);
		}

		SearchNode(SearchNode previousNode, Action previousAction, STRIPSState state) {
			this.previousNode = previousNode;
			this.previousAction = previousAction;
			this.state = state;
			if(this.previousNode == null) {
				if(USE_NORM_KEEPER) {
					this.normKeeper = new NormKeeper();
				}
				this.currentCost = 0;
			} else {
				if(USE_NORM_KEEPER) {
					this.normKeeper = this.previousNode.getCloneNormKeeper();
				}
				this.currentCost = this.previousNode.getCurrentCost() + 1; // Actions always have cost 1
			}
			this.violationUpdated = false;
		}

		SearchNode getPreviousNode() {
			return previousNode;
		}

		public STRIPSState getState() {
			return state;
		}

		Action getPreviousAction() {
			return previousAction;
		}

		int getCurrentCost() {
			return currentCost;
		}

		private NormKeeper getCloneNormKeeper() {
			return (NormKeeper) normKeeper.clone();
		}

		// There is no way that this search will return a non-violation plan
		public boolean isAbsoluteViolation() {
			if(USE_NORM_KEEPER) {
				checkAndUpdateNormKeeper();
				return normKeeper.isAbsoluteViolation();
			} else {
				checkAndUpdateViolation();
				return isAbsoluteViolation;
			}
		}

		// The plan is currently violation some norm, but in the future it could be a non-violation plan
		public boolean isCurrentlyViolation() {
			if(USE_NORM_KEEPER) {
				checkAndUpdateNormKeeper();
				return normKeeper.isCurrentlyViolation();
			} else {
				checkAndUpdateViolation();
				return isCurrentlyViolation;
			}
		}

		// TODO: add some sort of memoization, using previous search node??
		private void checkAndUpdateViolation() {
			if(!violationUpdated) {
				List<STRIPSState> states = getStates();
				isAbsoluteViolation = false;
				isCurrentlyViolation = false;
				for(LtlNorm ltlNorm : adapter.getNormAdapter().getLtlNorms()) {
					if(ltlNorm.isViolationPlan(states)) {
						if (ltlNorm.getConnective() == Connective.ALWAYS) {
							isCurrentlyViolation = true;
							isAbsoluteViolation = true;
							break;
						} else if (ltlNorm.getConnective() == Connective.AT_END) {
							isCurrentlyViolation = true;
						} else if (ltlNorm.getConnective() == Connective.SOMETIME) {
							isCurrentlyViolation = true;
						} else if (ltlNorm.getConnective() == Connective.AT_MOST_ONCE) {
							isCurrentlyViolation = true;
							isAbsoluteViolation = true;
							break;
						} else if (ltlNorm.getConnective() == Connective.SOMETIME_AFTER) {
							isCurrentlyViolation = true;
						} else if (ltlNorm.getConnective() == Connective.SOMETIME_BEFORE) {
							isCurrentlyViolation = true;
							isAbsoluteViolation = true;
							break;
						} else if (ltlNorm.getConnective() == Connective.ALWAYS_WITHIN) {
							isCurrentlyViolation = true;
						}
					}
				}
			}
		}

		private void checkAndUpdateNormKeeper() {
			if(!normKeeperUpdated) {
				normKeeper.update(state);
				normKeeperUpdated = true;
			}
		}

		public List<Action> getActions() {
			List<Action> actions = new ArrayList<>();
			SearchNode currentNode = this;
			while(currentNode.getPreviousAction() != null) {
				actions.add(0, currentNode.getPreviousAction());
				currentNode = currentNode.getPreviousNode();
			}
			return actions;
		}

		List<STRIPSState> getStates() {
			List<STRIPSState> states = new ArrayList<>();
			SearchNode currentNode = this;
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
					if(ltlNorm.getConnective().equals(Connective.ALWAYS)
							|| ltlNorm.getConnective().equals(Connective.SOMETIME_AFTER)) {
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
					if(ltlNorm.isOTrue(newState)) {
						newNotViolations.add(ltlNorm);
					} else {
						newAbsoluteViolations.add(ltlNorm);
					}
				} else if(ltlNorm.getConnective().equals(Connective.SOMETIME)) {
					if(ltlNorm.isOTrue(newState)) {
						newNotViolations.add(ltlNorm);
					}
				} else if(ltlNorm.getConnective().equals(Connective.SOMETIME_AFTER)) {
					if(ltlNorm.isVTrue(newState)) {
						newNotViolations.add(ltlNorm);
					}
				}
			}

			curretlyiolationNorms.removeAll(newAbsoluteViolations);
			curretlyiolationNorms.removeAll(newNotViolations);
			abolsuteViolationNorms.addAll(newAbsoluteViolations);

			// Add to currently violation
			for(LtlNorm ltlNorm : ltlNorms) {
				if(ltlNorm.getConnective().equals(Connective.SOMETIME_AFTER)) {
					if(ltlNorm.isOTrue(newState)) {
						curretlyiolationNorms.add(ltlNorm);
					}
				}
			}
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
}
