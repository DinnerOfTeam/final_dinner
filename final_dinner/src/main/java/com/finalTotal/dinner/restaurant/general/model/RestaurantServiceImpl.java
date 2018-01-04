package com.finalTotal.dinner.restaurant.general.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalTotal.dinner.restaurant.search.model.RestaruntSearchVO;

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

	@Override
	public RestaurantVO selectByNo(int resNo) {
		return restaurantDao.selectByNo(resNo);
	}

	@Override
	public List<RestaurantVO> all() {
		return restaurantDao.all();
	}
	
	@Override
	public String selectRes(int memNo) {
		return restaurantDao.selectRes(memNo);
	}
	
	@Override
	public List<RestaurantVO> searchRestarunt(RestaruntSearchVO searchVO) {
		return restaurantDao.searchRestarunt(searchVO);
	}

	@Override
	public int countRestarunt(RestaruntSearchVO searchVO) {
		return restaurantDao.countRestarunt(searchVO);
	}

	@Override
	public List<Integer> selectNoByMemId(String memId) {
		return restaurantDao.selectNoByMemId(memId);
	}
	
	@Override
	public int restaurantOut(String resNo) {
		return restaurantDao.restaurantOut(resNo);
				
	}

	@Override
	@Transactional
	public int insertPhotoList(List<RestaurantPhotoVO> photoList) {
		int cnt=0;
		
		for(RestaurantPhotoVO vo : photoList) {
			cnt= restaurantDao.insertRestaurantPhoto(vo);
		}
		
		return cnt;
	}

	@Override
	public List<RestaurantPhotoVO> selectPhotoByresNo(int resNo) {
		return restaurantDao.selectPhotoByresNo(resNo);
	}

	@Override
	public int deletePhotoByNo(int resNo) {
		return restaurantDao.deletePhotoByNo(resNo);
	}

	@Override
	public int deletePhotoByArray(int[] resArr) {
		int cnt=0;
		
		for(int resNo : resArr) {
			cnt=restaurantDao.deletePhotoByNo(resNo);
		}
		
		return cnt;
	}
	
	public List<RestaurantTypeVO> restaurantType() {
		return restaurantDao.restaurantType();
	}


}