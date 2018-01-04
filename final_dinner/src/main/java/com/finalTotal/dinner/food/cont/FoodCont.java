package com.finalTotal.dinner.food.cont;

import java.util.ArrayList;
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
import com.finalTotal.dinner.food.model.FoodItemVO2;
import com.finalTotal.dinner.food.model.FoodMenuService;
import com.finalTotal.dinner.food.model.FoodMenuVO;
import com.finalTotal.dinner.restaurant.general.model.RestaurantService;


@Controller
@RequestMapping("/restaurantEnterprise")
public class FoodCont {
	
	private static final Logger logger
	= LoggerFactory.getLogger(FoodCont.class);
	
	@Autowired
	private FoodMenuService foodMenuService;
	
	@Autowired
	private RestaurantService restaruntService;
	
	
	@RequestMapping(value="/foodWrite.do", method=RequestMethod.GET)
	public String foodWirte_get(HttpSession session , Model model) {
		logger.info("메뉴등록 페이지");

		String memId=(String)session.getAttribute("memId");
		
		//식당번호 가져오기
		List<Integer> resNoList=restaruntService.selectNoByMemId(memId);
		int resNo=0;
		if(resNoList!=null && !resNoList.isEmpty()) {
			resNo=resNoList.get(0);
		}
		
		List<FoodMenuVO> menuList=foodMenuService.selectMenuListByResNo(resNo);
		
		model.addAttribute("menuList", menuList);
		
		return "restaurantEnterprise/foodWrite";
	}
	
	
	
	@RequestMapping(value="/foodWrite.do", method=RequestMethod.POST )
	public String foodWirte(HttpSession session , @ModelAttribute FoodItemVO2 vo2, Model model) {
		logger.info("메뉴 등록 페이지 파라미터 vo={}",vo2);
		
		String[] foodMenuNoarr = vo2.getFoodMenuNo().split(",");
		String[] foodItemNamearr = vo2.getFoodItemName().split(",");
		String[] foodItemDescarr = vo2.getFoodItemDesc().split(",");
		String[] foodItemPricearr = vo2.getFoodItemPrice().split(",");
	
		int cnt = 0;
		for (int i = 0; i < foodMenuNoarr.length; i++) {
			FoodItemVO vo = new FoodItemVO();
			vo.setFoodMenuNo(Integer.parseInt(foodMenuNoarr[i]));
			vo.setFoodItemName(foodItemNamearr[i]);	
			if(i<foodItemDescarr.length) {
				vo.setFoodItemDesc(foodItemDescarr[i]);
			}else {
				vo.setFoodItemDesc("");
			}
			
			
			int resNo = (Integer)session.getAttribute("resNo");
			
			
			vo.setFoodItemPrice(Integer.parseInt(foodItemPricearr[i]));
			
			cnt += foodMenuService.insertFoodMenu(vo);
			logger.info("메뉴 등록 결과, cnt={}",cnt);
		}
		
		String msg = "", url="";
		
		if(cnt==foodMenuNoarr.length) {
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
	
	@RequestMapping(value="/writeMenu.do", method=RequestMethod.GET)
	public String writeMenu_get() {
		logger.info("메뉴종류 등록 페이지");
		
		return "restaurantEnterprise/writeMenu";
	}
	
	@RequestMapping(value="/writeMenu.do", method=RequestMethod.POST )
	public String writeMenu_post(@RequestParam String[] foodMenuName, @RequestParam String[] foodMenuDesc,
			HttpSession session , Model model) {
		logger.info("메뉴 등록 페이지 파라미터 foodMenuName={}, foodMenuDesc={}", foodMenuName, foodMenuDesc);
		
		String memId=(String)session.getAttribute("memId");
		
		//식당번호 가져오기
		List<Integer> resNoList=restaruntService.selectNoByMemId(memId);
		int resNo=0;
		if(resNoList!=null && !resNoList.isEmpty()) {
			resNo=resNoList.get(0);
		}
		
		List<FoodMenuVO> menuList=new ArrayList<FoodMenuVO>();
		
		String msg="";
		String url="";
		boolean back=false;
		
		for(int i=0; i<foodMenuName.length; i++) {
			String name=foodMenuName[i];
			String desc=foodMenuDesc[i];
			
			if(name==null || name.isEmpty()) {
				msg="종류명을 입력하세요";
				url="";
				back=true;
				break;
			}
			
			FoodMenuVO fVO=new FoodMenuVO();
			fVO.setFoodMenuName(name);
			fVO.setFoodMenuDesc(desc);
			fVO.setResNo(resNo);
			
			menuList.add(fVO);
		}
		
		if(!back) {
			int cnt=foodMenuService.insertMenuList(menuList);
			logger.info("메뉴 입력결과 cnt={}", cnt);
			
			if(cnt>0) {
				msg="입력완료";
				url="/restaurantEnterprise/writeMenu.do";
			}else {
				msg="입력실패";
				url="";
				back=true;
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("back", back);
		
		return "common/message";
		
	}
	
}
