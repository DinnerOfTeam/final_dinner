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
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalTotal.dinner.chat.model.ChattingService;
import com.finalTotal.dinner.chat.model.ChattingVO;
import com.finalTotal.dinner.indiGroup.model.GroupMemberVO;
import com.finalTotal.dinner.indiGroup.model.IndiGroupService;
import com.finalTotal.dinner.indiGroup.model.IndigroupVO;

@Controller
@RequestMapping("/indiGroup/chat/")
public class ChattingCont {
	public static final Logger logger= LoggerFactory.getLogger(ChattingCont.class);

	@Autowired
	private ChattingService chat_service;
	@Autowired
	private IndiGroupService group_service;
	
	@RequestMapping(value= "/main.do")
	public String main(@RequestParam(defaultValue= "0") int groupNo,
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
		
		return "indiGroup/chat/chat";
	}
	
	@RequestMapping("/chatAdd.do")
	@ResponseBody
	public void chatAdd(@ModelAttribute ChattingVO vo, Model model) {
		logger.info("chat adding parameter : vo= {}", vo);
		
		chat_service.addChat(vo);
	}
	
	@RequestMapping("/chatList.do")
	@ResponseBody
	public List<ChattingVO> chatList(@RequestParam int cnt, @RequestParam int groupNo,
			HttpServletResponse response, Model model) {
//		logger.info("chat list page parameter : cnt= {}, groupNo= {}", cnt, groupNo);
		List<ChattingVO> list= chat_service.showAllChat(groupNo);
		List<ChattingVO> add_list= new ArrayList<ChattingVO>();

		SimpleDateFormat sdf= new SimpleDateFormat("dd-HH:mm");
		for(int i= cnt; i< list.size(); i++) {
			ChattingVO vo= list.get(i);
			add_list.add(vo);
		}
		
		return add_list;
	}
	
}
