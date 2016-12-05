package kplanning.util.statistic;

public class TimeStatistic extends Statistic {
	private double finalValue = -1;

	public TimeStatistic() {
		super(null, -1);
	}

	public void init() {
		this.value = System.currentTimeMillis();
	}

	public void stop() {
		this.finalValue = System.currentTimeMillis();
	}

	public double getCurrentDiff() {
		return System.currentTimeMillis() - this.value;
	}

	public double getDiff() {
		if(this.value != -1 && this.finalValue != -1) {
			return this.finalValue - this.value;
		} else {
			return 0;
		}
	}

	@Override
	public String toString() {
		return "Statistic(time elapsed) - time (ms): " + getDiff();
	}
}
