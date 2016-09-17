package kplanning.plan;

import javaff.data.Action;

import java.util.HashSet;
import java.util.Set;

public class PlanUtil {
	public static final String INTERNAL_NOOP_ACTION_NAME = "INTERNALNOOP";

	static Set<Action> getActionsWithoutNoOp(Set<Action> actions) {
		Set<Action> actionsWithoutNoOp = new HashSet<>();
		for(Action action : actions) {
			if(!action.getName().toString().startsWith(INTERNAL_NOOP_ACTION_NAME)) {
				actionsWithoutNoOp.add(action);
			}
		}
		return actionsWithoutNoOp;
	}
}
