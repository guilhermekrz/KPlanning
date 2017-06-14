package kplanning.norm;

import javaff.data.Action;
import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.util.List;

public class GroundStateNorm extends Norm implements GroundNorm {

	private DomainProblemAdapter adapter;
	private NormModality normModality;
	private String name;
	private int cost;
	private OrCompoundLiteral activation;
	private OrCompoundLiteral condition;
	private OrCompoundLiteral expiration;

	public GroundStateNorm(DomainProblemAdapter adapter, NormModality normModality, String name, int cost, OrCompoundLiteral activation, OrCompoundLiteral condition, OrCompoundLiteral expiration) {
		this.adapter = adapter;
		this.normModality = normModality;
		this.name = name;
		this.cost = cost;
		this.activation = activation;
		this.condition = condition;
		this.expiration = expiration;
	}

	@Override
	public int getCost() {
		return cost;
	}

	@Override
	public String toFile(String name, int cost) {
		throw new NotImplementedException();
	}

	@Override
	public boolean isViolationPlan(List<STRIPSState> states, List<Action> actions) {
		throw new NotImplementedException();
	}

	/**
	 * Default
	 */

	@Override
	public String toString() {
		return name + "=(" + normModality + "," + activation + "," + condition + ", " + expiration + ", C=" + cost + ")";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
		if (!(obj instanceof GroundStateNorm)) return false;

		GroundStateNorm norm = (GroundStateNorm) obj;
		return norm.activation.equals(activation) && norm.normModality == normModality
				&& norm.condition.equals(condition) && norm.expiration.equals(expiration)
				&& norm.adapter == adapter;
	}

	@Override
	public int hashCode() {
		int h = 9054;
		h = 37 * h + activation.hashCode();
		h = 37 * h + normModality.hashCode();
		h = 37 * h + condition.hashCode();
		h = 37 * h + expiration.hashCode();
		h = 37 * h + adapter.hashCode();
		return h;
	}
}
