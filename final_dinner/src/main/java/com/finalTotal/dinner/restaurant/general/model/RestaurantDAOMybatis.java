package com.finalTotal.dinner.restaurant.general.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.finalTotal.dinner.restaurant.search.model.RestaruntSearchVO;

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
	
	@Override
	public String selectRes(int memNo) {
		return getSqlSession().selectOne(namespace+".selectRes",memNo);
	}

	@Override
	public List<RestaurantVO> searchRestarunt(RestaruntSearchVO searchVO) {
		return getSqlSession().selectList(namespace+".searchRestarunt", searchVO);
	}

	@Override
	public int countRestarunt(RestaruntSearchVO searchVO) {
		return getSqlSession().selectOne(namespace+".countRestarunt", searchVO);
	}

	@Override
	public List<Integer> selectNoByMemId(String memId) {
		return getSqlSession().selectList(namespace+".selectNoByMemId", memId);
	}
	

	@Override
	public int restaurantOut(String resNo) {
		return getSqlSession().delete(namespace+".restaurantOut",resNo);
	}

	@Override
	public int insertRestaurantPhoto(RestaurantPhotoVO photoVO) {
		return getSqlSession().insert(namespace+".insertRestaurantPhoto", photoVO);
	}

	@Override
	public List<RestaurantPhotoVO> selectPhotoByresNo(int resNo) {
		return getSqlSession().selectList(namespace+".selectPhotoByresNo", resNo);
	}

	@Override
	public int deletePhotoByNo(int resNo) {
		return getSqlSession().delete(namespace+".insertRestaurantPhoto", resNo);
	}

	
	
	
}
