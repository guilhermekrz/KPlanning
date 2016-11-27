package kplanning.plan;

import javaff.data.Action;
import kplanning.DomainProblemAdapter;
import kplanning.norm.Norm;
import kplanning.util.SetUtil;
import kplanning.util.statistic.MemoryStatistic;
import kplanning.util.statistic.Statistic;
import kplanning.util.statistic.TimeStatistic;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.*;

public class PlanSolution {
	private DomainProblemAdapter adapter;
	private Set<List<Set<Action>>> solutions;
	private Set<Plan> plans;
	private List<Statistic> statistics;
	private PlanSolutionType planSolutionType;

	private enum PlanSolutionType {
		PARALLEL_SOLUTIONS, SEQUENTIAL_SOLUTIONS, NO_SOLUTION
	}

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
		this.statistics = new ArrayList<>();
		this.planSolutionType = PlanSolutionType.PARALLEL_SOLUTIONS;
	}

	public PlanSolution(DomainProblemAdapter adapter, Set<Plan> plans) {
		this.adapter = adapter;
		this.plans = plans;
		this.statistics = new ArrayList<>();
		this.planSolutionType = PlanSolutionType.SEQUENTIAL_SOLUTIONS;
	}

	public PlanSolution(DomainProblemAdapter adapter, Plan plan) {
		this(adapter, new HashSet<>(Collections.singletonList(plan)));
	}

	private static PlanSolution noSolutionPlanSolution;
	public static PlanSolution getNoSolutionPlanSolution(DomainProblemAdapter adapter) {
		if(noSolutionPlanSolution == null) {
			noSolutionPlanSolution = new PlanSolution(adapter, new HashSet<>());
			noSolutionPlanSolution.planSolutionType = PlanSolutionType.NO_SOLUTION;
		}
		return noSolutionPlanSolution;
	}

	public boolean hasSolution() {
		return !planSolutionType.equals(PlanSolutionType.NO_SOLUTION);
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

	@NotNull
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
			return PlanSolution.getNoSolutionPlanSolution(adapter);
		} else {
			return new PlanSolution(adapter, plans);
		}
	}

	/**
	 * Statistics
	 */

	private boolean isTimeout;

	public boolean isTimeout() {
		return isTimeout;
	}

	public void setTimeout(boolean isTimeout) {
		this.isTimeout = isTimeout;
	}

	public void addStatistic(Statistic statistic) {
		this.statistics.add(statistic);
	}

	public String getTime() {
		if(isTimeout) {
			return "-";
		}
		return String.valueOf(getDoubleTime());
	}

	public double getDoubleTime() {
		for(Statistic statistic : statistics) {
			if(statistic instanceof TimeStatistic) {
				return ((TimeStatistic) statistic).getDiff();
			}
		}
		throw new IllegalStateException("TimeStatistic does not exist");
	}

	public double getMemoryMB() {
		for(Statistic statistic : statistics) {
			if(statistic instanceof MemoryStatistic) {
				return ((MemoryStatistic) statistic).getMemoryInMb();
			}
		}
		throw new IllegalStateException("MemoryStatistic does not exist");
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
		String s;
		if(planSolutionType.equals(PlanSolutionType.PARALLEL_SOLUTIONS)) {
			s = "Found " + solutions.size() + " high-level solutions:\n";
			boolean shouldAddNewLine = false;
			for (List<Set<Action>> solution : solutions) {
				if (shouldAddNewLine) {
					s += "\n";
				} else {
					shouldAddNewLine = true;
				}
				s += "\t" + solution.size() + " steps: ";
				for (Set<Action> set : solution) {
					s += "\t" + set;
				}
			}
		} else if(planSolutionType.equals(PlanSolutionType.SEQUENTIAL_SOLUTIONS)) {
			s = "Found " + plans.size() + " high-level solutions:\n";
			boolean shouldAddNewLine = false;
			for (Plan plan : plans) {
				if (shouldAddNewLine) {
					s += "\n";
				} else {
					shouldAddNewLine = true;
				}
				s += "\t" + plan;
			}
		} else if(planSolutionType.equals(PlanSolutionType.NO_SOLUTION)) {
			s = "No solutions found";
		} else {
			s = "Unknown planSolutionType: " + planSolutionType;
		}
		return s;
	}
}
