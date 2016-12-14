package kplanning.planner;

import javaff.JavaFF;
import javaff.data.Plan;
import javaff.parser.parser21.ParseException;
import javaff.search.UnreachableGoalException;
import kplanning.util.DomainProblem;

import java.io.File;

// TODO: extend from Planner
public class JavaffPlanner {

	private DomainProblem domainProblem;

	public JavaffPlanner(DomainProblem domainProblem) {
		this.domainProblem = domainProblem;
	}

	public Plan plan() {
		JavaFF javaff = new JavaFF(domainProblem.getDomain(), null);
		try {
			return javaff.plan(new File(domainProblem.getProblem()));
		} catch (UnreachableGoalException | ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

}
