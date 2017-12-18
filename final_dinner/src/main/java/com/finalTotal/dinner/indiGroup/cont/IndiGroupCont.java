package com.finalTotal.dinner.indiGroup.cont;
 
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.finalTotal.dinner.board_review.model.Board_reviewVO;
import com.finalTotal.dinner.chat.model.ChattingService;
import com.finalTotal.dinner.chat.model.ChattingUserVO;
import com.finalTotal.dinner.chat.model.ChattingVO;
import com.finalTotal.dinner.indiGroup.model.GroupMemberVO;
import com.finalTotal.dinner.indiGroup.model.GroupRegiVO;
import com.finalTotal.dinner.indiGroup.model.IndiGroupService;
import com.finalTotal.dinner.indiGroup.model.IndigroupVO;
import com.finalTotal.dinner.vote.model.VoteVO;
 
@Controller
@RequestMapping("/indiGroup")
public class IndiGroupCont {
	public static final Logger logger= LoggerFactory.getLogger(IndiGroupCont.class);
	private int[] date_arr= new int[28];
	private String[] work_arr= new String[28];
	
	@Autowired
	private ChattingService chat_service;
	@Autowired
	private IndiGroupService group_service;
	
	@RequestMapping(value= "/groupMain.do")
	public String groupMain(HttpSession session, Model model) {
		logger.info("groupMain page");
		if(session.getAttribute("memNo")== null) {
			session.setAttribute("msg", "로그인이 필요합니다");
			session.setAttribute("url", "/login/login.do");
			return "common/message";
		}
		int memNo= (Integer)session.getAttribute("memNo");
		List<IndigroupVO> list= group_service.selectMyGroup(memNo);
		
		model.addAttribute("list", list);
		
		return "indiGroup/groupMain";
	}
	
 
	@RequestMapping(value= "/main.do")
	public String main(@RequestParam(required=false, defaultValue= "0") int year,
			@RequestParam(required=false, defaultValue= "0") int month,
			@RequestParam(required=false, defaultValue= "0") int p_date,
			@RequestParam(defaultValue= "0") int groupNo,
			HttpSession session, Model model) {
		logger.info("indiGroup main page parameter : groupNo={}", groupNo);
		if(groupNo== 0) {
			model.addAttribute("msg", "그룹을 선택하셔야합니다.");
			model.addAttribute("url", "/indiGroup/groupMain.do");
			
			return "common/message";
		}
		int memNo= (Integer)session.getAttribute("memNo");
		List<IndigroupVO> list= group_service.selectMyGroup(memNo);
		
		model.addAttribute("list", list);
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
			}else if(date> getLastDay(d.getYear()+ 1900, d.getMonth())) {
				date_arr[i]= date- getLastDay(d.getYear()+ 1900, d.getMonth());
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
		
		return "indiGroup/main";
	}
	
	@RequestMapping(value= "/calender.do")
	public void calender() {
		logger.info("indiGroup calender page");
	}
	
	@RequestMapping(value= "/chat.do")
	public String chat(@RequestParam(defaultValue= "0") int groupNo, 
			HttpSession session ,Model model) {
		logger.info("indiGroup chat page");
		if(groupNo== 0) {
			model.addAttribute("msg", "그룹을 선택하셔야합니다.");
			model.addAttribute("url", "/indiGroup/groupMain.do");
			
			return "common/message";
		}
		int memNo= (Integer)session.getAttribute("memNo");
		Map<String, Integer> map= new HashMap<String, Integer>();
		map.put("memNo", memNo);
		map.put("groupNo", groupNo);
		int cnt= chat_service.updateUserExist(map);
		logger.info("chat 채팅 접속 결과 : cnt={}", cnt);
		
		List<ChattingVO> chat_list= chat_service.showAllChat(groupNo);
		List<ChattingUserVO> user_list= chat_service.showAllUser(groupNo);
		
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
	
	@RequestMapping(value= "/page.do", method= RequestMethod.GET)
	public void page() {
		
	}
	
	@RequestMapping("/regi.do")
	public String groupRegi_submit(@RequestParam(required=false) String groupName, Model model) {
		logger.info("group regi page parameter : groupName={}", groupName);
		
		if(groupName== null|| groupName.isEmpty()) {
			return "indiGroup/regi";
		}
		List<IndigroupVO> list= group_service.selectByGroupName(groupName);
		model.addAttribute("list", list);
		
		return "indiGroup/regi";
	}
	
	@RequestMapping(value= "/create.do", method= RequestMethod.GET)
	public void groupCreate_form(HttpSession session) {
		logger.info("group create page");

	}
	
	@RequestMapping(value= "/create.do", method= RequestMethod.POST)
	public void groupCreate_submit(@ModelAttribute IndigroupVO vo, HttpSession session) {
		logger.info("group create submit page parameter : vo={}", vo);
		vo.setMemNo((Integer)session.getAttribute("memNo"));
		logger.info("setting 후 : vo={}", vo);
		int cnt= group_service.createGroup(vo);
		logger.info("그룹 생성 결과 : cnt= {}, vo={}", cnt, vo);
		if(cnt> 0) {
			GroupMemberVO mem_vo= new GroupMemberVO();
			mem_vo.setGroupNo(vo.getGroupNo());
			mem_vo.setMemNo(vo.getMemNo());
			group_service.insertGroupMember(mem_vo);
		}
	}
	
	@RequestMapping(value= "/checkName.do")
	public void groupCheck(@ModelAttribute IndigroupVO vo, Model model) {
		logger.info("group check page parameter : vo={}", vo);
		
		int result= group_service.checkGroupName(vo.getGroupName());
		logger.info("그룹명 중복 체크 결과 : cnt={}", result);
		
		model.addAttribute("result", result);
	}
	
	@RequestMapping("/chat/chatAdd.do")
	public String chatAdd(@ModelAttribute ChattingVO vo, Model model) {
		logger.info("chat adding parameter : vo= {}", vo);
		
		chat_service.addChat(vo);
		
		return "redirect:/indiGroup/main.do?groupNo="+ vo.getGroupNo();
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
			default: return 31;
		}
	}
	public static boolean yearcalc(int year){
		if(year%4==0 && (!(year%100==0) && !(year%400==0))){
			return true;
		}
		return false;
	}
}