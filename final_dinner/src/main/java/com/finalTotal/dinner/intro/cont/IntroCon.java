package com.finalTotal.dinner.intro.cont;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/intro")
public class IntroCon {
	private static final Logger logger = LoggerFactory.getLogger(IntroCon.class);
	
	@RequestMapping(value="/intro.do", method=RequestMethod.GET)
	public void intro_get() {
		logger.info("브랜드 소개 화면 보여주기");
	}
}
