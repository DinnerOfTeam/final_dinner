package com.finalTotal.dinner.event.cont;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalTotal.dinner.common.PagingVO;
import com.finalTotal.dinner.common.SearchVO;
import com.finalTotal.dinner.event.model.EventService;
import com.finalTotal.dinner.event.model.EventVO;

@Controller
@RequestMapping("/event")
public class EventController {
	private static final Logger logger=LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	public EventService eventService;
	
	@RequestMapping("/eventList.do")
	public String eventList() {
		logger.info("이벤트 목록 보여주기");
		
		return "event/eventList";
	}
	
	@RequestMapping("/getEventList.do")
	@ResponseBody
	public Map<String, Object> getEventList(@RequestParam String eventDate, @RequestParam(defaultValue="1") int page) {
		logger.info("이벤트 목록 조회하기, 파라미터 eventDate={}, page={}", eventDate, page);
		Map<String, Object> map=new HashMap<String, Object>();
		
		String status="error";
		SearchVO searchVO=new SearchVO();
		PagingVO pagingVO=new PagingVO();
		pagingVO.setCurrentPage(page);
		
		if(eventDate!=null && !eventDate.isEmpty()) {
			int count=eventService.countEventByDate(eventDate);
			logger.info("이벤트 목록 개수 조회 결과, count={}", count);
			
			pagingVO.setTotalRecord(count);
			pagingVO.setPageSize(5);
			
			
			pagingVO.getTotalPage();
			int firstRowNum = pagingVO.getFirstRowNum();
			pagingVO.getFirstBlockPage();
			pagingVO.getLastBlockPage();
			
			searchVO.setKeyword(eventDate);
			searchVO.setCurrentPage(page);
			searchVO.setFirstRowNum(firstRowNum);
			searchVO.setPageSize(pagingVO.getPageSize());
			
			
			List<EventVO> list=eventService.selectEventByDate(searchVO);
			logger.info("이벤트 목록 조회 결과, list.size()={}", list.size());
			
			status="success";
			
			map.put("list", list);
		}
		map.put("status", status);
		map.put("paging", pagingVO);
		
		
		return map;
	}
}
