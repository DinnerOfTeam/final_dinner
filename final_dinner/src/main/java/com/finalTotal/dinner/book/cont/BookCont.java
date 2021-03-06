package com.finalTotal.dinner.book.cont;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalTotal.dinner.book.model.BookService;
import com.finalTotal.dinner.book.model.BookVO;

@Controller
@RequestMapping("/book")
public class BookCont {
	
	private static final Logger logger 
		= LoggerFactory.getLogger(BookCont.class);
	
	@Autowired
	private BookService bookService;
	
	@RequestMapping(value= "/booking.do", method= RequestMethod.GET)
	public String writeForm(HttpSession session, Model model) {
		logger.info("예약 정보조회 페이지");
		
		int memNo = (Integer)session.getAttribute("memNo");
		logger.info("memNo={}",memNo);
		
		List<BookVO> list = bookService.selectByAdd(memNo);
		logger.info("예약 확인 정보조회 결과, list.size()={},list={}",list.size(),list);
		
		model.addAttribute("list",list);
		
		
		
		return "book/booking";
	}
	
	@RequestMapping(value="/booking.do", method=RequestMethod.POST)
	public String deleteBook_post(@ModelAttribute BookVO vo, Model model) {
		logger.info("예약 취소 파라미터 vo={}",vo);
		
		String msg="";
		String url="/book/booking.do?BookNo="+vo.getBookNo();
		
		int cnt = bookService.deleteBook(vo.getBookNo());
		
		msg="취소되었습니다";
		url="/book/booking.do";
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	
	@RequestMapping("/restaurantBookList.do")
	public String BookList(HttpSession session, Model model) {
		logger.info("식당 예약 조회페이지 ");
	
		int memNo = (Integer)session.getAttribute("memNo");
		logger.info("파라미터 memNo={}",memNo);
		
		// memNo에 해당하는 업체에 예약된 손님 가져오기
		List<Map<String,Object>> list = bookService.selectReservedMember(memNo);
		logger.info("식당 예약조회 결과, list.size()={}",list.size());
		
		model.addAttribute("list",list);
		
		return "book/restaurantBookList";
	}
	
	
	

	@RequestMapping(value="/restaurantBooking.do",method=RequestMethod.GET)
	public String insertBook_get() {
		logger.info("예약 페이지");
		
		return "book/restaurantBooking"; 
	}
	
	@RequestMapping(value="/restaurantBooking.do",method=RequestMethod.POST)
	public String insertBook_post(@ModelAttribute BookVO bookVo, HttpSession session,
			Model model) {
		logger.info("예약 페이지 ,파라미터 bookVo={}", bookVo);
		
		String s_date = bookVo.getS_bookDate();
		String[] date_arr= s_date.split("-");
		int year= Integer.parseInt(date_arr[0]);
		year-= 1900;
		int month= Integer.parseInt(date_arr[1]);
		month--;
		int date= Integer.parseInt(date_arr[2]);
		Date d= new Date(year, month, date);
		bookVo.setBookDate(d);
		
		
		int memNo = (Integer)session.getAttribute("memNo");
		logger.info("파라미터 memNo={}",memNo);
		
		bookVo.setMemNo(memNo);
				
		String msg="", url="";
		
		int cnt = bookService.insertBook(bookVo);
		
		if(cnt>0) {
			msg="예약이 완료되었습니다";
			url="/book/booking.do";
		}else {
			msg="식당 예약 실패";
			url="/book/restaurantBooking";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);	
		
		
		return "common/message"; 
	}
	
	
	
	
	
	@RequestMapping("/map.do")
	public String test() {
		logger.info("test page");
		
		return "book/map"; 
	}
	
	
	
	
	
	
}










