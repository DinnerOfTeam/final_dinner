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
	
	@Override
	@Transactional
	public int insertMenuVOList(List<MenuVO> list) {
		int cnt=0;
		
		for(MenuVO mVO : list) {
			FoodMenuVO fVO=mVO.getFoodMenuVO();
			cnt=foodMenuDao.insertMenu(fVO);
			
			List<FoodItemVO> iList=mVO.getFoodItemList();
			if(iList!=null) {
				for(FoodItemVO iVO : iList) {
					iVO.setFoodMenuNo(fVO.getFoodMenuNo());
					
					cnt=foodMenuDao.insertFoodMenu(iVO);
				}
			}
		}
		
		return cnt;
	}

	@Override
	public int deleteMenuParent(int foodMenuNo) {
		return foodMenuDao.deleteMenuParent(foodMenuNo);
	}

	@Override
	public int deleteFoodMenuByResNo(int resNo) {
		return foodMenuDao.deleteFoodMenuByResNo(resNo);
	}

	@Override
	public int deleteItemByResNo(int resNo) {
		return foodMenuDao.deleteItemByResNo(resNo);
	}
	

	@Override
	@Transactional
	public int deleteAllMenuByResNo(int resNo) {
		int cnt=0;
		
		cnt=foodMenuDao.deleteItemByResNo(resNo);
		cnt=foodMenuDao.deleteFoodMenuByResNo(resNo);
		
		return cnt;
	}
	
	@Override
	@Transactional
	public int restoreMenu(List<MenuVO> list, int resNo) {
		int cnt=0;
		
		//deleteAllMenuByResNo
		
		if(resNo>0) {
			cnt=foodMenuDao.deleteItemByResNo(resNo);
			cnt=foodMenuDao.deleteFoodMenuByResNo(resNo);
		}
		
		//insertMenuVOList
		
		for(MenuVO mVO : list) {
			FoodMenuVO fVO=mVO.getFoodMenuVO();
			cnt=foodMenuDao.insertMenu(fVO);
			
			List<FoodItemVO> iList=mVO.getFoodItemList();
			if(iList!=null) {
				for(FoodItemVO iVO : iList) {
					iVO.setFoodMenuNo(fVO.getFoodMenuNo());
					
					cnt=foodMenuDao.insertFoodMenu(iVO);
				}
			}
		}
		
		return cnt;
	}

	@Override
	public int deleteItemByMenuNo(int menuNo) {
		return foodMenuDao.deleteItemByMenuNo(menuNo);
	}

	@Override
	@Transactional
	public int deleteAllMenuByMenuNo(int menuNo) {
		int cnt=0;
		
		cnt=foodMenuDao.deleteItemByMenuNo(menuNo);
		cnt=foodMenuDao.deleteMenuParent(menuNo);
		
		return cnt;
	}

}
