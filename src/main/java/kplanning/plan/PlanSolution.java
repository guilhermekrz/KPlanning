package kplanning.plan;

import javaff.data.Action;
import kplanning.DomainProblemAdapter;
import kplanning.util.SetUtil;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class PlanSolution {
	private DomainProblemAdapter adapter;
	private Set<List<Set<Action>>> solutions;
	private Set<Plan> plans;

	public PlanSolution(DomainProblemAdapter adapter, List<List<Set<Action>>> solutions) {
		this.adapter = adapter;

		// Populate solutions without No-Op actions
		this.solutions = new HashSet<>();
		for(List<Set<Action>> solution : solutions) {
			List<Set<Action>> solutionWithoutNoOp = new ArrayList<>();
			for(Set<Action> set : solution) {
				solutionWithoutNoOp.add(PlanUtil.getActionsWithoutNoOp(set));
			}
			this.solutions.add(solutionWithoutNoOp);
		}
	}

	public Set<List<Set<Action>>> getSolutions() {
		return solutions;
	}

	public Set<Plan> getPlans() {
		if(plans == null) {
			this.plans = new HashSet<>();

			Set<List<Action>> allPossibleSolutions1 =  new HashSet<>();

			for (List<Set<Action>> solution : solutions) {
				Set<List<Action>> allPossibleSolutions2 =  new HashSet<>();

				for(Set<Action> s : solution) {
					List<List<Action>> permutations = SetUtil.permutation(s);

					Set<List<Action>> tempSolutions = new HashSet<>();

					if (allPossibleSolutions2.isEmpty()) {
						tempSolutions.addAll(permutations);
					} else {
						for (List<Action> list : allPossibleSolutions2) {
							for (List<Action> per : permutations) {
								List<Action> newList = new ArrayList<>(list);
								newList.addAll(per);
								tempSolutions.add(newList);
							}
						}
					}

					allPossibleSolutions2 = tempSolutions;
				}

				allPossibleSolutions1.addAll(allPossibleSolutions2);
			}

			for(List<Action> list : allPossibleSolutions1) {
				this.plans.add(Plan.newPlanFromActions(list, adapter));
			}
		}
		return plans;
	}

	public String getPlansString() {
		String s = "Found " + getPlans().size() + " plans:\n";
		for(Plan plan : getPlans()) {
			s += "\t" + plan + "\n";
		}
		return s;
	}

	@Override
	public String toString() {
		String s = "Found " + solutions.size() + " high-level solutions:\n";
		for(List<Set<Action>> solution : solutions) {
			s += "\t" + solution.size() + " steps: ";
			for(Set<Action> set : solution) {
				s += "\t" + set;
			}
			s += "\n";
		}
		return s;
	}
}
