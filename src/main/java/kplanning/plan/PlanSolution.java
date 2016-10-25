package kplanning.plan;

import javaff.data.Action;
import kplanning.DomainProblemAdapter;
import kplanning.norm.Norm;
import kplanning.util.SetUtil;
import org.jetbrains.annotations.Nullable;

import java.util.*;

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

	public PlanSolution(DomainProblemAdapter adapter, Set<Plan> plans) {
		this.adapter = adapter;
		this.plans = plans;
	}

	public PlanSolution(DomainProblemAdapter adapter, Plan plan) {
		this(adapter, new HashSet<>(Collections.singletonList(plan)));
	}

	@Nullable
	public Set<List<Set<Action>>> getSolutions() {
		return solutions;
	}

	/**
	 * Utils
	 */

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

	// Return the first plan
	@Nullable
	public Plan getPlan() {
		Set<Plan> plans = getPlans();
		if(plans != null && plans.size() > 0) {
			return plans.iterator().next();
		} else {
			return null;
		}
	}

	public PlanSolution getSinglePlanSolution() {
		return new PlanSolution(adapter, getPlan());
	}

	/**
	 * Norm related
	 */

	@Nullable
	public PlanSolution filterPlansBasedOnNorms(Set<? extends Norm> norms, boolean returnCompliantPlans) {
		Set<Plan> plans = new HashSet<>();
		for(Plan plan : getPlans()) {
			boolean isCompliant = true;

			for(Norm norm : norms) {
				if(norm.isViolationPlan(plan)) {
					isCompliant = false;
					break;
				}
			}

			if((isCompliant && returnCompliantPlans) || (!isCompliant && !returnCompliantPlans)) {
				plans.add(plan);
			}
		}

		if(plans.isEmpty()) {
			return null;
		} else {
			return new PlanSolution(adapter, plans);
		}
	}

	/**
	 * Utils
	 */

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
		boolean shouldAddNewLine = false;
		for(List<Set<Action>> solution : solutions) {
			if(shouldAddNewLine) {
				s += "\n";
			} else {
				shouldAddNewLine = true;
			}
			s += "\t" + solution.size() + " steps: ";
			for(Set<Action> set : solution) {
				s += "\t" + set;
			}
		}
		return s;
	}
}
