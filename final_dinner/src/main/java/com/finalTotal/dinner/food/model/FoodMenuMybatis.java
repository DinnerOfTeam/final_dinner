package com.finalTotal.dinner.food.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class FoodMenuMybatis extends SqlSessionDaoSupport implements FoodMenuDAO{

	private final static String namespace = "config.mybatis.mapper.oracle.Food";
	
	@Override
	public int insertFoodMenu(FoodItemVO vo) {
		return getSqlSession().insert(namespace+".insertFoodMenu", vo);
	}
	
	@Override
	public List<FoodItemVO> selectAll(int foodItemNo) {
		return getSqlSession().selectList(namespace+".selectAll", foodItemNo);
	}

	@Override
	public int deleteMenu(int foodItemNo) {
		return getSqlSession().delete(namespace+".deleteMenu" , foodItemNo);
	}


}
