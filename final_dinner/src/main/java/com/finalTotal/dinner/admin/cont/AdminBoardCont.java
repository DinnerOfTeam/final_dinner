package com.finalTotal.dinner.admin.cont;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/board")
public class AdminBoardCont {
	public static final Logger log= LoggerFactory.getLogger(AdminBoardCont.class);
	
	@RequestMapping("/Aboard.do")
	public void main() {
		
	}

}
