package Bean;

import java.io.Serializable;

public class attendrecord implements Serializable {

	private int studentId;
	private int sequentialDays;
	private int totalDays;
	private int schoolTime;
	private int classTime;

	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public int getSequentialDays() {
		return sequentialDays;
	}
	public void setSequentialDays(int sequentialDays) {
		this.sequentialDays = sequentialDays;
	}
	public int getTotalDays() {
		return totalDays;
	}
	public void setTotalDays(int totalDays) {
		this.totalDays = totalDays;
	}
	public int getSchoolTime() {
		return schoolTime;
	}
	public void setSchoolTime(int schoolTime) {
		this.schoolTime = schoolTime;
	}
	public int getClassTime() {
		return classTime;
	}
	public void setClassTime(int classTime) {
		this.classTime = classTime;
	}

}
