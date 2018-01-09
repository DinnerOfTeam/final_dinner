package com.finalTotal.dinner.vote.cont;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.finalTotal.dinner.vote.model.VoteService;
import com.finalTotal.dinner.vote.model.VoteVO;
import com.finalTotal.dinner.vote.model.Vote_ItemVO;
import com.finalTotal.dinner.vote.model.Vote_LogVO;

@Controller
@RequestMapping("/indiGroup/vote")
public class VoteCont {
	private static final Logger logger = LoggerFactory.getLogger(VoteCont.class);
	
	@Autowired
	private VoteService voteService;
	
	@RequestMapping(value="/voteReg.do", method=RequestMethod.GET)
	String write_get() {
		logger.info("투표등록 화면 보여주기");
		
		return "indiGroup/vote/voteReg";
	}
	
	@RequestMapping(value="/voteReg.do", method=RequestMethod.POST)
	String write_post(HttpServletRequest request, Model model, @ModelAttribute VoteVO voteVO, 
			HttpSession session, @RequestParam String[] itemArr ) {
		logger.info("투표등록 처리-파라미터 voteVo={}", voteVO);
		
		int memNo=0;
		if(session.getAttribute("memNo")!=null)
		{
			memNo = (Integer)session.getAttribute("memNo");
			voteVO.setMemNo(memNo);
			if(voteVO.getVoteMultiSel()== null|| voteVO.getVoteMultiSel().isEmpty()) {
				voteVO.setVoteMultiSel("N");
			}
		}
		
		List<Vote_ItemVO> list = new ArrayList<Vote_ItemVO>();
		
		for(int i=0; i<itemArr.length; i++) {
			Vote_ItemVO itemVo= new Vote_ItemVO();
			String itemname = itemArr[i];
			itemVo.setItemTitle(itemname);
		
			list.add(itemVo);
		}
		
		int cnt = voteService.insertVote(voteVO, list);
		logger.info("투표등록 결과, cnt={}", cnt);
		
		String msg="", url="";
		if(cnt>0) {
			msg="투표등록완료";
			url="/indiGroup/vote/list.do?groupNo="+voteVO.getGroupNo();
		}else {
			msg="투표등록실패";
			url="/voteReg.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/list.do")
	public String list(@ModelAttribute VoteVO voteVo, Model model,
			@RequestParam(defaultValue="0")int groupNo) {
		//출력하기
		logger.info("vote전체 조회하기");
		
		List<VoteVO> list =null;
		list = voteService.selectByGroup(groupNo);
		logger.info("투표 목록조회 결과, list.size()="+list.size());
		
		model.addAttribute("list", list);
		
		return "indiGroup/vote/list";
	}
	@RequestMapping("/detail.do")
	public String detail(@RequestParam(defaultValue="0")int groupNo,
			@RequestParam(defaultValue="0")int voteNo,
			HttpSession session,
		ModelMap model) {
		logger.info("투표하기 파라미터 groupNo={}", groupNo);
		
		if(groupNo<0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/indiGroup/vote/list.do");
			return "common/message";
		}
		
		VoteVO vo = voteService.selectByNo(voteNo);
		List<Vote_ItemVO> list =voteService.selectByVno(voteNo);
		List<Integer> mem_list= voteService.whoVoted(voteNo);
		int memNo= (Integer)session.getAttribute("memNo");
		boolean res= false;
		for(Integer i: mem_list) {
			if(i== memNo) {
				res= true;
			}
		}
		List<Vote_ItemVO> voted_list= voteService.resultVote(voteNo);
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("voted_list", voted_list);
		model.addAttribute("isVoted", res);
		return "/indiGroup/vote/detail";
		
	}
	@RequestMapping("/vote.do")
	public String vote_log(HttpServletRequest request, HttpSession session, @ModelAttribute Vote_LogVO Logvo,
			Model model, @RequestParam int itemNo[], @RequestParam int groupNo ) {
		int memNo=0;
		if(session.getAttribute("memNo")!=null)
		{
			memNo = (Integer)session.getAttribute("memNo");
			Logvo.setMemNo(memNo);
			logger.info("memNo={}", memNo);
		}
		
		List<Vote_LogVO> list = new ArrayList<Vote_LogVO>();
		
		for(int i=0; i<itemNo.length; i++) {
			Vote_LogVO logvo =  new Vote_LogVO();
			logvo.setVoteItemNo(itemNo[i]);
			logvo.setMemNo(memNo);
			
			int voteNo=Logvo.getVoteNo();
			logvo.setVoteNo(voteNo);
			
			list.add(logvo);
		}
		int cnt = voteService.insertLog(list);
		logger.info("투표결과, cnt={}", cnt);
		boolean back=true;
		String msg="", url="";
		if(cnt>0) {
			msg="투표완료";
			url="/indiGroup/vote/list.do?groupNo="+ groupNo;
			back=false;
		}else {
			msg="투표실패";
			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url",url);
		model.addAttribute("back", back);
		return "common/message";
	}
}
