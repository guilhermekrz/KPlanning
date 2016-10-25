package kplanning.norm;

import javaff.data.Action;
import javaff.data.Fact;
import kplanning.DomainProblemAdapter;

import java.util.Set;

public class GroundConditionalNorm {
	private DomainProblemAdapter adapter;
	private String name;
	private NormModality normModality;
	private Set<Fact> trueFacts;
	private int cost;
	private Action action;

	public GroundConditionalNorm(DomainProblemAdapter adapter, String name, NormModality normModality, Set<Fact> trueFacts, int cost, Action action) {
		this.adapter = adapter;
		this.name = name;
		this.normModality = normModality;
		this.trueFacts = trueFacts;
		this.cost = cost;
		this.action = action;
	}

	public String getName() {
		return name;
	}

	public NormModality getNormModality() {
		return normModality;
	}

	public Set<Fact> getTrueFacts() {
		return trueFacts;
	}

	public int getCost() {
		return cost;
	}

	public Action getAction() {
		return action;
	}

	@Override
	public String toString() {
		return name + "=(" + normModality + "," + trueFacts + "," + action + ", C=" + cost + ")";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
		if (!(obj instanceof GroundConditionalNorm)) return false;

		GroundConditionalNorm norm = (GroundConditionalNorm) obj;
		return norm.trueFacts.equals(trueFacts) && norm.normModality == normModality && norm.action.equals(action) && norm.cost == cost && norm.adapter == adapter;
	}

	@Override
	public int hashCode() {
		int h = 0;
		h = 37 * h + trueFacts.hashCode();
		h = 37 * h + normModality.hashCode();
		h = 37 * h + action.hashCode();
		h = 37 * h + adapter.hashCode();
		return h;
	}
}
