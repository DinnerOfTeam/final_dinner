package com.finalTotal.dinner.login.cont;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginCont {
	private static final Logger logger = LoggerFactory.getLogger(LoginCont.class);
	
	@RequestMapping("/login/login.do")
	public String login_form() {
		logger.info("login form page");
		
		return "login";
	}
	
	@RequestMapping("/signup.do")
	public String regi_form() {
		logger.info("regi form page");
		
		return "signup";
	}

}
