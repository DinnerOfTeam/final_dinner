package com.finalTotal.dinner.book.cont;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalTotal.dinner.book.model.BookService;

@Controller
@RequestMapping("/book")
public class BWriteCon {
	
	private static final Logger logger 
		= LoggerFactory.getLogger(BWriteCon.class);
	
	@Autowired
	BookService bookService;
	
	@RequestMapping(value= "/booking.do", method= RequestMethod.GET)
	public String writeForm() {
		logger.info("예약 정보조회 페이지");
		
		return "book/booking";
	}
	
	
}
