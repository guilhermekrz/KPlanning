package kplanning.util.statistic;

public class MeanStatistic extends Statistic {
	private int count = 0;

	public MeanStatistic(String description) {
		super(description, 0);
	}

	public MeanStatistic(String description, int value, int count) {
		super(description, value);
		this.count = count;
	}

	public void addValue(int value) {
		this.value += value;
		count++;
	}

	public double getMean() {
		if(count != 0) {
			return value / count;
		} else {
			return 0;
		}
	}

	@Override
	public String toString() {
		return "Statistic(" + description + ") - mean: " + getMean() + " (" + value + "/" + count + ")";
	}
}
