package com.finalTotal.dinner.addr.model;

public class SidoVO {
	private int sidoNo;
	private String sidoName;
	private String sidoSearch;
	
	public int getSidoNo() {
		return sidoNo;
	}
	public void setSidoNo(int sidoNo) {
		this.sidoNo = sidoNo;
	}
	public String getSidoName() {
		return sidoName;
	}
	public void setSidoName(String sidoName) {
		this.sidoName = sidoName;
	}
	public String getSidoSearch() {
		return sidoSearch;
	}
	public void setSidoSearch(String sidoSearch) {
		this.sidoSearch = sidoSearch;
	}
	
	@Override
	public String toString() {
		return "SidoVO [sidoNo=" + sidoNo + ", sidoName=" + sidoName + ", sidoSearch=" + sidoSearch + "]";
	}
	
}
