package Bean;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.List;

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
	public String getFormattedDate() {
	    if (this.datetime == null) return "";
	    return this.datetime.format(DateTimeFormatter.ofPattern("M月d日"));
	}
	public String getFormattedDatetime() {
	    if (this.datetime == null) return "";
	    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("M月d日 H時mm分ss秒");
	    return this.datetime.format(dtf);
	}
	public void highlightKeywords(List<String> keywords) {
	    if (this.chatLog == null || keywords == null) return;
	    for (String word : keywords) {
	        this.chatLog = this.chatLog.replace(word, "<span style='color:red; font-weight:bold;'>" + word + "</span>");
	    }
	}
}
