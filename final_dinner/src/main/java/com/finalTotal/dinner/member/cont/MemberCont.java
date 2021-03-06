package com.finalTotal.dinner.member.cont;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
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

import com.finalTotal.dinner.member.model.MemberService;
import com.finalTotal.dinner.member.model.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberCont {
	private static final Logger logger
		=LoggerFactory.getLogger(MemberCont.class);
	
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping("/signup.do")
	public String singup() {
		logger.info("회원가입 페이지 보여주기");
		return "signup";
	}
	
	@RequestMapping("/checkId.do")
	public String checkId(@RequestParam String memId, Model model) {
		logger.info("아이디 중복확인 처리, 파라미터 memId={}", memId);
		
		int result=0;
		if(memId!=null && !memId.isEmpty()) {
			result=memberService.duplicatedmemId(memId);
			logger.info("아이디 중복확인 결과, result={}", result);
		}
		
		model.addAttribute("result",result);
		model.addAttribute("EXIST_ID", MemberService.EXIST_ID);
		model.addAttribute("NONE_EXIST_ID", MemberService.NONE_EXIST_ID);
		
		return "member/checkId";	
	}
	
	@RequestMapping("/memWrite.do")
	public String memWrite(@ModelAttribute MemberVO memberVo,
				@RequestParam String memEmail3, Model model) {
		
		logger.info("회원가입 처리, 파라미터 vo={}", memberVo);
		
		String memTel2=memberVo.getMemTel2();
		String memTel3=memberVo.getMemTel3();
		if(memTel2==null || memTel2.isEmpty() || memTel3==null || memTel3.isEmpty()) {
			memberVo.setMemTel1("");
			memberVo.setMemTel2("");
			memberVo.setMemTel3("");
		}
		
		String memEmail1=memberVo.getMemEmail1();
		if(memEmail1==null || memEmail1.isEmpty()) {
			memberVo.setMemEmail1("");
			memberVo.setMemEmail2("");			
		}else {
			if(memberVo.getMemEmail2().equals("etc")) {
				if(memEmail3!=null && !memEmail3.isEmpty()) {
					memberVo.setMemEmail2(memEmail3);
				}else {
					memberVo.setMemEmail1("");
					memberVo.setMemEmail2("");
				}
			}
		}
		
		String msg="", url="";
		int cnt = memberService.insertMember(memberVo);
		if(cnt>0) {
			msg="회원가입되었습니다";
			url="/index.do";
		}else {
			msg="회원가입실패";
			url="/sign.do";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";		
	}
	
	@RequestMapping("/zipcode.do")
	public void zipcode() {
		logger.info("우편번호 검색페이지 보여주기");
		
	}
	
	@RequestMapping(value="/memberEdit.do", method=RequestMethod.GET)
	public String memEdit_get(HttpSession session, Model model) {
		String memId=(String) session.getAttribute("memId");
		logger.info("회원정보 수정 화면, 파라미터 memId={}", memId);
		
		MemberVO vo = memberService.selectMember(memId);
		logger.info("회원정보 수정페이지 조회 결과, vo={}", vo);
		
		model.addAttribute("vo", vo);
		
		return "member/memberEdit";
	}
	
	@RequestMapping(value="/memberEdit.do", method=RequestMethod.POST)
	public String memEdit_post(@ModelAttribute MemberVO memberVo,
			@RequestParam(required=false)String memEmail3,
			HttpSession session, Model model) {
		String memId=(String) session.getAttribute("memId");
		memberVo.setMemId(memId);
		
		logger.info("회원수정 처리, 파라미터 vo={}",memberVo);
		
		//로그인 체크
		
		String memTel2=memberVo.getMemTel2();
		String memTel3=memberVo.getMemTel3();
		if(memTel2==null || memTel2.isEmpty() || memTel3==null || memTel3.isEmpty()) {
			memberVo.setMemTel1("");
			memberVo.setMemTel2("");
			memberVo.setMemTel3("");
		}
		
		String memEmail1 = memberVo.getMemEmail1();
		if(memEmail1==null || memEmail1.isEmpty()) {
			memberVo.setMemEmail1("");
			memberVo.setMemEmail2("");
		}else {
			if(memberVo.getMemEmail2().equals("etc")) {
				if(memEmail3!=null && !memEmail3.isEmpty()) {
					memberVo.setMemEmail2(memEmail3);
				}else {
					memberVo.setMemEmail1("");
					memberVo.setMemEmail2("");
				}
			}
		}
		
		
		String msg="", url="/index.do";
		int result=memberService.loginCheck(memberVo.getMemId(), memberVo.getMemPwd());
		if(result==MemberService.LOGIN_OK) {
			int cnt = memberService.updateMember(memberVo);
			if(cnt>0) {
				msg="회원정보 수정되었습니다";
			}else {
				msg="회원정보 수정 실패";
			}
		}else if(result==MemberService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다";
		}else {
			msg="비밀번호 체크 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/memberOut.do", method=RequestMethod.GET)
	public void memberOut_get(HttpSession session) {
		String memId = (String)session.getAttribute("memId");
		logger.info("회원탈퇴 페이지 보여주기, 파라미터 memId={}", memId);
	}
	
	@RequestMapping(value="/memberOut.do", method=RequestMethod.POST)
	public String memberOut_post(@RequestParam String memPwd,
				HttpSession session, HttpServletResponse response,
				Model model) {
		
		String memId = (String)session.getAttribute("memId");
		
		logger.info("회원탈퇴 처리, 파라미터 memId={}, memPwd={}", memId, memPwd);
		
		//로그인 체크
		String msg = "", url="/member/memberOut.do";
		int result = memberService.loginCheck(memId, memPwd);
		
		if(result==memberService.LOGIN_OK) {
			int cnt = memberService.memberOut(memId);
			logger.info("회원 탈퇴 결과, cnt={}",cnt);
			if(cnt>0) {
				msg="회원탈퇴처리되었습니다";
				url="/index.do";
				
				//session정보 제거
				session.invalidate();
				
				//cookie 삭제
				Cookie ck  = new Cookie("ck_memId", memId);
				ck.setPath("/");
				ck.setMaxAge(0);
				response.addCookie(ck);				
			}else {
				msg="회원탈퇴 실패";
			}
		}else if(result==MemberService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
		}else {
			msg="비밀번호 체크 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	
	
	
}















