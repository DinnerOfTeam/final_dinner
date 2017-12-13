package com.finalTotal.dinner.indiGroup.model;

public class GroupRegiVO {
/*	CREATE TABLE group_regi (
			group_regi NUMBER NOT NULL,  그룹신청 번호 
			group_no NUMBER,  그룹 번호 
			mem_no NUMBER  회원 번호 
		);*/
	private int groupRegi, groupNo, memNo;

	public int getGroupRegi() {
		return groupRegi;
	}

	public void setGroupRegi(int groupRegi) {
		this.groupRegi = groupRegi;
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
		return "GroupRegiVO [groupRegi=" + groupRegi + 
				", groupNo=" + groupNo + 
				", memNo=" + memNo + "]";
	}
	
}
