package com.finalTotal.dinner.code.model;

public class EmailVO {
	private String from, to, title, msg;

	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setsendTo(String sendto) {
		this.to = sendto;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}

	@Override
	public String toString() {
		return "EmailVO [from=" + from + 
				", to=" + to + 
				", title=" + title + 
				", msg=" + msg + "]";
	}
}
