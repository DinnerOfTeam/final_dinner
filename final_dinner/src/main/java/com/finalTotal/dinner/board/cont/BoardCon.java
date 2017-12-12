package com.finalTotal.dinner.board.cont;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalTotal.dinner.board.model.BoardService;
import com.finalTotal.dinner.board.model.BoardVO;
import com.finalTotal.dinner.board.model.SearchVO;
import com.finalTotal.dinner.common.Utility;

@Controller
@RequestMapping("/board")
public class BoardCon {
	private static final Logger logger=LoggerFactory.getLogger(BoardCon.class);
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/list.do")
	public String list(@ModelAttribute SearchVO searchVO, Model model) {
		logger.info("게시판 목록보기, 파라미터 SearchVO={}", searchVO);
		
		searchVO.setPageSize(Utility.PAGE_SIZE);
		
		List<BoardVO> list=boardService.selectAll(searchVO);
		logger.info("게시판 목록조회 결과, list.size()={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("searchVO", searchVO);
		
		return "board/list";
	}
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam(value="no", defaultValue="0")int freeNo, Model model) {
		logger.info("게시판 상세보기, 파라미터 freeNo={}", freeNo);
		
		BoardVO vo=boardService.selectByNo(freeNo);
		logger.info("게시판 상세보기 결과, vo={}", vo);
		
		if(vo==null) {
			model.addAttribute("msg", "글이 없습니다.");
			model.addAttribute("url", "/board/list.do");
			return "common/message";
		}
		
		model.addAttribute("vo", vo);
		
		return "board/detail";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public void write_get() {
		logger.info("게시판 글쓰기화면 표시");
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String write_post(@ModelAttribute BoardVO boardVO, Model model) {
		logger.info("게시판 글쓰기처리, 파라미터 boardVO={}", boardVO);
		
		int cnt=boardService.insertBoard(boardVO);
		logger.info("게시판 글쓰기처리 결과, cnt={}", cnt);
		
		String msg="", url="/board/write.do";
		
		if(cnt>0) {
			msg="글쓰기 완료";
			url="/board/list.do";
		}else {
			msg="글쓰기 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	
	@RequestMapping(value="/edit.do", method=RequestMethod.GET)
	public String edit_get(@RequestParam(defaultValue="0")int freeNo, Model model) {
		logger.info("게시판 글수정 화면 표시");

		BoardVO vo=boardService.selectByNo(freeNo);
		logger.info("게시판 글수정 화면 결과, vo={}", vo);
		
		if(vo==null) {
			model.addAttribute("msg", "글이 없습니다.");
			model.addAttribute("url", "/board/list.do");
			return "common/message";
		}
		
		model.addAttribute("vo", vo);
		
		return "board/edit";
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public String delete_get() {
		return "board/delete";
	}
	
}
