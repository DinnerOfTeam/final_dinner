package com.finalTotal.dinner.admin.cont;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminCont {
	public static final Logger log= LoggerFactory.getLogger(AdminCont.class);
	
	@RequestMapping("/main.do")
	public String main() {
		
		return "admin/main";
	}
}
