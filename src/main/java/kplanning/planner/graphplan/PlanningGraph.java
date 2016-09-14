package kplanning.planner.graphplan;

import javaff.data.Action;
import javaff.data.Fact;
import javaff.data.strips.And;
import javaff.data.strips.STRIPSInstantAction;
import kplanning.DomainProblemAdapter;
import kplanning.plan.ParallelPlan;
import kplanning.planner.ActionLevel;
import kplanning.planner.StateLevel;
import org.jetbrains.annotations.Nullable;

import java.util.*;

// Assumption: AND goal
// Assumption: there is no action called INTERNALNOOP in domain
public class PlanningGraph {
	private static final String INTERNAL_NOOP_ACTION_NAME = "INTERNALNOOP";

	private DomainProblemAdapter adapter;
	private List<StateLevel> stateLevels;
	private List<ActionLevel> actionLevels;

	public PlanningGraph(DomainProblemAdapter adapter) {
		this.adapter = adapter;
		stateLevels = new ArrayList<>();
		actionLevels = new ArrayList<>();
		stateLevels.add(new StateLevel(adapter.getJavaffParser().getCompleteInitState()));
	}

	public boolean isGoalPossible() {
		System.out.println(adapter.getJavaffParser().getGroundProblem().getGoal());
		return getLastStateLevel().getFacts().containsAll(adapter.getJavaffParser().getGroundProblem().getGoal().getFacts());
	}

	public void expandGraph() {
		StateLevel previouLevel = getLastStateLevel();
		Set<Action> actions = adapter.getJavaffParser().getGroundProblem().getActions();
		Set<Action> applicableActions = new HashSet<>();
		Set<Fact> applicableActionsEffects = new HashSet<>();
		Map<Fact, List<Action>> actionsThatAddFact = new HashMap<>();
		for(Action action : actions) {
			Set<Fact> preconditions = action.getPreconditions();
			if(previouLevel.getFacts().containsAll(preconditions)) {
				applicableActions.add(action);
				applicableActionsEffects.addAll(action.getAddPropositions());
				applicableActionsEffects.addAll(action.getDeletePropositions());
				addActionToActionsThatAddFactMap(actionsThatAddFact, action);
			}
		}
		addNoOpActions(actionsThatAddFact, previouLevel.getFacts());
		actionLevels.add(new ActionLevel(applicableActions));
		Set<Fact> nextLevelFacts = new HashSet<>();
		nextLevelFacts.addAll(previouLevel.getFacts());
		nextLevelFacts.addAll(applicableActionsEffects);
		StateLevel nextLevel = new StateLevel(nextLevelFacts, actionsThatAddFact);
		stateLevels.add(nextLevel);
	}

	/**
	 * Expand graph utils
	 */

	private void addNoOpActions(Map<Fact, List<Action>> actionsThatAddFact, Set<Fact> facts) {
		for(Fact fact : facts) {
			List<Action> actions = actionsThatAddFact.get(fact);
			if(actions == null) {
				actionsThatAddFact.put(fact, new ArrayList<>(Collections.singletonList(getNoOpAction(fact))));
			} else {
				actions.add(getNoOpAction(fact));
				actionsThatAddFact.put(fact, actions);
			}
		}
	}

	private Action getNoOpAction(Fact fact) {
		STRIPSInstantAction action = new STRIPSInstantAction(INTERNAL_NOOP_ACTION_NAME);
		action.setCondition(new And(fact));
		action.addAddProposition(fact);
		return action;
	}

	private void addActionToActionsThatAddFactMap(Map<Fact, List<Action>> actionsThatAddFact, Action action) {
		for(Fact fact: action.getAddPropositions()) {
			List<Action> actions = actionsThatAddFact.get(fact);
			if(actions == null) {
				actionsThatAddFact.put(fact, new ArrayList<>(Collections.singletonList(action)));
			} else {
				actions.add(action);
				actionsThatAddFact.put(fact, actions);
			}
		}
		for(Fact fact: action.getDeletePropositions()) {
			List<Action> actions = actionsThatAddFact.get(fact);
			if(actions == null) {
				actionsThatAddFact.put(fact, new ArrayList<>(Collections.singletonList(action)));
			} else {
				actions.add(action);
				actionsThatAddFact.put(fact, actions);
			}
		}
	}

	/**
	 * Extract solution
	 */

	@Nullable
	public ParallelPlan extractSolution() {
		List<Set<Action>> parallelPlanActions = new ArrayList<>();
		Set<Fact> subgoalFacts = adapter.getJavaffParser().getGroundProblem().getGoal().getFacts();

		for(int i = getLastStateLevelIndex(); i > 0; i--) {
			Set<Action> actions = extractSolution(i, subgoalFacts);
			if(actions == null) {
				return null;
			} else {
				parallelPlanActions.add(0, getActionsWithoutNoOp(actions));
				subgoalFacts = new HashSet<>();
				for (Action action : actions) {
					subgoalFacts.addAll(action.getPreconditions());
				}
			}
		}
		return new ParallelPlan(parallelPlanActions);
	}

	private Set<Action> getActionsWithoutNoOp(Set<Action> actions) {
		Set<Action> actionsWithoutNoOp = new HashSet<>();
		for(Action action : actions) {
			if(!action.getName().toString().equals(INTERNAL_NOOP_ACTION_NAME)) {
				actionsWithoutNoOp.add(action);
			}
		}
		return actionsWithoutNoOp;
	}

	private Set<Action> extractSolution(int level, Set<Fact> subgoalFacts) {
		Map<Fact, List<Action>> actionsThatAddFacts = stateLevels.get(level).getActionsThatAddFacts();
		Map<Fact, List<Action>> actionsThatAddFactsMutable = new HashMap<>(actionsThatAddFacts);
		return extractSolution(subgoalFacts, actionsThatAddFactsMutable);
	}

	private Set<Action> extractSolution(Set<Fact> subgoalFacts, Map<Fact, List<Action>> actionsThatAddFacts) {
		Set<Action> actionsToTry = new HashSet<>();
		for(Fact fact : subgoalFacts) {
			List<Action> actions = actionsThatAddFacts.get(fact);
			if(actions.isEmpty()) {
				return null;
			}
			Action actionToTry = actions.remove(0);
			actionsToTry.add(actionToTry);
			actionsThatAddFacts.put(fact, actions);
		}
		// TODO: Check if all actions are conflict-free
		return actionsToTry;
	}

	/**
	 * Utils
	 */

	private int getLastStateLevelIndex() {
		return stateLevels.size() - 1;
	}

	private StateLevel getLastStateLevel() {
		return stateLevels.get(stateLevels.size() - 1);
	}

	@Override
	public String toString() {
		String s = "";
		for(int i=0;i<stateLevels.size() || i < actionLevels.size(); i++) {
			if(i<stateLevels.size()) {
				s += "State" + i + ": " + stateLevels.get(i) + "\n";
			}
			if(i<actionLevels.size()) {
				s += "Action" + i + ": " + actionLevels.get(i) + "\n";
			}
		}
		return s;
	}
}
