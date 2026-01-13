package Bean;

import java.io.Serializable;

public class supportlevel implements Serializable {

	private int studentId;
	private int supportLevel;

	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public int getSupportLevel() {
		return supportLevel;
	}
	public void setSupportLevel(int supportLevel) {
		this.supportLevel = supportLevel;
	}


}
