package com.finalTotal.dinner.indiGroup.model;

public class GroupRegiVO {
/*	CREATE TABLE group_regi (
			group_regi NUMBER NOT NULL,  그룹신청 번호 
			group_no NUMBER,  그룹 번호 
			mem_no NUMBER  회원 번호 
		);*/
	private int groupRegiNo, groupNo, memNo;
	private String memName;

	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public int getGroupRegiNo() {
		return groupRegiNo;
	}
	public void setGroupRegiNo(int groupRegiNo) {
		this.groupRegiNo = groupRegiNo;
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

	@Override
	public String toString() {
		return "GroupRegiVO [groupRegiNo=" + groupRegiNo + 
				", groupNo=" + groupNo + 
				", memNo=" + memNo + "]";
	}
}
