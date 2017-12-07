package com.finalTotal.dinner.book.cont;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalTotal.dinner.book.model.BookService;
import com.finalTotal.dinner.book.model.BookVO;

@Controller
public class BWriteCon {
	@Autowired
	BookService ser;
	
	@RequestMapping(value= "/book/write.do", method= RequestMethod.GET)
	public String writeForm() {
		System.out.println("writeForm method()");
		
		return "write";
	}
	
	@RequestMapping(value= "/book/write.do", method= RequestMethod.POST)
	public String writeSubmit(@ModelAttribute BookVO vo) {
		System.out.println("writeSubmit method() paramater : "+ vo);
		
		int cnt= ser.insert(vo);
		System.out.println("입력 결과 : "+ cnt);
		
		return "redirect:/book/write.do";
	}
}
