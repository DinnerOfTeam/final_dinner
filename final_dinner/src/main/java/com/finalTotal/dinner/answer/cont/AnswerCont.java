package com.finalTotal.dinner.answer.cont;

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

import com.finalTotal.dinner.answer.model.AnswerService;
import com.finalTotal.dinner.answer.model.AnswerVO;
import com.finalTotal.dinner.question.model.QuestionService;
import com.finalTotal.dinner.question.model.QuestionVO;

@Controller
@RequestMapping("/answer")
public class AnswerCont {
	private static final Logger logger
	=LoggerFactory.getLogger(AnswerCont.class);
	
	@Autowired
	private AnswerService answerService;
	
	//답변달기
/*	@RequestMapping(value="/reply.do", method=RequestMethod.GET)
	String reply_get() {
		logger.info("답변달기 화면 보여주기");
		
		return "answer/reply";
	}*/
	
	@RequestMapping("/reply.do")
	String reply_post(@ModelAttribute AnswerVO answerVo,
			@RequestParam(required= false, defaultValue= "0") int idx,
			Model model) {
		logger.info("답변달기 처리 - 파라미터 answerVo={}", answerVo);
		
		int cnt = answerService.insertAnswer(answerVo);
		logger.info("답변달기 결과, cnt={}", cnt);
		
		String msg="", url="/admin/main.do?idx="+ idx;
		
		if(cnt>0) {
			msg="답변등록 처리완료";
//			url="/customer/detail.do";
		}else {
			msg="답변등록 실패";
//			url="/reply.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		
		return "common/message";
	}
	
}
