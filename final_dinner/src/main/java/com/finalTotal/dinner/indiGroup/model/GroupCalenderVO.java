package com.finalTotal.dinner.indiGroup.model;

import java.sql.Timestamp;

public class GroupCalenderVO {
/*	CREATE TABLE group_calender (
			cal_no NUMBER NOT NULL,  그룹일정 번호 
			group_no NUMBER,  그룹 번호 
			cal_year NUMBER NOT NULL, 년
			cal_month NUMBER NOT NULL, 월
			cal_date NUMBER NOT NULL, 일
			cal_contents VARCHAR2(300) NOT NULL,  일정 내용 
			cal_regdate DATE DEFAULT sysdate  등록일 
		);*/
	private int calNo, groupNo, calYear, calMonth, calDate;
	private String calContents;
	private Timestamp calRegdate;
	public int getCalNo() {
		return calNo;
	}
	public void setCalNo(int calNo) {
		this.calNo = calNo;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getCalYear() {
		return calYear;
	}
	public void setCalYear(int calYear) {
		this.calYear = calYear;
	}
	public int getCalMonth() {
		return calMonth;
	}
	public void setCalMonth(int calMonth) {
		this.calMonth = calMonth;
	}
	public int getCalDate() {
		return calDate;
	}
	public void setCalDate(int calDate) {
		this.calDate = calDate;
	}
	public String getCalContents() {
		return calContents;
	}
	public void setCalContents(String calContents) {
		this.calContents = calContents;
	}
	public Timestamp getCalRegdate() {
		return calRegdate;
	}
	public void setCalRegdate(Timestamp calRegdate) {
		this.calRegdate = calRegdate;
	}
	@Override
	public String toString() {
		return "GroupCalenderVO [calNo=" + calNo + 
				", groupNo=" + groupNo + 
				", calContents=" + calContents + 
				", calRegdate=" + calRegdate + "]";
	}
	
}
