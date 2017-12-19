package com.finalTotal.dinner.indiGroup.model;

public final class IndigroupVO {
/*	CREATE TABLE indigroup (
			group_no NUMBER NOT NULL,  그룹 번호 
			mem_no NUMBER,  회원 번호 
			group_name VARCHAR2(100) NOT NULL,  그룹이름 
			group_info VARCHAR2(600)  설명 
		);*/
	private int groupNo, memNo, numGroupMember;
	private String groupName, groupInfo, memName;
	public int getGroupNo() {
		return groupNo;
	}
	public int getNumGroupMember() {
		return numGroupMember;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public void setNumGroupMember(int numGroupMember) {
		this.numGroupMember = numGroupMember;
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
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getGroupInfo() {
		return groupInfo;
	}
	public void setGroupInfo(String groupInfo) {
		this.groupInfo = groupInfo;
	}
	@Override
	public String toString() {
		return "IndigroupVO [groupNo=" + groupNo + 
				", memNo=" + memNo + 
				", groupName=" + groupName + 
				", groupInfo=" + groupInfo + "]";
	}
	
}
