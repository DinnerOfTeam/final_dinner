package com.finalTotal.dinner.chat.model;

import java.util.Date;

public class ChattingVO {
/*	CREATE TABLE chatting (
			chat_no NUMBER NOT NULL,  채팅 번호 
			group_no NUMBER,  그룹 번호 
			mem_no NUMBER,  회원 번호 
			chat_contents VARCHAR2(300),  내용 
			chat_regdate DATE DEFAULT sysdate  작성시간 
		);*/
	private int chatNo, groupNo, memNo;
	private String chatContents, memName;
	private Date chatRegdate;
	public int getChatNo() {
		return chatNo;
	}
	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
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
	public String getChatContents() {
		return chatContents;
	}
	public void setChatContents(String chatContents) {
		this.chatContents = chatContents;
	}
	public Date getChatRegdate() {
		return chatRegdate;
	}
	public void setChatRegdate(Date chatRegdate) {
		this.chatRegdate = chatRegdate;
	}
	@Override
	public String toString() {
		return "ChattingVO [chatNo=" + chatNo + 
				", groupNo=" + groupNo + 
				", memNo=" + memNo + 
				", chatContents=" + chatContents + 
				", chatRegdate=" + chatRegdate + "]";
	}

}
