package com.finalTotal.dinner.chat.cont;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalTotal.dinner.chat.model.ChattingService;
import com.finalTotal.dinner.chat.model.ChattingVO;
import com.finalTotal.dinner.indiGroup.model.GroupMemberVO;
import com.finalTotal.dinner.indiGroup.model.IndiGroupService;
import com.finalTotal.dinner.indiGroup.model.IndigroupVO;

@Controller
@RequestMapping("/indiGroup/chat/")
public class ChattingCont {
	public static final Logger logger= LoggerFactory.getLogger(ChattingCont.class);
	private int[] date_arr= new int[28];
	private String[] work_arr= new String[28];

	@Autowired
	private ChattingService chat_service;
	@Autowired
	private IndiGroupService group_service;
	
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
		IndigroupVO vo= group_service.selectByGNtoMN(groupNo);
//		logger.info("그룹장인지 검색 결과 : vo={}, memNo={}", vo, memNo);
		if(vo.getMemNo()== memNo) {
			model.addAttribute("isKing", memNo);
		}
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
		
		return "indiGroup/chat/main";
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
		int cnt= group_service.updateUserExist(map);
		logger.info("chat 채팅 접속 결과 : cnt={}", cnt);
		
		List<ChattingVO> chat_list= chat_service.showAllChat(groupNo);
		List<GroupMemberVO> user_list= group_service.showAllUser(groupNo);
		
		model.addAttribute("chat_list", chat_list);
		model.addAttribute("user_list", user_list);
		
		return "indiGroup/chat";
	}
	
	@RequestMapping("/chatAdd.do")
	public String chatAdd(@ModelAttribute ChattingVO vo, Model model) {
		logger.info("chat adding parameter : vo= {}", vo);
		
		chat_service.addChat(vo);
		
		return "redirect:/indiGroup/chat/main.do?groupNo="+ vo.getGroupNo();
	}
	@RequestMapping("/chatList.do")
	public void chatList(@RequestParam int cnt, @RequestParam int groupNo,
			HttpServletResponse response, Model model) {
//		logger.info("chat list page parameter : cnt= {}, groupNo= {}", cnt, groupNo);
		List<ChattingVO> list= chat_service.showAllChat(groupNo);
		List<ChattingVO> add_list= new ArrayList<ChattingVO>();
		
		for(int i= cnt; i< list.size(); i++) {
			ChattingVO vo= list.get(i);
			add_list.add(vo);
//			logger.info("추가된 채팅 : vo= {}", vo);
		}
		
		SimpleDateFormat sdf= new SimpleDateFormat("dd-HH:mm");
		try {
			response.setCharacterEncoding("utf-8");
			PrintWriter out= response.getWriter();
			
			for(ChattingVO vo: add_list) {
//				logger.info("추가된 채팅 : vo= {}", vo);
				
				out.println("<chat><list>");
				out.println("<memNo>"+ vo.getMemNo()+ "</memNo>");
				out.println("<memName>"+ vo.getMemName()+ "</memName>");
				out.println("<chatRegdate>"+ sdf.format(vo.getChatRegdate())+ "</chatRegdate>");
				out.println("<chatContents>"+ vo.getChatContents()+ "</chatContents>");
				out.println("</list></chat>");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
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
