package com.finalTotal.dinner.book.cont;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		logger.info("memNo",memNo);
		
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
		
		msg="삭제되었습니다";
		url="/book/booking.do";
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	
	@RequestMapping("/restaurantBookList.do")
	public String BookList(HttpSession session, Model model) {
		logger.info("식당 예약 조회페이지 ");
	
		int memNo = (Integer)session.getAttribute("memNo");
		logger.info("memNo",memNo);
		
		List<BookVO> list = bookService.selectAll(memNo);
		logger.info("식당 예약조회 결과, list.size()={}");
		
		model.addAttribute("list",list);
		
		return "book/restaurantBookList";
	}
	
	
	
	
	
	@RequestMapping("/map.do")
	public String test() {
		logger.info("test page");
		
		return "book/map"; 
	}
	
	
	
	
	
	
}










