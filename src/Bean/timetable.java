package Bean;

import java.io.Serializable;

public class timetable implements Serializable {

	private int id;
	private String classes;
	private String weekday;
	private int period;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getClasses() {
		return classes;
	}
	public void setClasses(String classes) {
		this.classes = classes;
	}
	public String getWeekday() {
		return weekday;
	}
	public void setWeekday(String weekday) {
		this.weekday = weekday;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
}
