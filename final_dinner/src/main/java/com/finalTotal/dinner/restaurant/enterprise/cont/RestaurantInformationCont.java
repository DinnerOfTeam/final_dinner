package com.finalTotal.dinner.restaurant.enterprise.cont;

import java.util.List;

import javax.servlet.http.Cookie;
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

import com.finalTotal.dinner.member.model.MemberService;
import com.finalTotal.dinner.restaurant.general.model.RestaurantService;
import com.finalTotal.dinner.restaurant.general.model.RestaurantVO;

@Controller
@RequestMapping("/restaurantEnterprise")
public class RestaurantInformationCont {
	
	private static final Logger logger
	= LoggerFactory.getLogger(RestaurantInformationCont.class);
	
	@Autowired
	private RestaurantService restaurantService;
	
	@Autowired
	private MemberService memberService;
	
	
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
	
	@RequestMapping(value="/restaurantOut.do", method=RequestMethod.GET)
	public void restaurantOut_get(HttpSession session) {
		
		int resNo = (Integer) session.getAttribute("resNo");
		logger.info("식당 탈퇴 페이지 보여주기, 파라미터 resNo={}", resNo);
	}
	
	@RequestMapping(value="/restaurantOut.do", method=RequestMethod.POST)
	public String restaurantOut_post(@RequestParam String memPwd,
				HttpSession session, HttpServletResponse response,
				Model model) {
		
		String resNo = (String)session.getAttribute("resNo");
		String memId = (String)session.getAttribute("memId");
		
		logger.info("식당 탈퇴 처리,  파라미터 resNo={}, memPwd={}",resNo, memPwd);
		
		//로그인 체크
		String msg = "", url="/restaurantEnterprise/restaurantOut.do";
		int result = memberService.loginCheck(memId, memPwd);
		
		if(result==memberService.LOGIN_OK) {
			int cnt = restaurantService.restaurantOut(resNo);
			logger.info("식당 탙퇴 결과, cnt={}",cnt);
			if(cnt>0) {
				msg="식당 탈퇴처리되었습니다";
				url="member/myPage.do";
			
				//cookie삭제
				Cookie ck = new Cookie("ck_ressNo", resNo);
				ck.setPath("/");
				ck.setMaxAge(0);
				response.addCookie(ck);
			}else {
				msg="식당탈퇴 실패";
			}
		}else if(result==MemberService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다";
		}else {
			msg="비밀번호 체크 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	

}
