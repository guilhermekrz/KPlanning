package kplanning.planner;

import javaff.data.Action;
import javaff.data.Fact;
import javaff.planning.STRIPSState;

import java.util.*;

public class StateLevel {
	private Set<Fact> facts;
	private Map<Fact, List<Action>> actionsThatAddFacts;

	public StateLevel(STRIPSState initialState) {
		this.facts = new HashSet<>();
		for(Fact fact : initialState.getFacts()) {
			this.facts.add(fact);
		}
	}

	public StateLevel(Set<Fact> facts, Map<Fact, List<Action>> actionsThatAddFacts) {
		this.facts = facts;
		this.actionsThatAddFacts = actionsThatAddFacts;
	}

	public Set<Fact> getFacts() {
		return Collections.unmodifiableSet(facts);
	}

	public Map<Fact, List<Action>> getActionsThatAddFacts() {
		return Collections.unmodifiableMap(actionsThatAddFacts);
	}

	@Override
	public String toString() {
		return facts.toString();
	}
}
