package com.finalTotal.dinner.addr.model;

public class SigunguVO {
	private int sigunguNo;
	private int sidoNo;
	private String sigunguName;
	
	public int getSigunguNo() {
		return sigunguNo;
	}
	public void setSigunguNo(int sigunguNo) {
		this.sigunguNo = sigunguNo;
	}
	public int getSidoNo() {
		return sidoNo;
	}
	public void setSidoNo(int sidoNo) {
		this.sidoNo = sidoNo;
	}
	public String getSigunguName() {
		return sigunguName;
	}
	public void setSigunguName(String sigunguName) {
		this.sigunguName = sigunguName;
	}
	
	@Override
	public String toString() {
		return "SigunguVO [sigunguNo=" + sigunguNo + ", sidoNo=" + sidoNo + ", sigunguName=" + sigunguName + "]";
	}
	
}
