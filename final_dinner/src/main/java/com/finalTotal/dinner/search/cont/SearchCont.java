package com.finalTotal.dinner.search.cont;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchCont {
	private static final Logger logger = LoggerFactory.getLogger(SearchCont.class);

	@RequestMapping("/about.do")
	public String searchForm() {
		logger.info("searchForm page");
		
		return "about";
	}
}
