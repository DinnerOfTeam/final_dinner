package com.finalTotal.dinner.food.model;

import java.util.List;

public interface FoodMenuService {
	
	public int insertFoodMenu(FoodItemVO vo);
	public List<FoodItemVO> selectAll(int foodItemNo);
	public int deleteMenu(int foodItemNo);
	public int selectAll2(int memNo);
	
	public int insertMenu(FoodMenuVO vo);
	public int insertMenuList(List<FoodMenuVO> list);
	public List<FoodMenuVO> selectMenuListByResNo(int resNo);
	public List<MenuVO> selectMenuByResNo(int resNo);
	
	public List<FoodItemVO> selectItemByMenuNo(int menuNo);
	
	public int insertMenuVOList(List<MenuVO> list);
	
	public int deleteMenuParent(int foodMenuNo);
	public int deleteFoodMenuByResNo(int resNo);
	public int deleteItemByResNo(int resNo);
	
	public int deleteAllMenuByResNo(int resNo);
	
}
