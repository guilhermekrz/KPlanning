package kplanning.plan;

import javaff.data.Action;

import java.util.List;
import java.util.Set;

public class ParallelPlan {
	private List<Set<Action>> actions;

	public ParallelPlan(List<Set<Action>> actions) {
		this.actions = actions;
	}

	@Override
	public String toString() {
		String s = "";
		for(Set<Action> setActions : actions) {
			s += setActions + "\n";
		}
		return s;
	}
}
