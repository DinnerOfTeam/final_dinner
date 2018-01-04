package com.finalTotal.dinner.admin.cont;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalTotal.dinner.book.model.BookService;

@Controller
@RequestMapping("/admin/book")
public class AdminBookCont {
	public static final Logger log= LoggerFactory.getLogger(AdminBookCont.class);
	
	@Autowired
	private BookService ser;
	
	@RequestMapping("/Abook.do")
	public void bookList(@RequestParam(required=false) String startDay,
			@RequestParam(required=false) String endDay, Model model) {
		log.info("admin book parameter : startDay={}, endDay={}", startDay, endDay);
		
		Map<String, Object> map= new HashMap<String, Object>();
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
		if(startDay== null|| startDay.isEmpty()) {
			startDay= sdf.format(new Date());
			endDay= sdf.format(new Date());
		}
		map.put("startDay", startDay);
		map.put("endDay", endDay);
		List<Map<String, Object>> list= ser.adminSelectDay(map);
		log.info("list.size()={}", list.size());
		
		model.addAttribute("list", list);
	}

}
