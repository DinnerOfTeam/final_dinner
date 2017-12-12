package com.finalTotal.dinner.indiGroup.cont;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalTotal.dinner.board_review.model.Board_reviewVO;
import com.finalTotal.dinner.chat.model.ChattingVO;
import com.finalTotal.dinner.vote.model.VoteVO;

@Controller
@RequestMapping("/indiGroup")
public class IndiGroupCont {
	private Logger logger= LoggerFactory.getLogger(IndiGroupCont.class);
	private int[] date_arr= new int[28];
	private String[] work_arr= new String[28];

	@RequestMapping(value= "/main.do", method= RequestMethod.GET)
	public void main(@RequestParam(required=false, defaultValue= "0") int year,
			@RequestParam(required=false, defaultValue= "0") int month,
			@RequestParam(required=false, defaultValue= "0") int p_date, Model model) {
		logger.info("indiGroup main page");
		Date d= null;
		if((year* month* p_date)== 0) {
			d= new Date();
		}else {
			d= new Date(year, month, p_date);
		}
		int startDay= d.getDate()- 7- d.getDay();
		for(int i= 0; i< date_arr.length; i++) {
			int date= startDay+ i;
			if(date< 1) {
				int beforeLastDay= getLastDay(d.getYear()+ 1900, d.getMonth()- 1);
				date_arr[i]= date+ beforeLastDay;
			}else {
				date_arr[i]= date;
			}
		}
		work_arr[04]= "점심약속";
		work_arr[15]= "점심약속";
		work_arr[19]= "저녁약속";
		work_arr[26]= "점심약속";
		
		model.addAttribute("date_arr", date_arr);
		model.addAttribute("work_arr", work_arr);
		model.addAttribute("today", d);
	}
	
	@RequestMapping(value= "/calender.do", method= RequestMethod.GET)
	public void calender() {
		logger.info("indiGroup calender page");
	}
	
	@RequestMapping(value= "/chat.do")
	public String chat(Model model) {
		logger.info("indiGroup chat page");
		
		List<ChattingVO> chat_list= new ArrayList<ChattingVO>();
		ChattingVO vo= new ChattingVO();
		vo.setMemNo(3);
		vo.setChatContents("하이");
		chat_list.add(vo);
		vo= new ChattingVO();
		vo.setMemNo(4);
		vo.setChatContents("하이2");
		chat_list.add(vo);
		vo= new ChattingVO();
		vo.setMemNo(5);
		vo.setChatContents("하이3");
		chat_list.add(vo);
		vo= new ChattingVO();
		vo.setMemNo(4);
		vo.setChatContents("뭐뇽");
		chat_list.add(vo);
		
		List<String> user_list= new ArrayList<String>();
		user_list.add("손성현");
		user_list.add("최정규");
		user_list.add("김은영");
		user_list.add("장요한");
		
		model.addAttribute("chat_list", chat_list);
		model.addAttribute("user_list", user_list);
		
		return "indiGroup/chat";
	}
	
	@RequestMapping(value= "/vote.do")
	public String vote(Model model) {
		logger.info("indiGroup vote page");
		
		List<VoteVO> vote_list= new ArrayList<VoteVO>();
		VoteVO vo= new VoteVO();
		vo.setVoteEndDate(new Date(117, 11, 15));
		vo.setVoteTitle("오늘 점심은?");
		vote_list.add(vo);
		
		model.addAttribute("vote_list", vote_list);
		
		return "indiGroup/vote";
	}
	
	@RequestMapping(value= "/board_review.do")
	public String group_review(Model model) {
		logger.info("indiGroup group_review page");
		
		List<Board_reviewVO> review_list= new ArrayList<Board_reviewVO>();
		Board_reviewVO vo= new Board_reviewVO();
		vo.setReviewMealDate(new Date(117, 10, 23));
		vo.setReviewTitle("여기 식당 깔끔하네요");
		vo.setReviewRegdate(new Date(117, 10, 25));
		vo.setResNo(30);
		
		review_list.add(vo);
		model.addAttribute("review_list", review_list);
		
		return "indiGroup/board_review";
	}
	
	public int getLastDay(int year, int month) {
		switch(month) {
			case -1: return 31;
			case 0: return 31;
			case 1: return yearcalc(year)?29:28;
			case 2: return 31;
			case 3: return 30;
			case 4: return 31;
			case 5: return 30;
			case 6: return 31;
			case 7: return 31;
			case 8: return 30;
			case 9: return 31;
			case 10: return 30;
			default: return 30;
		}
	}
	public static boolean yearcalc(int year){
		if(year%4==0 && (!(year%100==0) && !(year%400==0))){
			return true;
		}
		return false;
	}
}
