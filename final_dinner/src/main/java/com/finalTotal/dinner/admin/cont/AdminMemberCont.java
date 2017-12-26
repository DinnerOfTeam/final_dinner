package com.finalTotal.dinner.admin.cont;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberCont {
	public static final Logger log= LoggerFactory.getLogger(AdminMemberCont.class);
	
	@RequestMapping("/Amember.do")
	public void main() {
		
	}

}
