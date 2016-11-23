package kplanning.util.statistic;

public class Statistic {
    double value = 0;
    String description;

    public Statistic(String description, double value) {
        this.description = description;
        this.value = value;
    }

    @Override
    public String toString() {
        return "Statistic(" + description + ") - value: " + value;
    }
}
