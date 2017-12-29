package com.finalTotal.dinner.vote.cont;

import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.finalTotal.dinner.vote.model.VoteService;
import com.finalTotal.dinner.vote.model.VoteVO;
import com.finalTotal.dinner.vote.model.Vote_ItemVO;

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
			url="list.do";
		}else {
			msg="투표등록실패";
			url="/voteReg.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
