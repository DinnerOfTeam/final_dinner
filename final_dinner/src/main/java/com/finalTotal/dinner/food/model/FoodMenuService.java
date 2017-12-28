package com.finalTotal.dinner.food.model;

import java.util.List;

public interface FoodMenuService {
	
	public int insertFoodMenu(FoodItemVO vo);
	public List<FoodItemVO> selectAll(int foodItemNo);
	public int deleteMenu(int foodItemNo);
}
