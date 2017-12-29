package com.finalTotal.dinner.restaurant.general.model;

import java.util.List;

public interface RestaurantDAO {
    public int insertRestuarant(RestaurantVO vo);
    public List<RestaurantVO> selectAll(int memNo);
    public RestaurantVO selectByNo(int resNo);
    public List<RestaurantVO> all();
    
}