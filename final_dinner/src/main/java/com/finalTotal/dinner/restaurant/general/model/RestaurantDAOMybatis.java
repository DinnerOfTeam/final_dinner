package com.finalTotal.dinner.restaurant.general.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class RestaurantDAOMybatis extends SqlSessionDaoSupport implements RestaurantDAO{

    private final static String namespace = "config.mybatis.mapper.oracle.restaurant";
    
    @Override
    public int insertRestuarant(RestaurantVO vo) {
        return getSqlSession().insert(namespace+".insertRestuarant", vo);
    }

	@Override
	public List<RestaurantVO> selectAll(int memNo) {
		return getSqlSession().selectList(namespace+".selectAll",memNo);
	}

	@Override
	public RestaurantVO selectByNo(int resNo) {
		return getSqlSession().selectOne(namespace+".selectByNo", resNo);
	}

	@Override
	public List<RestaurantVO> all() {
		return getSqlSession().selectList(namespace+".all");
	}

	
	
	
}
