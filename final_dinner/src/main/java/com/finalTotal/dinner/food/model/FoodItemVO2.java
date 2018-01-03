package com.finalTotal.dinner.food.model;

import java.util.Date;

public class FoodItemVO2 {
	
	private int foodItemNo;	//메뉴내용번호
	private String foodMenuNo;	//메뉴종류번호
	private String foodItemName; //이름	
	private String foodItemDesc; //설명
	private String foodItemPrice; 	//가격
	private Date foodItemRegdate; //등록일
	
	public FoodItemVO2() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FoodItemVO2(int foodItemNo, String foodMenuNo, String foodItemName, String foodItemDesc,
			String foodItemPrice, Date foodItemRegdate) {
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

	public String getFoodMenuNo() {
		return foodMenuNo;
	}

	public void setFoodMenuNo(String foodMenuNo) {
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

	public String getFoodItemPrice() {
		return foodItemPrice;
	}

	public void setFoodItemPrice(String foodItemPrice) {
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
		return "FoodItemVO2 [foodItemNo=" + foodItemNo + ", foodMenuNo=" + foodMenuNo + ", foodItemName=" + foodItemName
				+ ", foodItemDesc=" + foodItemDesc + ", foodItemPrice=" + foodItemPrice + ", foodItemRegdate="
				+ foodItemRegdate + "]";
	}
	
	
	
}
