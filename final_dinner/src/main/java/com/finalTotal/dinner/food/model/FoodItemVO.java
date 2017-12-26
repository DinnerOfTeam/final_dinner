package com.finalTotal.dinner.food.model;

import java.util.Date;

public class FoodItemVO {
	
	private int foodItemNo;	//메뉴내용번호
	private int foodMenuNo;	//메뉴종류번호
	private String foodItemName; //이름	
	private String foodItemDesc; //설명
	private int foodItemPrice; 	//가격
	private Date foodItemRegdate; //등록일
	
	public FoodItemVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FoodItemVO(int foodItemNo, int foodMenuNo, String foodItemName, String foodItemDesc, int foodItemPrice,
			Date foodItemRegdate) {
		super();
		this.foodItemNo = foodItemNo;
		this.foodMenuNo = foodMenuNo;
		this.foodItemName = foodItemName;
		this.foodItemDesc = foodItemDesc;
		this.foodItemPrice = foodItemPrice;
		this.foodItemRegdate = foodItemRegdate;
	}

	public int getFoodItemNo() {
		return foodItemNo;
	}

	public void setFoodItemNo(int foodItemNo) {
		this.foodItemNo = foodItemNo;
	}

	public int getFoodMenuNo() {
		return foodMenuNo;
	}

	public void setFoodMenuNo(int foodMenuNo) {
		this.foodMenuNo = foodMenuNo;
	}

	public String getFoodItemName() {
		return foodItemName;
	}

	public void setFoodItemName(String foodItemName) {
		this.foodItemName = foodItemName;
	}

	public String getFoodItemDesc() {
		return foodItemDesc;
	}

	public void setFoodItemDesc(String foodItemDesc) {
		this.foodItemDesc = foodItemDesc;
	}

	public int getFoodItemPrice() {
		return foodItemPrice;
	}

	public void setFoodItemPrice(int foodItemPrice) {
		this.foodItemPrice = foodItemPrice;
	}

	public Date getFoodItemRegdate() {
		return foodItemRegdate;
	}

	public void setFoodItemRegdate(Date foodItemRegdate) {
		this.foodItemRegdate = foodItemRegdate;
	}

	@Override
	public String toString() {
		return "FoodItemVO [foodItemNo=" + foodItemNo + ", foodMenuNo=" + foodMenuNo + ", foodItemName=" + foodItemName
				+ ", foodItemDesc=" + foodItemDesc + ", foodItemPrice=" + foodItemPrice + ", foodItemRegdate="
				+ foodItemRegdate + "]";
	}
	
	
}
