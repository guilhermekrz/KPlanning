package kplanning.planner;

import javaff.data.Action;

import java.util.Collections;
import java.util.Set;

public class ActionLevel {
	private Set<Action> actions;

	public ActionLevel(Set<Action> applicableActions) {
		this.actions = applicableActions;
	}

	public Set<Action> getActions() {
		return Collections.unmodifiableSet(actions);
	}

	@Override
	public String toString() {
		return actions.toString();
	}
}
