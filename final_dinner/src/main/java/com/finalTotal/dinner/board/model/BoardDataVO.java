package com.finalTotal.dinner.board.model;

import java.sql.Timestamp;

public class BoardDataVO {
	/*free_data_no NUMBER NOT NULL,  자료 번호 
	free_no NUMBER NOT NULL,  게시판번호 
	free_data_name VARCHAR2(500) NOT NULL,  자료실제이름 
	free_data_original_name VARCHAR2(500) NOT NULL,  자료이름 
	free_data_regdate DATE NOT NULL  등록일 */
	
	private int freeDataNo;
	private int freeNo;
	private String freeDataName;
	private String freeDataOriginalName;
	private Timestamp freeDataRegdate;
	
	public int getFreeDataNo() {
		return freeDataNo;
	}

	public void setFreeDataNo(int freeDataNo) {
		this.freeDataNo = freeDataNo;
	}

	public int getFreeNo() {
		return freeNo;
	}

	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
	}

	public String getFreeDataName() {
		return freeDataName;
	}

	public void setFreeDataName(String freeDataName) {
		this.freeDataName = freeDataName;
	}

	public String getFreeDataOriginalName() {
		return freeDataOriginalName;
	}

	public void setFreeDataOriginalName(String freeDataOriginalName) {
		this.freeDataOriginalName = freeDataOriginalName;
	}

	public Timestamp getFreeDataRegdate() {
		return freeDataRegdate;
	}

	public void setFreeDataRegdate(Timestamp freeDataRegdate) {
		this.freeDataRegdate = freeDataRegdate;
	}

	@Override
	public String toString() {
		return "BoardDataVO [freeDataNo=" + freeDataNo + ", freeNo=" + freeNo + ", freeDataName=" + freeDataName
				+ ", freeDataOriginalName=" + freeDataOriginalName + ", freeDataRegdate=" + freeDataRegdate + "]";
	}
	
}
