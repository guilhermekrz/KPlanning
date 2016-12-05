package kplanning.planner.normPlanner;

import fr.uga.pddl4j.parser.Connective;
import javaff.data.Action;
import javaff.planning.STRIPSState;
import kplanning.norm.GroundConditionalNorm;
import kplanning.norm.GroundLtlNorm;
import kplanning.norm.Norm;

import java.util.List;
import java.util.Set;

class RuntimeNormSearchNode extends NormSearchNode {

	private boolean isAbsoluteViolation, isCurrentlyViolation;

	RuntimeNormSearchNode(STRIPSState state, Set<? extends Norm> norms) {
		this(null, null, state, norms);
	}

	RuntimeNormSearchNode(NormSearchNode previousNode, Action previousAction, STRIPSState state, Set<? extends Norm> norms) {
		super(previousNode, previousAction, state, norms);
		this.totalNormCost = 0;
		this.absoluteNormCost = 0;
		this.currentNormCost = 0;
		updateViolation();
	}

	@Override
	public boolean isAbsoluteViolation() {
		return isAbsoluteViolation;
	}

	@Override
	public boolean isCurrentlyViolation() {
		return isCurrentlyViolation;
	}

	// TODO: for future work, use some sort of memoization, using previous search node
	private void updateViolation() {
		List<STRIPSState> states = getStates();
		List<Action> actions = getActions();
		isAbsoluteViolation = false;
		isCurrentlyViolation = false;
		for(Norm norm : norms) {
			if(norm.isViolationPlan(states, actions)) {
				if(norm instanceof GroundLtlNorm) {
					GroundLtlNorm groundLtlNorm = (GroundLtlNorm) norm;
					if (groundLtlNorm.getConnective() == Connective.ALWAYS) {
						isCurrentlyViolation = true;
						isAbsoluteViolation = true;

						this.totalNormCost += groundLtlNorm.getCost();
						this.currentNormCost += groundLtlNorm.getCost();
						this.absoluteNormCost += groundLtlNorm.getCost();
					} else if (groundLtlNorm.getConnective() == Connective.AT_END) {
						isCurrentlyViolation = true;

						this.totalNormCost += groundLtlNorm.getCost();
						this.currentNormCost += groundLtlNorm.getCost();
					} else if (groundLtlNorm.getConnective() == Connective.SOMETIME) {
						isCurrentlyViolation = true;

						this.totalNormCost += groundLtlNorm.getCost();
						this.currentNormCost += groundLtlNorm.getCost();
					} else if (groundLtlNorm.getConnective() == Connective.AT_MOST_ONCE) {
						isCurrentlyViolation = true;
						isAbsoluteViolation = true;

						this.totalNormCost += groundLtlNorm.getCost();
						this.currentNormCost += groundLtlNorm.getCost();
						this.absoluteNormCost += groundLtlNorm.getCost();
					} else if (groundLtlNorm.getConnective() == Connective.SOMETIME_AFTER) {
						isCurrentlyViolation = true;

						this.totalNormCost += groundLtlNorm.getCost();
						this.currentNormCost += groundLtlNorm.getCost();
					} else if (groundLtlNorm.getConnective() == Connective.SOMETIME_BEFORE) {
						isCurrentlyViolation = true;
						isAbsoluteViolation = true;

						this.totalNormCost += groundLtlNorm.getCost();
						this.currentNormCost += groundLtlNorm.getCost();
						this.absoluteNormCost += groundLtlNorm.getCost();
						break;
					} else if (groundLtlNorm.getConnective() == Connective.ALWAYS_WITHIN) {
						isCurrentlyViolation = true;

						this.totalNormCost += groundLtlNorm.getCost();
						this.currentNormCost += groundLtlNorm.getCost();
					}
				} else if(norm instanceof GroundConditionalNorm) {
					GroundConditionalNorm groundConditionalNorm = (GroundConditionalNorm) norm;
					isCurrentlyViolation = true;
					isAbsoluteViolation = true;

					this.totalNormCost += groundConditionalNorm.getCost();
					this.currentNormCost += groundConditionalNorm.getCost();
					this.absoluteNormCost += groundConditionalNorm.getCost();
				}
			}
		}
	}
}
