package kplanning.parser;

import fr.uga.pddl4j.parser.Parser;
import kplanning.util.DomainProblem;

import java.io.FileNotFoundException;

public class Pddl4jParser {

	private Parser parser;

	public static Pddl4jParser newInstance(DomainProblem domainProblem) {
		return new Pddl4jParser(domainProblem);
	}

	private Pddl4jParser(DomainProblem domainProblem) {
		parser = new Parser();
		try {
			parser.parse(domainProblem.getDomain(), domainProblem.getProblem());
			if(!parser.getErrorManager().isEmpty()) {
				parser.getErrorManager().printAll();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw new IllegalStateException(e.getLocalizedMessage());
		}
	}

	public Parser getParser() {
		return parser;
	}
}
