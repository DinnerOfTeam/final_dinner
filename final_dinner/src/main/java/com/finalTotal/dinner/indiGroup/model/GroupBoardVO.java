package com.finalTotal.dinner.indiGroup.model;

import java.sql.Timestamp;

public class GroupBoardVO {
/*	CREATE TABLE group_board (
			gBoard_no NUMBER NOT NULL,  그룹게시판 번호 
			group_no NUMBER,  그룹 번호 
			mem_no NUMBER,  회원 번호 
			gBoard_title VARCHAR2(250),  그룹게시판 제목 
			gBoard_contents CLOB,  그룹게시판 내용 
			gBoard_regdate DATE default sysdate 그룹게시판 작성일 
		);*/
	private int gBoardNo, groupNo, memNo;
	private String gBoardTitle, gBoardContents, memName;
	private Timestamp gBoardRegdate;
	public int getgBoardNo() {
		return gBoardNo;
	}
	public void setgBoardNo(int gBoardNo) {
		this.gBoardNo = gBoardNo;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getgBoardTitle() {
		return gBoardTitle;
	}
	public void setgBoardTitle(String gBoardTitle) {
		this.gBoardTitle = gBoardTitle;
	}
	public String getgBoardContents() {
		return gBoardContents;
	}
	public void setgBoardContents(String gBoardContents) {
		this.gBoardContents = gBoardContents;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public Timestamp getgBoardRegdate() {
		return gBoardRegdate;
	}
	public void setgBoardRegdate(Timestamp gBoardRegdate) {
		this.gBoardRegdate = gBoardRegdate;
	}
	@Override
	public String toString() {
		return "GroupBoardVO [gBoardNo=" + gBoardNo + 
				", groupNo=" + groupNo + 
				", memNo=" + memNo + 
				", gBoardTitle=" + gBoardTitle + 
				", gBoardContents=" + gBoardContents + 
				", memName=" + memName + 
				", gBoardRegdate=" + gBoardRegdate + "]";
	}
	
}
