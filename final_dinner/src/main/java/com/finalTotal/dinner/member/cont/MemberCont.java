package com.finalTotal.dinner.member.cont;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalTotal.dinner.member.model.MemberService;

@Controller
@RequestMapping("/member")
public class MemberCont {
	private static final Logger logger
		=LoggerFactory.getLogger(MemberCont.class);
	
	@Autowired
	private MemberService memberService;
	
	


}
