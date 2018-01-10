package com.finalTotal.dinner.groupBoard.model;

import java.sql.Timestamp;

public class GroupBoardVO {
/*	CREATE TABLE group_board (
			gboard_no NUMBER NOT NULL,  그룹게시판 번호 
			group_no NUMBER,  그룹 번호 
			mem_no NUMBER,  회원 번호 
			gboard_title VARCHAR2(250),  그룹게시판 제목 
			gboard_contents CLOB,  그룹게시판 내용 
			gboard_regdate DATE default sysdate 그룹게시판 작성일 
		);*/
	private int gboardNo, groupNo, memNo, rsnum;
	private String gboardTitle, gboardContents, memName, groupName;
	private Timestamp gboardRegdate;
	public int getGboardNo() {
		return gboardNo;
	}
	public void setGboardNo(int gboardNo) {
		this.gboardNo = gboardNo;
	}
	public int getRsnum() {
		return rsnum;
	}
	public void setRsnum(int rsnum) {
		this.rsnum = rsnum;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getGboardTitle() {
		return gboardTitle;
	}
	public void setGboardTitle(String gboardTitle) {
		this.gboardTitle = gboardTitle;
	}
	public String getGboardContents() {
		return gboardContents;
	}
	public void setGboardContents(String gboardContents) {
		this.gboardContents = gboardContents;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public Timestamp getGboardRegdate() {
		return gboardRegdate;
	}
	public void setGboardRegdate(Timestamp gboardRegdate) {
		this.gboardRegdate = gboardRegdate;
	}
	@Override
	public String toString() {
		return "GroupBoardVO [gboardNo=" + gboardNo + ", groupNo=" + groupNo + ", memNo=" + memNo + ", gboardTitle="
				+ gboardTitle + ", gboardContents=" + gboardContents + ", memName=" + memName + ", groupName="
				+ groupName + ", gboardRegdate=" + gboardRegdate + "]";
	}
	
}
