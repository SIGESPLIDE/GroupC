package Bean;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.ZoneId;

public class dailyattend implements Serializable {
	LocalDateTime jstNow = LocalDateTime.now(ZoneId.of("Asia/Tokyo"));

	private int studentId;
	private LocalDateTime loginTime;
	private LocalDateTime logoutTime;

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public LocalDateTime getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(LocalDateTime loginTime) {
		this.loginTime = loginTime;
	}

	public LocalDateTime getLogoutTime() {
		return logoutTime;
	}

	public void setLogoutTime(LocalDateTime logoutTime) {
		this.logoutTime = logoutTime;
	}

}
