package kplanning.planner.graphplan;

import javaff.data.Action;
import javaff.data.Fact;
import kplanning.DomainProblemAdapter;
import kplanning.norm.ConditionalNorm;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

public class NormPlanningGraph extends PlanningGraph {

	private boolean returnNormCompliantPlans;

	public NormPlanningGraph(DomainProblemAdapter adapter) {
		super(adapter);
		this.returnNormCompliantPlans = true;
	}

	public void setReturnNormCompliantPlans(boolean returnNormCompliantPlans) {
		this.returnNormCompliantPlans = returnNormCompliantPlans;
	}

	// TODO: When returnNormCompliantPlans is true, we only need the current state
	// However, when it is false, we need to know if in other parts of the plan occurred a violation (maybe after, maybe before)
	//  Then, when it is false, we need always to continue planning? Maybe we could then add a "noGoods" like structure related to norms
	@Override
	boolean canUseThisActions(Set<Action> possibleActions, Collection<Fact> subgoalsFactSet) {
		for(ConditionalNorm conditionalNorm : adapter.getNormAdapter().getConditionalNorms()) {
			for(Action possibleAction : possibleActions) {
				if (conditionalNorm.isPossibleViolationAction(possibleAction)) {
					if (conditionalNorm.isPossibleViolationState(subgoalsFactSet)) {
						return false;
					}
				}
			}
		}
		return true;
	}

	@Override
	boolean canUseThisAction(Action possibleAction, Set<Action> actionSet) {
		for(ConditionalNorm conditionalNorm : adapter.getNormAdapter().getConditionalNorms()) {
			if(conditionalNorm.isPossibleViolationAction(possibleAction)) {
				Set<Fact> newSubgoalFactsSet = new HashSet<>();
				for (Action action : actionSet) {
					newSubgoalFactsSet.addAll(action.getPreconditions());
				}

				if(conditionalNorm.isPossibleViolationState(newSubgoalFactsSet)) {
					return false;
				}
			}
		}
		return true;
	}
}
