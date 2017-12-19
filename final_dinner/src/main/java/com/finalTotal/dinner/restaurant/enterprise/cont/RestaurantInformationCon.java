package com.finalTotal.dinner.restaurant.enterprise.cont;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/restaurantEnterprise")
public class RestaurantInformationCon {
	
	private static final Logger logger
	= LoggerFactory.getLogger(RestaurantInformationCon.class);
	
	@RequestMapping(value="/restaurantInformation.do", method=RequestMethod.GET)
	public String information() {
		logger.info("식당 정보확인 페이지");
		
		return "restaurantEnterprise/restaurantInformation";
	}

}
