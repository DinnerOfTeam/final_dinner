package com.finalTotal.dinner.indiGroup.model;

public class GroupMemberVO {
/*	CREATE TABLE group_regi (
			group_mem_no NUMBER NOT NULL,  그룹신청 번호 
			group_no NUMBER,  그룹 번호 
			mem_no NUMBER  회원 번호 
		);*/
	private int groupMemNo, groupNo, memNo;

	public int getGroupMemNo() {
		return groupMemNo;
	}
	public void setGroupMemNo(int groupMemNo) {
		this.groupMemNo = groupMemNo;
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
		return "GroupMemberVO [groupMemNo=" + groupMemNo + 
				", groupNo=" + groupNo + 
				", memNo=" + memNo + "]";
	}
}
