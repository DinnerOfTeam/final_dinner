package com.finalTotal.dinner.chat.model;

public class ChattingUserVO {
/*	CREATE TABLE chatting_user (
			mem_no NUMBER NOT NULL,  회원 번호 
			group_no NUMBER NOT NULL,  그룹 번호 
			chat_user_exist VARCHAR2(1)  로그인여부 
		);*/
	private int memNo, groupNo;
	private String chatUserExist, memName;
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
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
	public String getChatUserExist() {
		return chatUserExist;
	}
	public void setChatUserExist(String chatUserExist) {
		this.chatUserExist = chatUserExist;
	}
	@Override
	public String toString() {
		return "ChattingUserVO [memNo=" + memNo + 
				", groupNo=" + groupNo + 
				", chatUserExist=" + chatUserExist + "]";
	}
}
