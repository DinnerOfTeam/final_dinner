package com.finalTotal.dinner.restaurant.general.model;

import java.util.List;

import com.finalTotal.dinner.restaurant.search.model.RestaruntSearchVO;

public interface RestaurantDAO {
    public int insertRestuarant(RestaurantVO vo);
    public List<RestaurantVO> selectAll(int memNo);
    public RestaurantVO selectByNo(int resNo);
    public List<RestaurantVO> searchRestarunt(RestaruntSearchVO searchVO);
    public int countRestarunt(RestaruntSearchVO searchVO);
    public List<Integer> selectNoByMemId(String memId);
    
}