package com.finalTotal.dinner.admin.cont;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalTotal.dinner.member.model.MemberService;
import com.finalTotal.dinner.member.model.MemberVO;

@Controller
@RequestMapping("/admin/login")
public class AdminLoginCont {
	public static final Logger log= LoggerFactory.getLogger(AdminLoginCont.class);
	
	@Autowired
	private MemberService ser;
	
	@RequestMapping(value="/login.do", method= RequestMethod.GET)
	public void login() {
		log.info("관리자 로그인 페이지");
	}
	
	@RequestMapping(value="/login.do", method= RequestMethod.POST)
	public String loginSubmit(@ModelAttribute MemberVO vo,
			HttpServletRequest req, Model model) {
		log.info("관리자 로그인 parameter : vo= {}", vo);
		

		String msg="", url="/admin/login/login.do";
		int result = ser.adminCheck(vo.getMemId(), vo.getMemPwd());
		if(result==MemberService.LOGIN_OK) {
			//로그인 성공
			vo = ser.selectMember(vo.getMemId());
			log.info("로그인 결과 : vo={}", vo);
			
			//[1]  성공한 경우에만 세션에 저장
			HttpSession session = req.getSession();
			session.setAttribute("admin_login", vo);
			
			
			msg=vo.getMemName()+"님 로그인되었습니다";
			url="/admin/main.do";					
		}else if(result==MemberService.ID_NONE) {
			msg="아이디를 확인해주세요.";
		}else if(result==MemberService.PWD_DISAGREE) {
			msg="비밀번호를 확인해주세요.";
		}else if(result==MemberService.NO_ADMIN) {
			msg="관리자가 아닙니다.";
		}else {
			msg="로그인 체크 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session, Model model) {
		session.removeAttribute("admin_login");
		model.addAttribute("msg", "로그아웃 되었습니다.");
		model.addAttribute("url", "/admin/login/login.do");
		
		return "common/message";
	}
}
