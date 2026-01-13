package Bean;

import java.io.Serializable;

public class keyword implements Serializable {

	private int id;
	private String phrase;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPhrase() {
		return phrase;
	}
	public void setPhrase(String phrase) {
		this.phrase = phrase;
	}
}
