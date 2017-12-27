package com.finalTotal.dinner.event.model;

import java.sql.Timestamp;

public class EventVO {
	private int eventNo;
	private int resNo;
	private String eventTitle;
	private String eventContent;
	private String eventThumb;
	private String eventIsEnd;
	private Timestamp eventStartDate;
	private Timestamp eventEndDate;
	private Timestamp eventRegdate;
	
	public int getEventNo() {
		return eventNo;
	}
	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}
	public int getResNo() {
		return resNo;
	}
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	public String getEventTitle() {
		return eventTitle;
	}
	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}
	public String getEventContent() {
		return eventContent;
	}
	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}
	public String getEventThumb() {
		return eventThumb;
	}
	public void setEventThumb(String eventThumb) {
		this.eventThumb = eventThumb;
	}
	public String getEventIsEnd() {
		return eventIsEnd;
	}
	public void setEventIsEnd(String eventIsEnd) {
		this.eventIsEnd = eventIsEnd;
	}
	public Timestamp getEventStartDate() {
		return eventStartDate;
	}
	public void setEventStartDate(Timestamp eventStartDate) {
		this.eventStartDate = eventStartDate;
	}
	public Timestamp getEventEndDate() {
		return eventEndDate;
	}
	public void setEventEndDate(Timestamp eventEndDate) {
		this.eventEndDate = eventEndDate;
	}
	public Timestamp getEventRegdate() {
		return eventRegdate;
	}
	public void setEventRegdate(Timestamp eventRegdate) {
		this.eventRegdate = eventRegdate;
	}
	
	@Override
	public String toString() {
		return "EventVO [eventNo=" + eventNo + ", resNo=" + resNo + ", eventTitle=" + eventTitle + ", eventContent="
				+ eventContent + ", eventThumb=" + eventThumb + ", eventIsEnd=" + eventIsEnd + ", eventStartDate="
				+ eventStartDate + ", eventEndDate=" + eventEndDate + ", eventRegdate=" + eventRegdate + "]";
	}
	
}
