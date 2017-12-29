package com.finalTotal.dinner.restaurant.enterprise.cont;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalTotal.dinner.restaurant.general.model.RestaurantService;
import com.finalTotal.dinner.restaurant.general.model.RestaurantVO;

@Controller
@RequestMapping("/restaurantEnterprise")
public class RestaurantInformationCont {
	
	private static final Logger logger
	= LoggerFactory.getLogger(RestaurantInformationCont.class);
	
	@Autowired
	private RestaurantService restaurantService;
	
	
	@RequestMapping(value="/restaurantListView.do", method=RequestMethod.GET)
	public String ListView(HttpSession session,	Model model) {
		logger.info("식당 정보리스트 페이지 파라미터={}");
		
		int memNo =(Integer)session.getAttribute("memNo");
		logger.info("memNo",memNo);
		
		List<RestaurantVO> list = restaurantService.selectAll(memNo);
		logger.info("식당 정보확인 결과, list.size()={}",list.size());
		
		model.addAttribute("list",list);
		
		
		
		
		return "restaurantEnterprise/restaurantListView";
	}
	
	@RequestMapping("/restaurantInformation.do")
	public String Information(@RequestParam String resNo, Model model) {
		logger.info("식당 정보상세 페이지 보여주기 파라미터 resNo={}",resNo);
		
		if(resNo==null || resNo.equals("null") ) {
			model.addAttribute("msg", "식당 등록을 하셔야 합니다");
			model.addAttribute("url", "/member/myPage.do");
			
			return "common/message";			
		}
		
		RestaurantVO vo = restaurantService.selectByNo((Integer.parseInt(resNo)));
		logger.info("상세보기 결과, vo={}",vo);
		
		model.addAttribute("vo", vo);
		
		
		
		return "restaurantEnterprise/restaurantInformation";
	}
	
	
	

}
