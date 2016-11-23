package kplanning.generator;

import kplanning.DomainProblemAdapter;
import kplanning.plan.PlanSolution;
import kplanning.planner.normPlanner.ForwardNormPlanner;
import kplanning.planner.normPlanner.GraphplanNormPlanner;
import kplanning.planner.normPlanner.NaiveGraphplanNormPlanner;
import kplanning.planner.normPlanner.NormPlanner;
import kplanning.util.DomainProblemUtil;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;

public class GenerateExperiments {

	public static void main(String[] args) {
//		GenerateExperiments.generateExperiments("planning-examples/drinkanddrive-generated/", "planning-examples/drinkanddrive-generated/drinkanddrive.pddl", "planning-examples/drinkanddrive-generated/pb.conditionalNorms", 5, 5);
		GenerateExperiments.testExperiments("planning-examples/drinkanddrive-generated/", "planning-examples/drinkanddrive-generated/drinkanddrive.pddl");
	}

	public static void generateExperiments(String parentDir, String domainFile, String normsFile, int numProblems, int maxNumberOfGeneratedNorms) {
		List<GenerateProblems.PredicateExclusive> predicateExclusives = new ArrayList<>();
		GenerateProblems.PredicateExclusive predicateExclusive = new GenerateProblems.PredicateExclusive(false);
		predicateExclusive.addPredicateProbability(new GenerateProblems.PredicateProbability("in", 0.5, "bar"));
		predicateExclusives.add(predicateExclusive);
		for(int i=1;i<=numProblems;i++) {
			// Generate problem
			GenerateProblems.generateAndWriteToFile(parentDir, i, 5 + i, predicateExclusives, false, null);
			// Generate norms
			File normsDir = new File(parentDir + "/normsP" + i + "/");
			String problemPath = parentDir + "pb" + i + ".pddl";
			GenerateNorms generateNorms = new GenerateNorms(domainFile, problemPath, normsFile, normsDir.getPath() + "/", maxNumberOfGeneratedNorms);
			generateNorms.generateNormsAndWriteToFiles();
		}
	}

	public static void testExperiments(String parentDir, String domainFile) {
		File parentDirFile = new File(parentDir);
		int problemNum = 1;
		File problemFile = new File(parentDirFile.getPath() + "/pb" + problemNum + ".pddl");

		while(problemFile.exists()) {
			File normsDir = new File(problemFile.getParent() + "/normsP" + problemNum + "/");

			int normNum = 1;
			File normFile = new File(normsDir.getPath() + "/norms" + normNum);
			while (normFile.exists()) {

				System.out.println(problemFile + " " + normFile);

				DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem(domainFile, problemFile.getPath()), normFile.getPath());

				// Conditional norms
				NormPlanner naiveGraphplanNormPlanner = new NaiveGraphplanNormPlanner(adapter, adapter.getNormAdapter().getConditionalNorms());
//
				PlanSolution planSolutionNaiveGraphplanC = naiveGraphplanNormPlanner.planNormCompliant();
//				PlanSolution planSolutionNaiveGraphplanV = naiveGraphplanNormPlanner.planNormViolation();

				NormPlanner graphplanNormPlanner = new GraphplanNormPlanner(adapter, adapter.getNormAdapter().getConditionalNorms());
				PlanSolution planSolutionGraphplanC = graphplanNormPlanner.planNormCompliant();
//				PlanSolution planSolutionGraphplanV = graphplanNormPlanner.planNormViolation();

				NormPlanner forwardNormPlanner = new ForwardNormPlanner(adapter, false, adapter.getNormAdapter().getConditionalNorms());
				NormPlanner forwardNormPlannerNK = new ForwardNormPlanner(adapter, true, adapter.getNormAdapter().getConditionalNorms());
				PlanSolution planSolutionForwardC = forwardNormPlanner.planNormCompliant();
				PlanSolution planSolutionForwardNKC = forwardNormPlannerNK.planNormCompliant();
//				PlanSolution planSolutionGraphplanV = forwardNormPlanner.planNormViolation();
//				PlanSolution planSolutionGraphplanV = forwardNormPlannerNK.planNormViolation();

				assertSimilarPlans(planSolutionNaiveGraphplanC, planSolutionGraphplanC);
				assertSimilarPlans(planSolutionNaiveGraphplanC, planSolutionForwardC);
				assertSimilarPlans(planSolutionNaiveGraphplanC, planSolutionForwardNKC);
//				assertSimilarPlans(planSolutionNaiveGraphplanV, planSolutionGraphplanV);

				// Next norm
				normNum++;
				normFile = new File(normsDir.getPath() + "/norms" + normNum);
			}

			// Next problem
			problemNum++;
			problemFile = new File(parentDirFile.getPath() + "/pb" + problemNum + ".pddl");
		}
	}

	private static void assertSimilarPlans(PlanSolution planSolution1, PlanSolution planSolution2) {
		if(planSolution1 == null || planSolution2 == null) {
			assertEquals(planSolution1, planSolution2);
		} else {
			assertEquals(planSolution1.getPlan().getActions().size(), planSolution2.getPlan().getActions().size());
		}
	}
}
