package Bean;

import java.io.Serializable;

public class timetable implements Serializable {

    private String classes;
    private String subject;
    private String weekday;
    private int period;

    public String getClasses() {
    	return classes;
    }
    public void setClasses(String classes) {
    	this.classes = classes;
    }
    public String getSubject() {
    	return subject;
    }
    public void setSubject(String subject) {
    	this.subject = subject;
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