package com.finalTotal.dinner.restaurant.cont;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalTotal.dinner.member.cont.LoginCont;

@Controller
@RequestMapping("/restaurant")
public class RestaurantCon {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginCont.class);
	
	
	@RequestMapping("/restaurant.do")
	public String restaurantJoin() {
		logger.info("식당등록페이지");
		
		return "/restaurant/restaurantJoin";
	}
	
}
