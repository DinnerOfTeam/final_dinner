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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalTotal.dinner.answer.model.AnswerService;
import com.finalTotal.dinner.answer.model.AnswerVO;
import com.finalTotal.dinner.common.SearchVO;
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
	
	@Autowired
	private AnswerService answerService;

	//글쓰기
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	String write_get() {
		logger.info("글쓰기 화면 보여주기");
		
		return "customer/write";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	String write_post(HttpServletRequest request, @ModelAttribute
			QuestionVO questionVo, Model model,HttpSession session){
		logger.info("글쓰기 처리-파라미터 questionVo={}", questionVo);
		
		/*String memId = (String)session.getAttribute("memId");
		MemberVO vo = memberService.selectMember(memId);
		int memNo = vo.getMemNo();
		int memNo = session.getAttribute("memNo");
		questionVo = vo.getMemNo(memNo);*/
		//session가져오기
		
		int memNo=0;
		if(session.getAttribute("memNo")!=null)
		{
			memNo = (Integer)session.getAttribute("memNo");
			questionVo.setMemNo(memNo);
		}
		
		int cnt = questionService.insertqna(questionVo);
		logger.info("글쓰기 결과, cnt={}", cnt);

		
		String msg="", url="";
		
		if(cnt>0) {
			msg="글쓰기 처리완료";
			url="list.do";
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
	public String list(@ModelAttribute QuestionVO questionVo,Model model) {
		//1. 출력하기
		logger.info("전체조회하기");
		//2.

		List<QuestionVO> list = null;
		list = questionService.selectQnaAll();
		logger.info("목록 조회 결과,list.size()="+list.size());
		
		model.addAttribute("list", list);
		
		return "customer/list";
	}
	
	//리스트 출력하기
	@RequestMapping("/list2.do")
	public String list2(@ModelAttribute SearchVO searchVo, Model model) {
		//1. 출력하기
		logger.info("전체조회하기 parameter : searchVo={}", searchVo);
		//2.
		
		List<QuestionVO> list= questionService.searchAll(searchVo);
		logger.info("목록 조회 결과,list.size()="+list.size());
		
		model.addAttribute("list", list);
		
		return "customer/list2";
	}
	
	//공지사항 10개 띄우기
	@RequestMapping("/mainNotice.do")
	public String mainNotice(ModelMap model) {
		logger.info("자주묻는 질문 조회");
		
		List<QuestionVO> list = questionService.mainNotice();
		logger.info("메인 질문  조회 결과, list.size()={}", list.size());
	
		model.addAttribute("list", list);
		
		return "customer/mainNotice";
	}
	
	@RequestMapping("/countUpdate.do")
	public String countUpdate(@RequestParam(defaultValue="0") int no,
			Model model) {
		logger.info("조회수 증가, 파라미터 no={}", no);
		
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/customer/list.do");
			return "common/message";
		}
		
		int cnt = questionService.updateReadCount(no);
		logger.info("조회수 증가 결과, cnt={}", cnt);
		
		return "redirect:/customer/detail.do?no="+no;
	}
	@RequestMapping("/detail.do")
	public String detail(@RequestParam(defaultValue="0") int no, 
			ModelMap model) {
		logger.info("상세보기 파라미터 no={}", no);
		
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/customer/list.do");
			return "common/message";
		}
		
		QuestionVO vo =questionService.selectByNo(no);
		logger.info("Question 상세보기 결과, vo={}", vo);
		AnswerVO av = answerService.selectByNo(no);
		logger.info("Answer 상세보기 결과, av={}", av);
		
		/*String content=vo.getQuestionContent();
		String content2 = av.getAnswerContent();
		if(content!=null && !content.isEmpty()&&content2!=null&&!content2.isEmpty()) {
			content=content.replace("\r\n", "<br>");
			vo.setQuestionContent(content);
			
			content2=content2.replace("\r\n", "<br>");
			av.setAnswerContent(content2);
		}*/
		String content=null;
		String content2=null;
		if(vo!=null) {
			content=vo.getQuestionContent();
			content=content.replace("\r\n", "<br>");
			vo.setQuestionContent(content);
		}
		if(av!=null) {
			content2=av.getAnswerContent();
			content2=content2.replace("\r\n", "<br>");
			av.setAnswerContent(content2);
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("av", av);
		
		return "customer/detail";
	}
	
	@RequestMapping("/listByCategory.do")
	public String listByCg(@RequestParam(defaultValue="0")int qnaTypeNo,
		Model model) {
		logger.info("카테고리별 게시글 조회, 파라미터 qnaTypeNo={} ", qnaTypeNo);
		
		if(qnaTypeNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/list.do");
			return "common/message";
		}
		
		List<QuestionVO>list
		= questionService.selectByType(qnaTypeNo);
		logger.info("카테고리별 조회 결과, list.size()={}", list.size());
		
		model.addAttribute("list", list);
		
		return "customer/listByCategory";
	}
	
	@RequestMapping(value="/edit.do",method=RequestMethod.GET)
	public String edit_get(@RequestParam(defaultValue="0")int no,
				ModelMap model) {
		logger.info("수정화면 조회 파라미터 no={}", no);
		
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/customer/list.do");
			return "common/message";
		}
		
		QuestionVO vo = questionService.selectByNo(no);
		logger.info("수정화면 조회 결과, vo={}", vo);
		
		model.addAttribute("vo", vo);
		
		return "customer/edit";
	}
	
	@RequestMapping(value="/edit.do",method=RequestMethod.POST)
	public String edit_post(@ModelAttribute QuestionVO questionVo,
			Model model) {
		logger.info("글 수정 처리 - 파라미터, vo={}", questionVo);
		
		String msg="";
		String url="/customer/edit.do?no="+questionVo.getQnaQuestionNo();
		boolean back=true;
		boolean close=false;
		int cnt = questionService.updateQna(questionVo);
		logger.info("글수정 결과, cnt={}", cnt);
		
		if(cnt>0) {
			msg="글수정되었습니다.";
			url="/customer/detail.do?no="+questionVo.getQnaQuestionNo();
			back=false;
			close=true;
		}else {
			msg="글수정 실패";
			close=false;
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url", url);
		model.addAttribute("back", back);
		model.addAttribute("close",close);
		return "common/msgPopup";
	}
	
	
}
