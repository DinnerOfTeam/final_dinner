package com.finalTotal.dinner.food.cont;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalTotal.dinner.food.model.FoodItemVO;
import com.finalTotal.dinner.food.model.FoodMenuService;


@Controller
@RequestMapping("/restaurantEnterprise")
public class FoodCont {
	
	private static final Logger logger
	= LoggerFactory.getLogger(FoodCont.class);
	
	@Autowired
	private FoodMenuService foodMenuService;
	
	
	@RequestMapping(value="/foodWrite.do", method=RequestMethod.GET)
	public String foodWirte_get() {
		logger.info("메뉴등록 페이지");
		
		return "restaurantEnterprise/foodWrite";
	}
	
	
	
	@RequestMapping(value="/foodWrite.do", method=RequestMethod.POST )
	public String foodWirte(HttpSession session , @ModelAttribute FoodItemVO vo, Model model) {
		logger.info("메뉴 등록 페이지");
		
	
		int cnt = foodMenuService.insertFoodMenu(vo);
		logger.info("메뉴 등록 결과, cnt={}",cnt);
		
		String msg = "", url="";
		
		if(cnt>0) {
			msg="메뉴 등록되었습니다";
			url="/member/myPage.do";
		}else {
			msg= "메뉴 등록 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	
	@RequestMapping(value="/menuDelete.do", method=RequestMethod.GET)
	public String deleteMenu_get(HttpSession session, Model model) {
		logger.info("삭제 페이지");
		
		int memNo = (Integer)session.getAttribute("memNo");
		
		List<FoodItemVO> list = foodMenuService.selectAll(memNo);
		logger.info("삭제할 메뉴 목록, list.size()={}, list+{}", list.size(),list);
		
		model.addAttribute("list", list);
		
		return "restaurantEnterprise/menuDelete";
	}
	
	
	@RequestMapping(value="/menuDelete.do", method=RequestMethod.POST)
	public String deleteMenu_post(@ModelAttribute FoodItemVO vo, Model model) {
		logger.info("삭제처리 파라미터 vo={}", vo);
		
		String msg = "", url="/restaurantEnterprise/menuDelete.do?foodItemNo="+vo.getFoodItemNo();
		
		
		int cnt = foodMenuService.deleteMenu(vo.getFoodItemNo());
		
		if(cnt>0) {
			msg="삭제되었습니다";
			url="/member/myPage.do";
		}else {
			msg="삭제 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	
	
}
