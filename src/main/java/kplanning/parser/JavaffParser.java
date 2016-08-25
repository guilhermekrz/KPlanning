package kplanning.parser;

import javaff.data.GroundProblem;
import javaff.data.UngroundProblem;
import javaff.parser.PDDLParser;
import kplanning.util.DomainProblem;

public class JavaffParser {

	public static UngroundProblem parseUngroundProblem21(DomainProblem domainProblem) {
		return PDDLParser.getUngroundDomainProblem21(domainProblem.getDomain(), domainProblem.getProblem());
	}

	public static GroundProblem parseGroundProblem21(DomainProblem domainProblem) {
		return PDDLParser.getGroundDomainProblem21(domainProblem.getDomain(), domainProblem.getProblem());
	}

	public static UngroundProblem parseUngroundProblem30(DomainProblem domainProblem) {
		return PDDLParser.getUngroundDomainProblem30(domainProblem.getDomain(), domainProblem.getProblem());
	}

	public static GroundProblem parseGroundProblem30(DomainProblem domainProblem) {
		return PDDLParser.getGroundDomainProblem30(domainProblem.getDomain(), domainProblem.getProblem());
	}

}
