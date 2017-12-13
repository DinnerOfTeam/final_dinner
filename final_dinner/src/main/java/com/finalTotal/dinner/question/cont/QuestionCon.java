package com.finalTotal.dinner.question.cont;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalTotal.dinner.member.model.MemberService;
import com.finalTotal.dinner.member.model.MemberServiceImpl;
import com.finalTotal.dinner.member.model.MemberVO;
import com.finalTotal.dinner.question.model.QuestionService;
import com.finalTotal.dinner.question.model.QuestionVO;

@Controller
@RequestMapping("/customer")
public class QuestionCon {
	private static final Logger logger
	=LoggerFactory.getLogger(QuestionCon.class);
	
	@Autowired
	private QuestionService questionService;
	
	
	//글쓰기
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	String write_get() {
		logger.info("글쓰기 화면 보여주기");
		
		return "customer/write";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	String write_post(HttpServletRequest request, @ModelAttribute
			QuestionVO questionVo, Model model,HttpSession session){
		logger.info("글쓰기 처리-파라미터");
		
		int cnt = questionService.insertqna(questionVo);
		logger.info("글쓰기 결과, cnt={}", cnt);
		
		String memId = (String)session.getAttribute("memId");
		
		MemberService service = new MemberServiceImpl();
		MemberVO vo = service.selectMember(memId);
		int num = vo.getMemNo();
		/*
		 1) session id를 가지고 온다
		 2) 가지고 온 session으로 mem_no를 찾는다
		 3) insert한다.
		 */
		
		String msg="", url="";
		
		if(cnt>0) {
			msg="글쓰기 처리완료";
			url="/list.do";
		}else {
			msg="글쓰기 실패";
			url="/write.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	//리스트 출력하기
	@RequestMapping("/list.do")
	public String list(Model model) {
		//1. 출력하기
		logger.info("전체조회하기");
		//2.
		List<QuestionVO> list = null;
		list = questionService.selectQnaAll();
		logger.info("목록 조회 결과,list.size()="+list.size());
		
		model.addAttribute("list", list);
		
		return "customer/list";
	}
}
