package com.finalTotal.dinner.admin.model;

public class AddrVO {
/*	CREATE TABLE DOTUSER.ADDR_SIDO
	(
	  SIDO_NO    NUMBER                             NOT NULL,
	  SIDO_NAME  VARCHAR2(150 BYTE)                 NOT NULL
	)
	CREATE TABLE DOTUSER.ADDR_SIGUNGU
	(
	  SIGUNGU_NO    NUMBER                          NOT NULL,
	  SIDO_NO       NUMBER                          NOT NULL,
	  SIGUNGU_NAME  VARCHAR2(150 BYTE)              NOT NULL,
	  ADDR_WI       NUMBER(13,10)                   DEFAULT 37.566995344,
	  ADDR_KY       NUMBER(13,10)                   DEFAULT 126.978391871
	)*/
	private int sidoNo, sigunguNo;
	private String sidoName, sigunguName;
	private double addrWi, addrKy;
	public int getSidoNo() {
		return sidoNo;
	}
	public void setSidoNo(int sidoNo) {
		this.sidoNo = sidoNo;
	}
	public int getSigunguNo() {
		return sigunguNo;
	}
	public void setSigunguNo(int sigunguNo) {
		this.sigunguNo = sigunguNo;
	}
	public String getSidoName() {
		return sidoName;
	}
	public void setSidoName(String sidoName) {
		this.sidoName = sidoName;
	}
	public String getSigunguName() {
		return sigunguName;
	}
	public void setSigunguName(String sigunguName) {
		this.sigunguName = sigunguName;
	}
	public double getAddrWi() {
		return addrWi;
	}
	public void setAddrWi(double addrWi) {
		this.addrWi = addrWi;
	}
	public double getAddrKy() {
		return addrKy;
	}
	public void setAddrKy(double addrKy) {
		this.addrKy = addrKy;
	}
	@Override
	public String toString() {
		return "AddrVO [sidoNo=" + sidoNo + ", sigunguNo=" + sigunguNo + ", sidoName=" + sidoName + ", sigunguName="
				+ sigunguName + ", addrWi=" + addrWi + ", addrKy=" + addrKy + "]";
	}
}
