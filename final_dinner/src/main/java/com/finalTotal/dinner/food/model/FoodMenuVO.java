package com.finalTotal.dinner.food.model;

import java.util.Date;

public class FoodMenuVO {
	
	private int foodMenuNo;	//메뉴종류번호
	private int resNo;	//식당번호
	private String foodMenuName;	//이름
	private String foodMenuDesc;	//설명
	private Date foodMenuRegdate;	//등록일
	
	public FoodMenuVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FoodMenuVO(int foodMenuNo, int resNo, String foodMenuName, String foodMenuDesc, Date foodMenuRegdate) {
		super();
		this.foodMenuNo = foodMenuNo;
		this.resNo = resNo;
		this.foodMenuName = foodMenuName;
		this.foodMenuDesc = foodMenuDesc;
		this.foodMenuRegdate = foodMenuRegdate;
	}

	public int getFoodMenuNo() {
		return foodMenuNo;
	}

	public void setFoodMenuNo(int foodMenuNo) {
		this.foodMenuNo = foodMenuNo;
	}

	public int getResNo() {
		return resNo;
	}

	public void setResNo(int resNo) {
		this.resNo = resNo;
	}

	public String getFoodMenuName() {
		return foodMenuName;
	}

	public void setFoodMenuName(String foodMenuName) {
		this.foodMenuName = foodMenuName;
	}

	public String getFoodMenuDesc() {
		return foodMenuDesc;
	}

	public void setFoodMenuDesc(String foodMenuDesc) {
		this.foodMenuDesc = foodMenuDesc;
	}

	public Date getFoodMenuRegdate() {
		return foodMenuRegdate;
	}

	public void setFoodMenuRegdate(Date foodMenuRegdate) {
		this.foodMenuRegdate = foodMenuRegdate;
	}

	@Override
	public String toString() {
		return "FoodMenuVO [foodMenuNo=" + foodMenuNo + ", resNo=" + resNo + ", foodMenuName=" + foodMenuName
				+ ", foodMenuDesc=" + foodMenuDesc + ", foodMenuRegdate=" + foodMenuRegdate + "]";
	}
	
	
	
}
