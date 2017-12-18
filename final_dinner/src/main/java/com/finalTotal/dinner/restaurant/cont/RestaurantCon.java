package com.finalTotal.dinner.restaurant.cont;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalTotal.dinner.member.cont.LoginCont;
import com.finalTotal.dinner.restaurant.model.RestaurantVO;

@Controller
@RequestMapping("/restaurant")
public class RestaurantCon {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginCont.class);
	
	
	@RequestMapping("/restaurantJoin.do")
	public void restaurantJoin(@ModelAttribute RestaurantVO restaurantVo, Model model) {
		logger.info("식당등록페이지");
		
		
	
		

	}
	
}
