package com.finalTotal.dinner.indiGroup.cont;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalTotal.dinner.indiGroup.model.GroupCalenderService;
import com.finalTotal.dinner.indiGroup.model.GroupCalenderVO;

@Controller
@RequestMapping("/indiGroup/calender")
public class GroupCalCont {
	public static final Logger log= LoggerFactory.getLogger(GroupCalCont.class);
	
	@Autowired
	private GroupCalenderService service;
	
	@RequestMapping("/search.do")
	@ResponseBody
	public List<GroupCalenderVO> search(@ModelAttribute GroupCalenderVO vo) {
		log.info("search page parameter : vo={}", vo);
		
		List<GroupCalenderVO> list= service.selectCalenderByDay(vo);
		
		return list;
	}
	
	@RequestMapping("/appAdd.do")
	@ResponseBody
	public void appointAdd(@ModelAttribute GroupCalenderVO vo) {
		log.info("search page parameter : vo={}", vo);
		
		int cnt= service.insertCalender(vo);
		log.info("일정 입력 결과 : cnt={}", cnt);
	}

}
