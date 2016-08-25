package kplanning.util;

public class DomainProblemUtil {
	private static String pathDir = "planning-examples/";

	public static DomainProblem getDomainProblem(String domainPath, String problemPath) {
		return new DomainProblem(domainPath, problemPath);
	}

	public static DomainProblem getDomainProblem(String domain, int problemNumber) {
		return DomainProblemUtil.getDomainProblem(pathDir + domain + "/" + domain + ".pddl", pathDir + domain + "/pb" + problemNumber + ".pddl");
	}
}
