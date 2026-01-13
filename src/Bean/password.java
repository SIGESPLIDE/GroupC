package Bean;

import java.io.Serializable;

public class password implements Serializable {

	private int id;
	private String roomTPass;
	private String adminPass;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRoomTPass() {
		return roomTPass;
	}
	public void setRoomTPass(String roomTPass) {
		this.roomTPass = roomTPass;
	}
	public String getAdminPass() {
		return adminPass;
	}
	public void setAdminPass(String adminPass) {
		this.adminPass = adminPass;
	}
}
