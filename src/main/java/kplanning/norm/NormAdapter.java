package kplanning.norm;

import fr.uga.pddl4j.parser.Connective;
import fr.uga.pddl4j.parser.Exp;
import javaff.data.CompoundLiteral;
import javaff.data.strips.And;
import javaff.data.strips.Predicate;
import kplanning.DomainProblemAdapter;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class NormAdapter {

	private DomainProblemAdapter adapter;
	private Set<ConditionalNorm> conditionalNorms;
	private Set<LtlNorm> ltlNorms;

	/**
	 * Constructors
	 */

	public static NormAdapter newInstance(DomainProblemAdapter adapter) {
		return new NormAdapter(adapter);
	}

	private NormAdapter(DomainProblemAdapter adapter) {
		this.adapter = adapter;
		populateNorms();
		populateLtlNorms();
	}

	public Set<ConditionalNorm> getConditionalNorms() {
		return conditionalNorms;
	}

	private void populateNorms() {
		CompoundLiteral compoundLiteral = new And(Collections.singleton(new Predicate(adapter.getJavaffParser().getPredicateSymbol("drunk"))));
		ConditionalNorm norm = new ConditionalNorm(adapter, NormModality.PROHIBITION, compoundLiteral, adapter.getJavaffParser().getUngroundAction("move"));
		conditionalNorms = new HashSet<>(Collections.singletonList(norm));
	}

	public Set<LtlNorm> getLtlNorms() {
		return ltlNorms;
	}

	private void populateLtlNorms() {
		ltlNorms = new HashSet<>();
		Exp constraints = adapter.getPddl4jParser().getParser().getProblem().getConstraints();
		if(constraints != null && constraints.getConnective().equals(Connective.AND)) {
			List<Exp> children = constraints.getChildren();
			for(Exp child : children) {
				int t = -1;
				CompoundLiteral o;
				CompoundLiteral v = null;
				switch (child.getConnective()) {
					case AT_END:
					case ALWAYS:
					case SOMETIME:
					case AT_MOST_ONCE:
						if(child.getChildren().size() != 1) {
							throw new IllegalStateException("Connective should have only one children: " + child.getConnective());
						}
						o = adapter.getPddl4jToJavaffConverter().getCompoundLiteralFromExp(child.getChildren().get(0));
						break;
					case SOMETIME_AFTER:
					case SOMETIME_BEFORE:
						if(child.getChildren().size() != 2) {
							throw new IllegalStateException("Connective should have only two children: " + child.getConnective());
						}
						o = adapter.getPddl4jToJavaffConverter().getCompoundLiteralFromExp(child.getChildren().get(0));
						v = adapter.getPddl4jToJavaffConverter().getCompoundLiteralFromExp(child.getChildren().get(1));
						break;
					case ALWAYS_WITHIN:
						if(child.getChildren().size() != 3) {
							throw new IllegalStateException("Connective should have three children: " + child.getConnective());
						}
						t = child.getChildren().get(0).getValue().intValue();
						o = adapter.getPddl4jToJavaffConverter().getCompoundLiteralFromExp(child.getChildren().get(1));
						v = adapter.getPddl4jToJavaffConverter().getCompoundLiteralFromExp(child.getChildren().get(2));
						break;
					default:
						throw new IllegalStateException("Connective not supported in constraints: " + child.getConnective());
				}
				ltlNorms.add(new LtlNorm(adapter, NormModality.OBLIGATION, child.getPrefName().getImage(), child.getConnective(), t, o, v));
			}
		}
	}
}
