package kplanning.norm;

import javaff.data.Action;
import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class StateNorm extends Norm {

	// Main info
	private DomainProblemAdapter adapter;
	private NormModality normModality;
	private String name;
	private int cost;

	// Activation condition
	private OrCompoundLiteral activation;
	private Set<OrCompoundLiteral> groundActivation;

	// Condition
	private OrCompoundLiteral condition;
	private Set<OrCompoundLiteral> groundCondition;

	// Expiration condition
	private OrCompoundLiteral expiration;
	private Set<OrCompoundLiteral> groundExpiration;

	public StateNorm(DomainProblemAdapter adapter, NormModality normModality, String name, int cost, OrCompoundLiteral activation, OrCompoundLiteral condition, OrCompoundLiteral expiration) {
		this.adapter = adapter;
		this.normModality = normModality;
		this.name = name;
		this.cost = cost;
		this.activation = activation;
		this.groundActivation = activation.ground(adapter);
		this.condition = condition;
		this.groundCondition = condition.ground(adapter);
		this.expiration = expiration;
		this.groundExpiration = expiration.ground(adapter);
	}

	@Override
	public boolean isViolationPlan(List<STRIPSState> states, List<Action> actions) {
		throw new NotImplementedException();
	}

	/**
	 * Custom
	 */

	// Ground this state norm into multiple GroundStateNorm

	public Set<GroundStateNorm> ground() {
		Set<GroundStateNorm> groundStateNorms = new HashSet<>();
		for(OrCompoundLiteral activation : groundActivation) {
			for(OrCompoundLiteral condition : groundCondition) {
				for(OrCompoundLiteral expiration : groundExpiration) {
					GroundStateNorm groundStateNorm = new GroundStateNorm(adapter, normModality, name, cost, activation, condition, expiration);
					groundStateNorms.add(groundStateNorm);
				}
			}
		}
		return groundStateNorms;
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
		if (!(obj instanceof StateNorm)) return false;

		StateNorm norm = (StateNorm) obj;
		return norm.activation.equals(activation) && norm.normModality == normModality
				&& norm.condition.equals(condition) && norm.expiration.equals(expiration)
				&& norm.adapter == adapter;
	}

	@Override
	public int hashCode() {
		int h = 4329;
		h = 37 * h + activation.hashCode();
		h = 37 * h + normModality.hashCode();
		h = 37 * h + condition.hashCode();
		h = 37 * h + expiration.hashCode();
		h = 37 * h + adapter.hashCode();
		return h;
	}
}
