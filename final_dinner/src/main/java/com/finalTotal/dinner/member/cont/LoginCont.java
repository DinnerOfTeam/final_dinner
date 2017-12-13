package com.finalTotal.dinner.member.cont;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalTotal.dinner.member.model.MemberService;
import com.finalTotal.dinner.member.model.MemberVO;

@Controller
@RequestMapping("/login")
public class LoginCont {
	private static final Logger logger = LoggerFactory.getLogger(LoginCont.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public void login_get() {
		logger.info("로그인 화면 보여주기");
		
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login_post(@ModelAttribute MemberVO vo,
			@RequestParam(required=false)String chkSaveId,
			HttpServletRequest request, HttpServletResponse response,
			ModelMap model) {
		logger.info("로그인 처리, 파라미터vo={}, saveId={}",vo, chkSaveId);
		
		String msg="", url="/login/login.do";
		int result = memberService.loginCheck(vo.getMemId(), vo.getMemPwd());
		if(result==memberService.LOGIN_OK) {
			//로그인 성공
			MemberVO memVo = memberService.selectMember(vo.getMemId());
			logger.info("로그인 결과 : vo={}", memVo);
			
			//[1]  성공한 경우에만 세션에 저장
			HttpSession session = request.getSession();
			session.setAttribute("memId", memVo.getMemId());
			session.setAttribute("memName", memVo.getMemName());
			session.setAttribute("memNo", memVo.getMemNo());
			
			//[2]쿠키에 저장
			Cookie ck = new Cookie("ck_memId", vo.getMemId());
			ck.setPath("/");
			if(chkSaveId!=null) {
				ck.setMaxAge(1000*24*60*60);
				response.addCookie(ck);
			}else {
				ck.setMaxAge(0);//쿠키삭제
				response.addCookie(ck);
			}
			
			msg=memVo.getMemName()+"님 로그인되었습니다";
			url="/index.do";					
		}else if(result==memberService.ID_NONE) {
			msg="해당 아이디가 존재하지 않습니다.";
		}else if(result==memberService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
		}else {
			msg="로그인 체크 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}	
	
	@RequestMapping("/signup.do")
	public String regi_form() {
		logger.info("regi form page");
		
		return "signup";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session, Model model) {
		logger.info("로그아웃 처리");
		
		session.invalidate();//세션의 모든 속성을 삭제
		
		String  msg="로그아웃되었습니다", url="/index.do";
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);	
		
		return "common/message";
	}

}
