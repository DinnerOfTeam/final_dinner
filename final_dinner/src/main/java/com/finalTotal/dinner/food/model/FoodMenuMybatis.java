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

	@Override
	public int selectAll2(int memNo) {
		int cnt=0;
		 Integer c= getSqlSession().selectOne(namespace+".selectAll2", memNo);
		 if(c!=null) {
			 cnt=c;
		 }
		return cnt;
	}

	@Override
	public int insertMenu(FoodMenuVO vo) {
		return getSqlSession().insert(namespace+".insertMenu", vo);
	}

	@Override
	public List<FoodMenuVO> selectMenuListByResNo(int resNo) {
		return getSqlSession().selectList(namespace+".selectMenuListByResNo", resNo);
	}

	@Override
	public List<MenuVO> selectMenuByResNo(int resNo) {
		return getSqlSession().selectList(namespace+".selectMenuByResNo", resNo);
	}

	@Override
	public List<FoodItemVO> selectItemByMenuNo(int menuNo) {
		return getSqlSession().selectList(namespace+".selectByMenuNo", menuNo);
	}

	@Override
	public int deleteMenuParent(int foodMenuNo) {
		return getSqlSession().delete(namespace+".deleteMenuParent" , foodMenuNo);
	}

	@Override
	public int deleteFoodMenuByResNo(int resNo) {
		return getSqlSession().delete(namespace+".deleteFoodMenuByResNo" , resNo);
	}

	@Override
	public int deleteItemByResNo(int resNo) {
		return getSqlSession().delete(namespace+".deleteItemByResNo" , resNo);
	}


}
