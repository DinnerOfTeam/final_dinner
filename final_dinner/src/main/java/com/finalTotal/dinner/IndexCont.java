package com.finalTotal.dinner;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexCont {
	private static final Logger logger = LoggerFactory.getLogger(IndexCont.class);
	
	@RequestMapping("/index.do")
	public String index_form() {
		logger.info("index page");
		
		return "index"; 
	}
	
	@RequestMapping("/test.do")
	public String test() {
		logger.info("test page");
		
		return "test"; 
	}

}
