package com.finalTotal.dinner.indiGroup.cont;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/indiGroup/groupBoard")
public class GroupBoardCont {
	public static final Logger log= LoggerFactory.getLogger(GroupBoardCont.class);

	@RequestMapping("/list.do")
	public void list() {
		log.info("그룹 게시판 list page");
	}
}
