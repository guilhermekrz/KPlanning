package kplanning.parser;

import jason.asSyntax.Atom;
import javaff.data.Action;
import javaff.data.Fact;
import javaff.data.Parameter;
import javaff.data.strips.Proposition;
import kplanning.DomainProblemAdapter;

public class GraphplanJavaffConverter {

	private DomainProblemAdapter domainProblemAdapter;
	private JavaffParser javaffParser;

	public static GraphplanJavaffConverter getInstance(DomainProblemAdapter domainProblemAdapter) {
		return new GraphplanJavaffConverter(domainProblemAdapter);
	}

	private GraphplanJavaffConverter(DomainProblemAdapter domainProblemAdapter) {
		this.domainProblemAdapter = domainProblemAdapter;
		this.javaffParser = domainProblemAdapter.getJavaffParser();
	}

	public Action getAction(graphplan.domain.Operator operator) {
		String actionName = operator.getFunctor();
		for(Object objAtom : operator.getTerms()) {
			actionName += " " + ((Atom) objAtom).getFunctor();
		}
		return javaffParser.getGroundProblem().getAction(actionName);
	}

	public graphplan.domain.Proposition getProposition(Fact fact) {
		Proposition proposition = javaffParser.getBaseGroundProposition(fact);
		String s = "";

		if(!javaffParser.isGroundFactTrue(fact)) {
			s += "~";
		}

		s += proposition.getPredicateSymbol().getName();
		boolean addComma = false;
		for(Parameter parameter : proposition.getParameters()) {
			if(addComma) {
				s += ",";
			} else {
				s += "(";
				addComma = true;
			}
			s += parameter.getName();
		}
		if(addComma) {
			s += ")";
		}
		return new graphplan.domain.jason.PropositionImpl(s);
	}
}
