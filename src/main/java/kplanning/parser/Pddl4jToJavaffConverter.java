package kplanning.parser;

import fr.uga.pddl4j.parser.Connective;
import fr.uga.pddl4j.parser.Exp;
import javaff.data.CompoundLiteral;
import javaff.data.Fact;
import javaff.data.strips.And;
import javaff.data.strips.Not;
import kplanning.DomainProblemAdapter;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
				compoundLiteral.add(getFact(child.toString()));
			}
		} else if(exp.getConnective() == Connective.ATOM) {
			compoundLiteral.add(getFact(exp.toString()));
		} else {
			throw new IllegalStateException("Exp should be either AND or ATOM: " + exp);
		}
		return compoundLiteral;
	}

	private Fact getFact(String factString) {
		List<String> strings = Arrays.asList(factString.replace('(', ' ').replace(')', ' ').trim().split(" "));
		if(strings.get(0).equals("not")) {
			List<String> strings2 = new ArrayList<>();
			for(int i=1;i<strings.size();i++) {
				if(!strings.get(i).trim().isEmpty()) {
					strings2.add(strings.get(i));
				}
			}
			return new Not(javaffParser.getProposition(strings2));
		} else {
			return javaffParser.getProposition(strings);
		}
	}
}
