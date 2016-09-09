package kplanning.util;

import java.io.File;

public class DomainProblem {
	private String domain, problem;

	public DomainProblem(String domain, String problem) {
		this.domain = domain;
		this.problem = problem;
	}

	public String getBasePath() {
		return new File(domain).getParent();
	}

	public String getDomain() {
		return domain;
	}

	public String getProblem() {
		return problem;
	}
}
