package com.finalTotal.dinner.food.model;

import java.util.List;

public class MenuVO {
	private FoodMenuVO foodMenuVO;
	private List<FoodItemVO> foodItemList;
	
	public FoodMenuVO getFoodMenuVO() {
		return foodMenuVO;
	}
	public void setFoodMenuVO(FoodMenuVO foodMenuVO) {
		this.foodMenuVO = foodMenuVO;
	}
	public List<FoodItemVO> getFoodItemList() {
		return foodItemList;
	}
	public void setFoodItemList(List<FoodItemVO> foodItemList) {
		this.foodItemList = foodItemList;
	}
	
	@Override
	public String toString() {
		return "MenuVO [foodMenuVO=" + foodMenuVO + ", foodItemList=" + foodItemList + "]";
	}
	
}
