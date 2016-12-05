package kplanning.planner.normPlanner;

import fr.uga.pddl4j.parser.Connective;
import javaff.data.Action;
import javaff.planning.STRIPSState;
import kplanning.norm.GroundLtlNorm;
import kplanning.norm.Norm;

import java.util.HashSet;
import java.util.Set;

public class NormKeeperSearchNode extends NormSearchNode {

	private NormKeeper normKeeper;

	NormKeeperSearchNode(STRIPSState state, Set<? extends Norm> norms) {
		this(null, null, state, norms);
	}

	NormKeeperSearchNode(NormSearchNode previousNode, Action previousAction, STRIPSState state, Set<? extends Norm> norms) {
		super(previousNode, previousAction, state, norms);
		if(this.previousNode == null) {
			this.normKeeper = new NormKeeper();
		} else {
			this.normKeeper = ((NormKeeperSearchNode)this.previousNode).getCloneNormKeeper();
		}
		normKeeper.update(state);
		this.totalNormCost = normKeeper.getTotalNormCost();
		this.absoluteNormCost = normKeeper.getAbsoluteNormCost();
		this.currentNormCost = normKeeper.getCurrentNormCost();
	}

	private NormKeeper getCloneNormKeeper() {
		return normKeeper.getCopy();
	}

	@Override
	public boolean isAbsoluteViolation() {
		return normKeeper.isAbsoluteViolation();
	}

	@Override
	public boolean isCurrentlyViolation() {
		return normKeeper.isCurrentlyViolation();
	}

	private class NormKeeper {
		Set<GroundLtlNorm> actualGroundLtlNorms;
		Set<GroundLtlNorm> currentlyViolationNorms;
		Set<GroundLtlNorm> absoluteViolationNorms;

		NormKeeper() {
			this(true);
		}

		private NormKeeper(boolean init) {
			if(init) {
				actualGroundLtlNorms = new HashSet<>();
				currentlyViolationNorms = new HashSet<>();
				absoluteViolationNorms = new HashSet<>();

				for(Norm norm : norms) {
					if(norm instanceof GroundLtlNorm) {
						GroundLtlNorm groundLtlNorm = (GroundLtlNorm) norm;
						if(groundLtlNorm.getConnective().equals(Connective.ALWAYS)
								|| groundLtlNorm.getConnective().equals(Connective.SOMETIME_AFTER)) {
							actualGroundLtlNorms.add(groundLtlNorm);
						} else if(groundLtlNorm.getConnective().equals(Connective.SOMETIME)) {
							currentlyViolationNorms.add(groundLtlNorm);
						}
					} else {
						throw new IllegalStateException("NormKeeperSearchNode only deals with LTLNorms");
					}
				}
			}
		}

		void update(STRIPSState newState) {
			// Add to pending violation
			for(GroundLtlNorm groundLtlNorm : actualGroundLtlNorms) {
				if(groundLtlNorm.getConnective().equals(Connective.ALWAYS)) {
					currentlyViolationNorms.add(groundLtlNorm);
				}
			}

			// Update norms
			Set<GroundLtlNorm> newAbsoluteViolations = new HashSet<>();
			Set<GroundLtlNorm> newNotViolations = new HashSet<>();
			for(GroundLtlNorm groundLtlNorm : currentlyViolationNorms) {
				if(groundLtlNorm.getConnective().equals(Connective.ALWAYS)) {
					if(groundLtlNorm.isOTrue(newState)) {
						newNotViolations.add(groundLtlNorm);
					} else {
						newAbsoluteViolations.add(groundLtlNorm);
					}
				} else if(groundLtlNorm.getConnective().equals(Connective.SOMETIME)) {
					if(groundLtlNorm.isOTrue(newState)) {
						newNotViolations.add(groundLtlNorm);
					}
				} else if(groundLtlNorm.getConnective().equals(Connective.SOMETIME_AFTER)) {
					if(groundLtlNorm.isVTrue(newState)) {
						newNotViolations.add(groundLtlNorm);
					}
				}
			}

			currentlyViolationNorms.removeAll(newAbsoluteViolations);
			currentlyViolationNorms.removeAll(newNotViolations);
			absoluteViolationNorms.addAll(newAbsoluteViolations);

			// Add to currently violation
			for(GroundLtlNorm groundLtlNorm : actualGroundLtlNorms) {
				if(groundLtlNorm.getConnective().equals(Connective.SOMETIME_AFTER)) {
					if(groundLtlNorm.isOTrue(newState)) {
						currentlyViolationNorms.add(groundLtlNorm);
					}
				}
			}
		}

		boolean isCurrentlyViolation() {
			return isAbsoluteViolation() || !currentlyViolationNorms.isEmpty();
		}

		boolean isAbsoluteViolation() {
			return !absoluteViolationNorms.isEmpty();
		}

		int totalNormCost, absoluteNormCost, currentNormCost;

		public int getTotalNormCost() {
			checkAndPopulateCost();
			return totalNormCost;
		}

		public int getAbsoluteNormCost() {
			checkAndPopulateCost();
			return absoluteNormCost;
		}

		public int getCurrentNormCost() {
			checkAndPopulateCost();
			return currentNormCost;
		}

		private void checkAndPopulateCost() {
			if(totalNormCost == -1 || absoluteNormCost == -1 || currentNormCost == -1) {
				totalNormCost = 0;
				absoluteNormCost = 0;
				currentNormCost = 0;

				for(GroundLtlNorm groundLtlNorm : currentlyViolationNorms) {
					totalNormCost += groundLtlNorm.getCost();
					currentNormCost += groundLtlNorm.getCost();
				}
				for(GroundLtlNorm groundLtlNorm : absoluteViolationNorms) {
					totalNormCost += groundLtlNorm.getCost();
					currentNormCost += groundLtlNorm.getCost();
					absoluteNormCost += groundLtlNorm.getCost();
				}
			}
		}

		protected NormKeeper getCopy() {
			NormKeeper normKeeper = new NormKeeper(false);
			normKeeper.actualGroundLtlNorms = new HashSet<>(this.actualGroundLtlNorms);
			normKeeper.absoluteViolationNorms = new HashSet<>(this.absoluteViolationNorms);
			normKeeper.currentlyViolationNorms = new HashSet<>(this.currentlyViolationNorms);
			return normKeeper;
		}

		@Override
		public String toString() {
			return "Norm Keeper:\n\tCurrently violation norms:" + currentlyViolationNorms + "\n\tAbsolute violation norms:" + absoluteViolationNorms;
		}
	}
}
