package com.finalTotal.dinner.food.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	public int insertMenu(FoodMenuVO vo) {
		return foodMenuDao.insertMenu(vo);
	}
	
	@Override
	@Transactional
	public int insertMenuList(List<FoodMenuVO> list) {
		int cnt=0;
		
		for(FoodMenuVO vo : list) {
			cnt=foodMenuDao.insertMenu(vo);
		}
		
		return cnt;
	}

	@Override
	public List<FoodMenuVO> selectMenuListByResNo(int resNo) {
		return foodMenuDao.selectMenuListByResNo(resNo);
	}

	@Override
	public List<MenuVO> selectMenuByResNo(int resNo) {
		return foodMenuDao.selectMenuByResNo(resNo);
	}

	@Override
	public List<FoodItemVO> selectItemByMenuNo(int menuNo) {
		return foodMenuDao.selectItemByMenuNo(menuNo);
	}

}
