package kplanning.parser;

import fr.uga.pddl4j.parser.Connective;
import fr.uga.pddl4j.parser.Exp;
import javaff.data.CompoundLiteral;
import javaff.data.strips.And;
import kplanning.DomainProblemAdapter;

public class Pddl4jToJavaffConverter {

	private DomainProblemAdapter domainProblemAdapter;
	private JavaffParser javaffParser;

	public static Pddl4jToJavaffConverter getInstance(DomainProblemAdapter domainProblemAdapter) {
		return new Pddl4jToJavaffConverter(domainProblemAdapter);
	}

	private Pddl4jToJavaffConverter(DomainProblemAdapter domainProblemAdapter) {
		this.domainProblemAdapter = domainProblemAdapter;
		this.javaffParser = domainProblemAdapter.getJavaffParser();
	}

	public CompoundLiteral getCompoundLiteralFromExp(Exp exp) {
		CompoundLiteral compoundLiteral = new And();
		if(exp.getConnective() == Connective.AND) {
			for(Exp child : exp.getChildren()) {
				compoundLiteral.add(javaffParser.getFact(child.toString()));
			}
		} else if(exp.getConnective() == Connective.ATOM) {
			compoundLiteral.add(javaffParser.getFact(exp.toString()));
		} else {
			throw new IllegalStateException("Exp should be either AND or ATOM: " + exp);
		}
		return compoundLiteral;
	}
}
