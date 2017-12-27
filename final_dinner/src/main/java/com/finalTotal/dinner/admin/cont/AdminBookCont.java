package com.finalTotal.dinner.admin.cont;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/book")
public class AdminBookCont {
	public static final Logger log= LoggerFactory.getLogger(AdminBookCont.class);
	
	@RequestMapping("/Abook.do")
	public void main() {
		
	}

}
