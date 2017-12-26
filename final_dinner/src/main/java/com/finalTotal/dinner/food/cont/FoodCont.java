package com.finalTotal.dinner.food.cont;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalTotal.dinner.restaurant.enterprise.cont.RestaurantInformationCon;

@Controller
@RequestMapping("/restaurantEnterprise")
public class FoodCont {
	
	private static final Logger logger
	= LoggerFactory.getLogger(FoodCont.class);
	
	
	@RequestMapping("/foodWrite.do")
	public void foodWirte() {
		logger.info("식당 등록 페이지");
	}
	
}
