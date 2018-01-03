package com.finalTotal.dinner.event.cont;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalTotal.dinner.common.FileUtil;
import com.finalTotal.dinner.common.PagingVO;
import com.finalTotal.dinner.common.SearchVO;
import com.finalTotal.dinner.event.model.EventService;
import com.finalTotal.dinner.event.model.EventVO;
import com.finalTotal.dinner.restaurant.general.model.RestaurantService;
import com.finalTotal.dinner.restaurant.general.model.RestaurantVO;

@Controller
public class EventController {
	private static final Logger logger=LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	public EventService eventService;
	
	@Autowired
	public RestaurantService restaruntService;
	
	@RequestMapping("/event/eventList.do")
	public String eventList() {
		logger.info("이벤트 목록 보여주기");
		
		return "event/eventList";
	}
	
	@Autowired
	private FileUtil fileUtil;
	
	@RequestMapping("/event/getEventList.do")
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
	
	@RequestMapping(value="/member/event/writeEvent.do", method=RequestMethod.GET)
	public String writeEvent_get() {
		logger.info("이벤트 등록 신청 페이지");
		
		return "event/writeEvent";
	}
	@RequestMapping(value="/member/event/writeEvent.do", method=RequestMethod.POST)
	public String writeEvent_post(@ModelAttribute EventVO vo,
			HttpServletRequest request, Model model) {
		HttpSession session=request.getSession();
		String memId=(String)session.getAttribute("memId");
		logger.info("이벤트 등록 처리, 파라미터 vo={}", vo);
		
		String msg="", url="";
		boolean back=true;
		
		//유효성 검사
		if(vo!=null) {
			if(vo.getEventTitle()==null || vo.getEventTitle().isEmpty()) {
				msg="이벤트 제목을 입력하세요";
			}else if(vo.getEventContent()==null || vo.getEventContent().isEmpty()){
				msg="이벤트 내용을 입력하세요";
			}else if(vo.getEventStartStr()==null || vo.getEventStartStr().isEmpty()){
				msg="이벤트 시작일을 입력하세요";
			}else if(vo.getEventEndStr()==null || vo.getEventEndStr().isEmpty()){
				msg="이벤트 종료일을 입력하세요";
			}else {
				back=false;
			}
		}
		
		if(!back) {
			//식당번호 가져오기
			List<Integer> resNoList=restaruntService.selectNoByMemId(memId);
			int resNo=0;
			if(resNoList!=null && !resNoList.isEmpty()) {
				resNo=resNoList.get(0);
			}
			
			vo.setResNo(resNo);
			
			//이미지 업로드
			String fileName="";
			try {
				List<Map<String, Object>> fileList=fileUtil.fileUploadByKey(request, "resThumbnail", FileUtil.IMAGE_UPLOAD, false);
				
				if(fileList!=null && !fileList.isEmpty()) {
					Map<String, Object> thumbImg=fileList.get(0);
					
					fileName=(String)thumbImg.get("filename");
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			vo.setEventThumb(fileName);
			
			//이벤트 등록
			int cnt=eventService.insertEvent(vo);
			logger.info("이벤트 등록 결과, cnt={}", cnt);
			
			if(cnt>0) {
				msg="이벤트 등록 신청 완료";
				url="/member/myPage.do";
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("back", back);
		
		return "common/message";
	}
	
	private void eventList(String resNo, SearchVO searchVO, Model model) {
		PagingVO paging=new PagingVO();
		
		int listCount=eventService.countEventList(resNo);
		logger.info("이벤트 갯수, listCount={}", listCount);

		paging.setTotalRecord(listCount);
		
		paging.getTotalPage();
		paging.setCurrentPage(searchVO.getCurrentPage());
		int firstRowNum = paging.getFirstRowNum();
		paging.getFirstBlockPage();
		paging.getLastBlockPage();
		
		searchVO.setKeyword(resNo);
		searchVO.setFirstRowNum(firstRowNum);
		searchVO.setPageSize(paging.getPageSize());
		
		List<EventVO> list=eventService.selectEventList(searchVO);
		logger.info("이벤트 조회 결과, list.Size()={}", list.size());
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}
	
	private void eventList(int resNo, SearchVO searchVO, Model model) {
		eventList(resNo+"", searchVO, model);
	}
	
	@RequestMapping("/member/event/eventList.do")
	public String eventList_member(@ModelAttribute SearchVO searchVO,
			HttpSession session, Model model) {
		String memId=(String)session.getAttribute("memId");
		
		//식당번호 가져오기
		List<Integer> resNoList=restaruntService.selectNoByMemId(memId);
		int resNo=0;
		if(resNoList!=null && !resNoList.isEmpty()) {
			resNo=resNoList.get(0);
		}
		
		logger.info("업체-이벤트 조회, 파라미터 searchVO={}, resNo={}", searchVO, resNo);
		
		eventList(resNo, searchVO, model);
		
		return "event/eventListMember";
	}
	
	@RequestMapping("/member/event/eventEndSet.do")
	public String eventList_member(@ModelAttribute EventVO vo,
			HttpSession session, Model model) {
		String memId=(String)session.getAttribute("memId");
		
		//식당번호 가져오기
		List<Integer> resNoList=restaruntService.selectNoByMemId(memId);
		int resNo=0;
		if(resNoList!=null && !resNoList.isEmpty()) {
			resNo=resNoList.get(0);
		}
		
		logger.info("업체-이벤트 마감, 파라미터 vo={}, resNo={}", vo, resNo);
		
		String msg="", url="";
		boolean back=false;
		
		if(vo==null || vo.getEventNo()==0 || vo.getEventIsEnd()==null ||
				(vo.getEventIsEnd().equals("Y") && vo.getEventIsEnd().equals("N"))) {
			msg="잘못된 URL입니다";
			back=true;
		}else {
			EventVO eVO=eventService.selectEventByNo(vo.getEventNo());
			logger.info("업체-이벤트 마감, 이벤트 eVO={}", eVO);
			
			if(eVO==null || eVO.getResNo()==resNo) {
				msg="존재하지 않는 이벤트거나, 권한이 없습니다";
				back=true;
			}
		}
		
		if(!back) {
			int cnt=eventService.eventClose(vo);
			logger.info("업체-이벤트 마감, cnt={}", cnt);
			
			if(cnt>0) {
				msg="설정 완료";
				url="/member/event/eventList.do";
				back=false;
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("back", back);
		
		return "common/message";
	}
	
	@RequestMapping("/admin/event/eventList.do")
	public String eventList_admin(@ModelAttribute SearchVO searchVO, Model model) {
		logger.info("관리자-이벤트 조회, 파라미터 searchVO={}", searchVO);
		
		eventList(null, searchVO, model);
		return "event/eventListAdmin";
	}
	
	@RequestMapping("/admin/event/eventEndSet.do")
	public String eventList_admin(@ModelAttribute EventVO vo, Model model) {
		logger.info("관리자-이벤트 마감, 파라미터 vo={}", vo);
		
		String msg="", url="";
		boolean back=false;
		
		if(vo==null || vo.getEventNo()==0 || vo.getEventIsEnd()==null ||
				(vo.getEventIsEnd().equals("Y") && vo.getEventIsEnd().equals("N"))) {
			msg="잘못된 URL입니다";
			back=true;
		}else {
			EventVO eVO=eventService.selectEventByNo(vo.getEventNo());
			logger.info("관리자-이벤트 마감, 이벤트 eVO={}", eVO);
			
			if(eVO==null) {
				msg="존재하지 않는 이벤트입니다";
				back=true;
			}
		}
		
		if(!back) {
			int cnt=eventService.eventClose(vo);
			logger.info("관리자-이벤트 마감, cnt={}", cnt);
			
			if(cnt>0) {
				msg="설정 완료";
				url="/admin/event/eventList.do";
				back=false;
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("back", back);
		
		return "common/message";
	}
	
	@RequestMapping("/admin/event/eventApprove.do")
	public String eventApprove(@RequestParam(defaultValue="0") int eventNo, Model model) {
		logger.info("관리자-이벤트 승인, 파라미터 eventNo={}", eventNo);
		
		String msg="", url="";
		boolean back=false;
		
		if(eventNo==0) {
			msg="잘못된 URL입니다";
			back=true;
		}else {
			EventVO eVO=eventService.selectEventByNo(eventNo);
			logger.info("관리자-이벤트 승인, 이벤트 eVO={}", eVO);
			
			if(eVO==null) {
				msg="존재하지 않는 이벤트입니다";
				back=true;
			}else if(eVO.getEventApprove().equals("Y")){
				msg="이미 승인된 이벤트입니다.";
				back=true;
			}
		}
		
		if(!back) {
			int cnt=eventService.eventApprove(eventNo);
			logger.info("관리자-이벤트 승인, cnt={}", cnt);
			
			if(cnt>0) {
				msg="승인 완료";
				url="/admin/event/eventList.do";
				back=false;
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("back", back);
		
		return "common/message";
	}
	
	@RequestMapping("/admin/event/eventDelete.do")
	public String eventDelete(@RequestParam(defaultValue="0") int eventNo,
			HttpServletRequest request, Model model) {
		logger.info("관리자-이벤트 삭제, 파라미터 eventNo={}", eventNo);
		
		String msg="", url="";
		boolean back=false;
		
		EventVO eVO=null;
		
		if(eventNo==0) {
			msg="잘못된 URL입니다";
			back=true;
		}else {
			eVO=eventService.selectEventByNo(eventNo);
			logger.info("관리자-이벤트 삭제, 이벤트 eVO={}", eVO);
			
			if(eVO==null) {
				msg="존재하지 않거나 이미 삭제된 이벤트입니다";
				back=true;
			}
		}
		
		if(!back) {
			
			//이미지 삭제
			String imgThumb=eVO.getEventThumb();
			
			if(imgThumb!=null && !imgThumb.isEmpty()) {
				File img=new File(fileUtil.getUploadPath(request, FileUtil.IMAGE_UPLOAD), imgThumb);
				
				if(img.exists()) {
					boolean bool = img.delete();
					logger.info("이미지 삭제 결과, bool={}", bool);
				}
			}
			
			int cnt=eventService.deleteEvent(eventNo);
			logger.info("관리자-이벤트 삭제, cnt={}", cnt);
			
			if(cnt>0) {
				msg="삭제 완료";
				url="/admin/event/eventList.do";
				back=false;
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("back", back);
		
		return "common/message";
	}
	
	@RequestMapping("/event/eventDetail.do")
	public String eventDetail(@RequestParam(defaultValue="0") int eventNo,
			Model model) {
		logger.info("이벤트 상세보기, 파라미터 eventNo={}", eventNo);
		
		String msg="";
		boolean back= false;
		
		EventVO eVO=null;
		RestaurantVO rVO=null;
		
		if(eventNo==0) {
			msg="잘못된 URL입니다";
			back=true;
			
			return "common/message";
		}else {
			eVO=eventService.selectEventByNo(eventNo);
			logger.info("상세보기 결과 VO={}", eVO);
			
			if(eVO==null || eVO.getEventNo()==0) {
				msg="존재하지 않거나 삭제된 이벤트입니다";
				back=true;
			}
			
			rVO=restaruntService.selectByNo(eVO.getResNo());
			logger.info("상세보기 식당정보 결과 VO={}", rVO);
		}
		
		if(back) {
			model.addAttribute("msg", msg);
			model.addAttribute("back", back);
			
			return "common/message";
		}
		
		model.addAttribute("eVO", eVO);
		model.addAttribute("rVO", rVO);
		
		return "event/eventDetail";
	}
	
}
