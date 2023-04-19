package org.datafetching;

public class MessageNotif {
	private int id;
	private int state;
	
	public int getId() {
		return id;
	}

	public int getState() {
		return state;
	}

	public MessageNotif(int id, int state) {
		this.id = id;
		this.state = state;
	}
	
}