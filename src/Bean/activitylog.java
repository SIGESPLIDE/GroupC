package Bean;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.ZoneId;

public class activitylog implements Serializable {

	LocalDateTime jstNow = LocalDateTime.now(ZoneId.of("Asia/Tokyo"));
	private int studentId;
	private LocalDateTime datetime;
	private int emotionLog;
	private String chatLog;

	public LocalDateTime getJstNow() {
		return jstNow;
	}
	public void setJstNow(LocalDateTime jstNow) {
		this.jstNow = jstNow;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public LocalDateTime getDatetime() {
		return datetime;
	}
	public void setDatetime(LocalDateTime datetime) {
		this.datetime = datetime;
	}
	public int getEmotionLog() {
		return emotionLog;
	}
	public void setEmotionLog(int emotionLog) {
		this.emotionLog = emotionLog;
	}
	public String getChatLog() {
		return chatLog;
	}
	public void setChatLog(String chatLog) {
		this.chatLog = chatLog;
	}
}
