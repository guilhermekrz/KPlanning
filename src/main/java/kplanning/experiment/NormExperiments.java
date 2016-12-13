package kplanning.experiment;

import kplanning.DomainProblemAdapter;
import kplanning.generator.GenerateNorms;
import kplanning.generator.GenerateProblems;
import kplanning.plan.PlanSolution;
import kplanning.planner.normPlanner.ForwardNormPlanner;
import kplanning.planner.normPlanner.GraphplanNormPlanner;
import kplanning.planner.normPlanner.NaiveGraphplanNormPlanner;
import kplanning.planner.normPlanner.NormPlanner;
import kplanning.util.DomainProblemUtil;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class NormExperiments {

	public static void main(String[] args) {
//		GenerateExperiments.generateExperiments("planning-examples/drinkanddrive-generated/",
//				"planning-examples/drinkanddrive-generated/drinkanddrive-generated.pddl",
//				"planning-examples/drinkanddrive-generated/pb.conditionalNorms", 100, 5, true, null, true);
//		GenerateExperiments.generateExperiments("planning-examples/drinkanddrive-generated/",
//				"planning-examples/drinkanddrive-generated/drinkanddrive-generated.pddl",
//				"planning-examples/drinkanddrive-generated/pb.ltlNorms", 100, 5, false, null, false);
//		GenerateExperiments.testExperiments("planning-examples/drinkanddrive-generated/",
//				"planning-examples/drinkanddrive-generated/drinkanddrive-generated.pddl", NormPlanner.NormPlannerType.NORM_COMPLIANT, false);

//		GenerateExperiments.generateExperiments("planning-examples/drinkanddrive-constraints-generated/",
//				"planning-examples/drinkanddrive-constraints-generated/drinkanddrive-constraints-generated.pddl",
//				null, 100, 0, true, "(preference a1 (sometime (drunk)))");
//		GenerateExperiments.testExperiments("planning-examples/drinkanddrive-constraints-generated/",
//				"planning-examples/drinkanddrive-constraints-generated/drinkanddrive-constraints-generated.pddl", NormPlanner.NormPlannerType.NORM_COMPLIANT, false);

//		GenerateExperiments.generateExperiments("planning-examples/blocksworld/",
//				"planning-examples/blocksworld/blocksworld.pddl",
//				"planning-examples/blocksworld/pb.conditionalNorms", 15, 5, false, null, true);
//		GenerateExperiments.generateExperiments("planning-examples/blocksworld/",
//				"planning-examples/blocksworld/blocksworld.pddl",
//				"planning-examples/blocksworld/pb.ltlNorms", 15, 20, false, null, false);
//		GenerateExperiments.testExperiments("planning-examples/blocksworld/", "planning-examples/blocksworld/blocksworld.pddl", NormPlanner.NormPlannerType.NORM_COMPLIANT, true);
//		GenerateExperiments.testExperiments("planning-examples/blocksworld/", "planning-examples/blocksworld/blocksworld.pddl", NormPlanner.NormPlannerType.NORM_COMPLIANT, false);
	}

	public static void generateExperiments(String parentDir, String domainFile, String normsFile, int numProblems, int maxNumberOfGeneratedNorms, boolean generateProblems, String constraints, boolean generateConditionalNorms) {
		List<GenerateProblems.PredicateExclusive> predicateExclusives = new ArrayList<>();
		GenerateProblems.PredicateExclusive predicateExclusive = new GenerateProblems.PredicateExclusive(false);
		predicateExclusive.addPredicateProbability(new GenerateProblems.PredicateProbability("in", 0.5, "bar"));
		predicateExclusives.add(predicateExclusive);
		for(int i=1;i<=numProblems;i++) {
			if(generateProblems) {
				// Generate problem
				GenerateProblems.generateAndWriteToFile(parentDir, i, 50 + i, predicateExclusives, false, null, constraints);
			}
			// Generate norms
			File normsDir;
			if(generateConditionalNorms) {
				normsDir = new File(parentDir + "/conditionalNormsP" + i + "/");
			} else {
				normsDir = new File(parentDir + "/ltlNormsP" + i + "/");
			}
			String problemPath = parentDir + "pb" + i + ".pddl";
			if(normsFile != null) {
				GenerateNorms generateNorms = new GenerateNorms(domainFile, problemPath, normsFile, normsDir.getPath() + "/", maxNumberOfGeneratedNorms, generateConditionalNorms);
				generateNorms.generateNormsAndWriteToFiles();
			}
		}
	}

	public static void testExperiments(String parentDir, String domainFile, NormPlanner.NormPlannerType normPlannerType, boolean runConditional) {
		File parentDirFile = new File(parentDir);
		int problemNum = 1;
		File problemFile = new File(parentDirFile.getPath() + "/pb" + problemNum + ".pddl");

		List<String> lines = new ArrayList<>();
		lines.add("# Generated at " + new Date());
		if(runConditional) {
			lines.add("# Conditional " + normPlannerType);
		} else {
			lines.add("# LTL " + normPlannerType);
		}
		lines.add("# 1 - Problem # \t\t\t 2 - Norm # " +
				"\t\t\t 3 - NaiveGraphplan time \t\t\t 4 - NaiveGraphplan memory" +
				" \t\t\t 5 - Graphplan time \t\t\t 6 - Graphplan memory " +
				"\t\t\t 7 - Forward time \t\t\t 8 - Forward memory " +
				"\t\t\t 9 - ForwardNK time \t\t\t 10 - ForwardNK memory");

		boolean runNaiveGraphplan = true;
		boolean runGraphplan = true;
		boolean runForward = true;
		boolean runForwardNK = true;

		while(problemFile.exists()) {
			System.out.println("Problem " + problemNum);
			File normsDir;
			if(runConditional) {
				normsDir = new File(problemFile.getParent() + "/conditionalNormsP" + problemNum + "/");
			} else {
				normsDir = new File(problemFile.getParent() + "/ltlNormsP" + problemNum + "/");
			}

			int normNum = 1;
			File normFile = new File(normsDir.getPath() + "/norms" + normNum);
			while (normFile.exists()) {
				System.out.println("Norm " + normNum);
				String line = "" + problemNum + "\t\t\t" + normNum;

				DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem(domainFile, problemFile.getPath()), normFile.getPath());

				/**
				 * NAIVE GRAPHPLAN
				 */

				if(runNaiveGraphplan) {
					NormPlanner planner;
					if(runConditional) {
						planner = new NaiveGraphplanNormPlanner(adapter, adapter.getNormAdapter().getGroundConditionalNorms());
					} else {
						planner = new NaiveGraphplanNormPlanner(adapter, adapter.getNormAdapter().getGroundLtlNorms());
					}

					PlanSolution planSolution =  planner.planNorm(normPlannerType);
					line += "\t\t\t" + planSolution.getTime() + "\t\t\t" + planSolution.getMemoryMB();
					if(planSolution.isTimeout()) {
						runNaiveGraphplan = false;
					}
				} else {
					line += "\t\t\t-\t\t\t-";
				}

				/**
				 * GRAPHPLAN
				 */

				if(runGraphplan && runConditional) { // Only supports conditional norms, not LTL
					NormPlanner planner;
					if(runConditional) {
						planner = new GraphplanNormPlanner(adapter, adapter.getNormAdapter().getGroundConditionalNorms());
					} else {
						planner = new GraphplanNormPlanner(adapter, adapter.getNormAdapter().getGroundLtlNorms());
					}

					PlanSolution planSolution =  planner.planNorm(normPlannerType);
					line += "\t\t\t" + planSolution.getTime() + "\t\t\t" + planSolution.getMemoryMB();
					if(planSolution.isTimeout()) {
						runGraphplan = false;
					}
				} else {
					line += "\t\t\t-\t\t\t-";
				}

				/**
				 * Forward 1
				 */

				if(runForward) {
					NormPlanner planner;
					if(runConditional) {
						planner = new ForwardNormPlanner(adapter, false, adapter.getNormAdapter().getGroundConditionalNorms());
					} else {
						planner = new ForwardNormPlanner(adapter, false, adapter.getNormAdapter().getGroundLtlNorms());
					}

					PlanSolution planSolution =  planner.planNorm(normPlannerType);
					line += "\t\t\t" + planSolution.getTime() + "\t\t\t" + planSolution.getMemoryMB();
					if(planSolution.isTimeout()) {
						runForward = false;
					}
				} else {
					line += "\t\t\t-\t\t\t-";
				}

				/**
				 * Forward 2
				 */

				// Norm Keeper structure only deals with LTL norms
				if(runForwardNK && !runConditional) {
					NormPlanner planner;
					if(runConditional) {
						planner = new ForwardNormPlanner(adapter, true, adapter.getNormAdapter().getGroundConditionalNorms());
					} else {
						planner = new ForwardNormPlanner(adapter, true, adapter.getNormAdapter().getGroundLtlNorms());
					}

					PlanSolution planSolution =  planner.planNorm(normPlannerType);
					line += "\t\t\t" + planSolution.getTime() + "\t\t\t" + planSolution.getMemoryMB();
					if(planSolution.isTimeout()) {
						runForwardNK = false;
					}
				} else {
					line += "\t\t\t-\t\t\t-";
				}

				lines.add(line);

				// Next norm
				normNum++;
				normFile = new File(normsDir.getPath() + "/norms" + normNum);
			}

			// Next problem
			problemNum++;
			problemFile = new File(parentDirFile.getPath() + "/pb" + problemNum + ".pddl");
		}

		String filename;
		if(runConditional) {
			if(normPlannerType.equals(NormPlanner.NormPlannerType.NORM_COMPLIANT)) {
				filename = "/conditionalCompliant";
			} else if(normPlannerType.equals(NormPlanner.NormPlannerType.NORM_VIOLATION)) {
				filename = "/conditionalViolation";
			} else if(normPlannerType.equals(NormPlanner.NormPlannerType.NORM_MINIMUM_COST)) {
				filename = "/conditionalMinimumCost";
			} else {
				throw new IllegalStateException();
			}
		} else {
			if(normPlannerType.equals(NormPlanner.NormPlannerType.NORM_COMPLIANT)) {
				filename = "/ltlCompliant";
			} else if(normPlannerType.equals(NormPlanner.NormPlannerType.NORM_VIOLATION)) {
				filename = "/ltlViolation";
			} else if(normPlannerType.equals(NormPlanner.NormPlannerType.NORM_MINIMUM_COST)) {
				filename = "/ltlMinimumCost";
			} else {
				throw new IllegalStateException();
			}
		}

		write(lines, parentDir + filename);
	}

	private static void write(List<String> lines, String path) {
		System.out.println("Writing " + lines.size() + " lines");
		Path outputPath = Paths.get(path);
		try {
			Files.write(outputPath, lines, Charset.forName("UTF-8"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
