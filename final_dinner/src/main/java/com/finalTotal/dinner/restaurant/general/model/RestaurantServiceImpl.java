package com.finalTotal.dinner.restaurant.general.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RestaurantServiceImpl implements RestaurantService {

    @Autowired
    private RestaurantDAO restaurantDao;
    
    @Override
    public int insertRestuarant(RestaurantVO vo) {
        return restaurantDao.insertRestuarant(vo);
        
    }

	@Override
	public List<RestaurantVO> selectAll(int memNo) {
		return restaurantDao.selectAll(memNo);
	}


}