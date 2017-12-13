package com.finalTotal.dinner.member.cont;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member")
public class MyPageCont {
	private static final Logger logger = LoggerFactory.getLogger(LoginCont.class);
	
	@RequestMapping(value="/myPage.do", method=RequestMethod.GET)
	public void myPage() {
		logger.info("마이페이지");
		
		
	}
}
