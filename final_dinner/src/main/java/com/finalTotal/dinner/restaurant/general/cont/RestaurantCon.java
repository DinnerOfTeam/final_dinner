package com.finalTotal.dinner.restaurant.general.cont;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalTotal.dinner.member.cont.LoginCont;
import com.finalTotal.dinner.restaurant.general.model.RestaurantService;
import com.finalTotal.dinner.restaurant.general.model.RestaurantVO;

@Controller
@RequestMapping("/restaurant")
public class RestaurantCon {
	
	private static final Logger logger = LoggerFactory.getLogger(RestaurantCon.class);

	@Autowired
	private RestaurantService restaurantService;
	
	@RequestMapping(value="/restaurantJoin.do", method=RequestMethod.GET)
	public String restaurantJoin_get() {
		logger.info("식당등록 페이지");
		
		return "restaurantGeneral/restaurantJoin";
	}
	
	
	@RequestMapping(value="/restaurantJoin.do", method=RequestMethod.POST)
	public String restaurantJoin_post(@ModelAttribute RestaurantVO vo, Model model) {
	    logger.info("식당 등록 페이지 파라미터 vo={}",vo);
	    int cnt = restaurantService.insertRestuarant(vo);
	    String msg = "";
	    String url = "";
	    
	    if(cnt > 0) {
	        msg = "식당등록이되었습니다.";
	        url = "/member/myPage.do";
	    }else{
	        msg = "식당등록실패";
	    }
	    model.addAttribute("msg", msg);
	    model.addAttribute("url", url);
	    
	    return "common/message";
	}
	
}