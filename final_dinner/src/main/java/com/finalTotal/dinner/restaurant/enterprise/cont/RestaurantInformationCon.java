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
public class RestaurantInformationCon {
	
	private static final Logger logger
	= LoggerFactory.getLogger(RestaurantInformationCon.class);
	
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
	public String Information(@RequestParam int resNo, Model model) {
		logger.info("식당 정보상세 페이지 보여주기 파라미터 resNo={}",resNo);
		
		if(resNo==0) {
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/restaurantEnterprise/restaurantInformation.do");
			
			return "common/message";			
		}
		
		RestaurantVO vo = restaurantService.selectByNo(resNo);
		logger.info("상세보기 결과, vo={}",vo);
		
		model.addAttribute("vo", vo);
		
		
		
		return "restaurantEnterprise/restaurantInformation";
	}
	
	
	@RequestMapping("/restaurantBookList.do")
	public String BookList(HttpSession session, Model model) {
		logger.info("식당 예약 조회페이지 ");
	
		
		return "restaurantEnterprise/restaurantBookList";
	}
	

}
