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
	private boolean normKeeperUpdated = false;

	NormKeeperSearchNode(STRIPSState state, Set<? extends Norm> norms) {
		this(null, null, state, norms);
	}

	NormKeeperSearchNode(NormSearchNode previousNode, Action previousAction, STRIPSState state, Set<? extends Norm> norms) {
		super(previousNode, previousAction, state, norms);
		if(this.previousNode == null) {
			this.normKeeper = new NormKeeper();
			checkAndUpdateNormKeeper();
		} else {
			this.normKeeper = ((NormKeeperSearchNode)this.previousNode).getCloneNormKeeper();
		}
	}

	private NormKeeper getCloneNormKeeper() {
		return normKeeper.getCopy();
	}

	private void checkAndUpdateNormKeeper() {
		if(!normKeeperUpdated) {
			normKeeper.update(state);
			normKeeperUpdated = true;
		}
	}

	@Override
	public boolean isAbsoluteViolation() {
		checkAndUpdateNormKeeper();
		return normKeeper.isAbsoluteViolation();
	}

	@Override
	public boolean isCurrentlyViolation() {
		checkAndUpdateNormKeeper();
		return normKeeper.isCurrentlyViolation();
	}

	private class NormKeeper {
		Set<GroundLtlNorm> actualGroundLtlNorms;
		Set<GroundLtlNorm> curretlyiolationNorms;
		Set<GroundLtlNorm> abolsuteViolationNorms;

		NormKeeper() {
			this(true);
		}

		private NormKeeper(boolean init) {
			if(init) {
				actualGroundLtlNorms = new HashSet<>();
				curretlyiolationNorms = new HashSet<>();
				abolsuteViolationNorms = new HashSet<>();

				for(Norm norm : norms) {
					if(norm instanceof GroundLtlNorm) {
						GroundLtlNorm groundLtlNorm = (GroundLtlNorm) norm;
						if(groundLtlNorm.getConnective().equals(Connective.ALWAYS)
								|| groundLtlNorm.getConnective().equals(Connective.SOMETIME_AFTER)) {
							actualGroundLtlNorms.add(groundLtlNorm);
						} else if(groundLtlNorm.getConnective().equals(Connective.SOMETIME)) {
							curretlyiolationNorms.add(groundLtlNorm);
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
					curretlyiolationNorms.add(groundLtlNorm);
				}
			}

			// Update norms
			Set<GroundLtlNorm> newAbsoluteViolations = new HashSet<>();
			Set<GroundLtlNorm> newNotViolations = new HashSet<>();
			for(GroundLtlNorm groundLtlNorm : curretlyiolationNorms) {
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

			curretlyiolationNorms.removeAll(newAbsoluteViolations);
			curretlyiolationNorms.removeAll(newNotViolations);
			abolsuteViolationNorms.addAll(newAbsoluteViolations);

			// Add to currently violation
			for(GroundLtlNorm groundLtlNorm : actualGroundLtlNorms) {
				if(groundLtlNorm.getConnective().equals(Connective.SOMETIME_AFTER)) {
					if(groundLtlNorm.isOTrue(newState)) {
						curretlyiolationNorms.add(groundLtlNorm);
					}
				}
			}
		}

		boolean isCurrentlyViolation() {
			return isAbsoluteViolation() || !curretlyiolationNorms.isEmpty();
		}

		boolean isAbsoluteViolation() {
			return !abolsuteViolationNorms.isEmpty();
		}

		protected NormKeeper getCopy() {
			NormKeeper normKeeper = new NormKeeper(false);
			normKeeper.actualGroundLtlNorms = new HashSet<>(this.actualGroundLtlNorms);
			normKeeper.abolsuteViolationNorms = new HashSet<>(this.abolsuteViolationNorms);
			normKeeper.curretlyiolationNorms = new HashSet<>(this.curretlyiolationNorms);
			return normKeeper;
		}

		@Override
		public String toString() {
			return "Norm Keeper:\n\tCurrently violation norms:" + curretlyiolationNorms + "\n\tAbsolute violation norms:" + abolsuteViolationNorms;
		}
	}
}
