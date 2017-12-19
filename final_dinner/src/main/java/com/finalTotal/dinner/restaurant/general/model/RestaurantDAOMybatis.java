package com.finalTotal.dinner.restaurant.general.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class RestaurantDAOMybatis extends SqlSessionDaoSupport implements RestaurantDAO{

    private final static String namespace = "config.mybatis.mapper.oracle.restaurant";
    
    @Override
    public int insertRestuarant(RestaurantVO vo) {
        return getSqlSession().insert(namespace+".insertRestuarant", vo);
    }
 
	
	
}
