package com.finalTotal.dinner.board.cont;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board")
public class BoardCon {
	@RequestMapping("/list.do")
	public String list() {
		return "board/list";
	}
	
	@RequestMapping("/detail.do")
	public String detail() {
		return "board/detail";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String write_get() {
		return "board/write";
	}
	
	@RequestMapping(value="/edit.do", method=RequestMethod.GET)
	public String edit_get() {
		return "board/edit";
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public String delete_get() {
		return "board/delete";
	}
	
}
