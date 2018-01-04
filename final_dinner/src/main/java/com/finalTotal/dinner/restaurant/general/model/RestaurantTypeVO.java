package com.finalTotal.dinner.restaurant.general.model;

public class RestaurantTypeVO {
	
	private int resTypeNo; //식당종류 번호
	private String resTypeCode; //코드
	private String resTypeName; //이름
	private String resTypeDesc; //설명
	
	public RestaurantTypeVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RestaurantTypeVO(int resTypeNo, String resTypeCode, String resTypeName, String resTypeDesc) {
		super();
		this.resTypeNo = resTypeNo;
		this.resTypeCode = resTypeCode;
		this.resTypeName = resTypeName;
		this.resTypeDesc = resTypeDesc;
	}

	public int getResTypeNo() {
		return resTypeNo;
	}

	public void setResTypeNo(int resTypeNo) {
		this.resTypeNo = resTypeNo;
	}

	public String getResTypeCode() {
		return resTypeCode;
	}

	public void setResTypeCode(String resTypeCode) {
		this.resTypeCode = resTypeCode;
	}

	public String getResTypeName() {
		return resTypeName;
	}

	public void setResTypeName(String resTypeName) {
		this.resTypeName = resTypeName;
	}

	public String getResTypeDesc() {
		return resTypeDesc;
	}

	public void setResTypeDesc(String resTypeDesc) {
		this.resTypeDesc = resTypeDesc;
	}

	@Override
	public String toString() {
		return "RestaurantTypeVO [resTypeNo=" + resTypeNo + ", resTypeCode=" + resTypeCode + ", resTypeName="
				+ resTypeName + ", resTypeDesc=" + resTypeDesc + "]";
	}
	
	
}
