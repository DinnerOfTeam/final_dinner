package com.finalTotal.dinner.food.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FoodMenuServiceImpl implements FoodMenuService{

	
	@Autowired
	private FoodMenuDAO foodMenuDao;
	
	@Override
	public int insertFoodMenu(FoodItemVO vo) {
		return foodMenuDao.insertFoodMenu(vo);
	}

	@Override
	public int deleteMenu(int foodItemNo) {
		return foodMenuDao.deleteMenu(foodItemNo);
	}

	@Override
	public List<FoodItemVO> selectAll(int foodItemNo) {
		return foodMenuDao.selectAll(foodItemNo);
	}

	@Override
	public int selectAll2(int memNo) {
		return foodMenuDao.selectAll2(memNo);
	}

}
