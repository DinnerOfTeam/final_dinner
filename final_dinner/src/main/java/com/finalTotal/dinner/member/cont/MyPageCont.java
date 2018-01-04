package com.finalTotal.dinner.member.cont;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalTotal.dinner.food.model.FoodMenuService;
import com.finalTotal.dinner.member.model.MemberService;
import com.finalTotal.dinner.member.model.MemberVO;

@Controller
@RequestMapping("/member")
public class MyPageCont {
	private static final Logger logger = LoggerFactory.getLogger(LoginCont.class);
	
	@Autowired
	private MemberService memberService;
	
	
	@Autowired
	private FoodMenuService foodMenuService;
	
	@RequestMapping(value="/myPage.do", method=RequestMethod.GET)
	public String myPage(HttpSession session, Model model) {
		String memId = (String)session.getAttribute("memId");
		
		logger.info("마이페이지, 파라미터 memId={}",memId);
		
		MemberVO vo = memberService.selectMember(memId);
		logger.info("마이페이지 정보 띄우기, vo={}",vo);
		
		int resNo = foodMenuService.selectAll2(vo.getMemNo());
		
	
		session.setAttribute("resNo", resNo);
		logger.info("resNo={}",resNo);
		
		model.addAttribute("vo",vo);			
		return "member/myPage";
		
	}
}
