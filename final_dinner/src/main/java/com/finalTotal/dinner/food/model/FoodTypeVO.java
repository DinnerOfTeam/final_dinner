package com.finalTotal.dinner.food.model;

public class FoodTypeVO {
	
	private int foodTypeNo; //음식종류번호
	private String foodTypeCode; //코드
	private String foodTypeName; //이름
	private String foodTypeDesc; //설명
	
	public FoodTypeVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FoodTypeVO(int foodTypeNo, String foodTypeCode, String foodTypeName, String foodTypeDesc) {
		super();
		this.foodTypeNo = foodTypeNo;
		this.foodTypeCode = foodTypeCode;
		this.foodTypeName = foodTypeName;
		this.foodTypeDesc = foodTypeDesc;
	}

	public int getFoodTypeNo() {
		return foodTypeNo;
	}

	public void setFoodTypeNo(int foodTypeNo) {
		this.foodTypeNo = foodTypeNo;
	}

	public String getFoodTypeCode() {
		return foodTypeCode;
	}

	public void setFoodTypeCode(String foodTypeCode) {
		this.foodTypeCode = foodTypeCode;
	}

	public String getFoodTypeName() {
		return foodTypeName;
	}

	public void setFoodTypeName(String foodTypeName) {
		this.foodTypeName = foodTypeName;
	}

	public String getFoodTypeDesc() {
		return foodTypeDesc;
	}

	public void setFoodTypeDesc(String foodTypeDesc) {
		this.foodTypeDesc = foodTypeDesc;
	}

	@Override
	public String toString() {
		return "FoodTypeVO [foodTypeNo=" + foodTypeNo + ", foodTypeCode=" + foodTypeCode + ", foodTypeName="
				+ foodTypeName + ", foodTypeDesc=" + foodTypeDesc + "]";
	}
	
	
}
