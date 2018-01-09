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
import com.finalTotal.dinner.common.PagingVO;
import com.finalTotal.dinner.common.SearchVO;
import com.finalTotal.dinner.member.model.MemberService;
import com.finalTotal.dinner.member.model.MemberServiceImpl;
import com.finalTotal.dinner.member.model.MemberVO;
import com.finalTotal.dinner.question.model.QuestionService;
import com.finalTotal.dinner.question.model.QuestionTypeVO;
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
	String write_get(Model model) {
		logger.info("글쓰기 화면 보여주기");
		
		List<QuestionTypeVO> list = questionService.selectTypeAll();
		logger.info("질문타입 개수 list={}", list.size());
		model.addAttribute("type",list);
		
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
	@RequestMapping("/list2.do")
	public String list(@ModelAttribute QuestionVO questionVo,Model model) {
		//1. 출력하기
		logger.info("전체조회하기");
		//2.

		List<QuestionVO> list = null;
		list = questionService.selectQnaAll();
		logger.info("목록 조회 결과,list.size()="+list.size());
		
		model.addAttribute("list", list);
		
		return "customer/list2";
	}
	
	//리스트 출력하기
	@RequestMapping("/list.do")
	public String list2(@ModelAttribute SearchVO searchVo, Model model) {
		//1. 출력하기
		logger.info("전체조회하기 parameter : searchVo={}", searchVo);
		//2.
		
		int totalRecord= questionService.getTotal(searchVo);
		PagingVO pageVo= new PagingVO();
		pageVo.setCurrentPage(searchVo.getCurrentPage());
		pageVo.setTotalRecord(totalRecord);
		pageVo.setBlockSize(10);
		pageVo.setPageSize(10);
		
		searchVo.setPageSize(pageVo.getPageSize());
		searchVo.setTotalPage(pageVo.getTotalPage());
		searchVo.setFirstRowNum(pageVo.getFirstRowNum());
		searchVo.setFirstBlockPage(pageVo.getFirstBlockPage());
		searchVo.setLastBlockPage(pageVo.getLastBlockPage());
		List<QuestionVO> list= questionService.searchAll(searchVo);
		logger.info("목록 조회 결과,list.size()="+list.size());
				
		model.addAttribute("list", list);
		model.addAttribute("page", pageVo);
		
		return "customer/list";
	}
	
	//공지사항 10개 띄우기
	@RequestMapping("/mainNotice.do")
	public String mainNotice(ModelMap model) {
		logger.info("자주묻는 질문 조회");
		
		List<QuestionVO> list = questionService.mainNotice();
		logger.info("메인 질문 조회 결과, list.size()={}", list.size());
	
		model.addAttribute("list", list);
		
		return "customer/mainNotice";
	}
	
	@RequestMapping("/countUpdate.do")
	public String countUpdate(@RequestParam(defaultValue="0") int no,
			HttpSession session,
			Model model) {
		logger.info("조회수 증가, 파라미터 no={}", no);
		
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/customer/list.do");
			return "common/message";
		}else {
			QuestionVO vo= questionService.selectByNo(no);
			if(vo.getQuestionOpen().equals("2")) {
				int memNo = (Integer)session.getAttribute("memNo");
				if(vo.getMemNo()!= memNo) {
					MemberVO admin = (MemberVO)session.getAttribute("admin_login");
					if(admin== null) {
						model.addAttribute("msg", "비밀글은 본인만 확인가능합니다.");
						model.addAttribute("url", "/customer/list.do");
						return "common/message";
					}else if(admin.getMemNo()!= memNo) {
						model.addAttribute("msg", "비밀글은 본인만 확인가능합니다.");
						model.addAttribute("url", "/customer/list.do");
						return "common/message";
					}
				}
			}
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
		List<AnswerVO> av_list = answerService.selectByQuestionNo(no);
		logger.info("Answer 상세보기 결과, av_list.size()={}", av_list.size());
		
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
		if(av_list!=null) {
			for(AnswerVO av: av_list) {
				content2=av.getAnswerContent();
				content2=content2.replace("\r\n", "<br>");
				av.setAnswerContent(content2);
			}
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("av_list", av_list);
		
		return "customer/detail";
	}
	
	@RequestMapping("/listByCategory.do")
	public String listByCg(@ModelAttribute SearchVO searchVo,
		Model model) {
		logger.info("카테고리별 게시글 조회, 파라미터 searchVo={} ", searchVo);
		
		if(searchVo.getQnaTypeNo()==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/list.do");
			return "common/message";
		}
		int totalRecord= questionService.getTotalType(searchVo);
		PagingVO pageVo= new PagingVO();
		pageVo.setCurrentPage(searchVo.getCurrentPage());
		pageVo.setTotalRecord(totalRecord);
		pageVo.setBlockSize(10);
		pageVo.setPageSize(10);
		
		searchVo.setPageSize(pageVo.getPageSize());
		searchVo.setTotalPage(pageVo.getTotalPage());
		searchVo.setFirstRowNum(pageVo.getFirstRowNum());
		searchVo.setFirstBlockPage(pageVo.getFirstBlockPage());
		searchVo.setLastBlockPage(pageVo.getLastBlockPage());
		List<QuestionVO>list
		= questionService.selectByType(searchVo);
		logger.info("카테고리별 조회 결과, list.size()={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("pageVO", pageVo);
		
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
	
	@RequestMapping(value="/tab_menu.do")
	public String list_tab(Model model)
	{
		List<QuestionTypeVO> list = questionService.selectTypeAll();
		logger.info("질문타입 개수 list={}", list.size());
		model.addAttribute("type",list);
		
		return "customer/tab_menu";
	}
	
}
