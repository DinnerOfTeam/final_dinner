package com.finalTotal.dinner.groupBoard.cont;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalTotal.dinner.common.PagingVO;
import com.finalTotal.dinner.common.SearchVO;
import com.finalTotal.dinner.groupBoard.model.GroupBoardService;
import com.finalTotal.dinner.groupBoard.model.GroupBoardVO;
import com.finalTotal.dinner.question.model.QuestionVO;


@Controller
@RequestMapping("/indiGroup/groupBoard")
public class GroupBoardCont {
	public static final Logger log= LoggerFactory.getLogger(GroupBoardCont.class);
	
	@Autowired
	private GroupBoardService ser;

	@RequestMapping("/list.do")
	public void list(@ModelAttribute SearchVO searchVo,
			Model model) {
		log.info("그룹 게시판 list page parameter : searchVo={}", searchVo);

		int totalRecord= ser.selectListTotal(searchVo);
		log.info("after search total={}", totalRecord);
		PagingVO pageVo= new PagingVO();
		pageVo.setCurrentPage(searchVo.getCurrentPage());
		pageVo.setTotalRecord(totalRecord);
		pageVo.setBlockSize(10);
		pageVo.setPageSize(10);
		
		searchVo.setPageSize(pageVo.getPageSize());
		searchVo.setTotalPage(pageVo.getTotalPage());
		searchVo.setFirstRowNum(pageVo.getFirstRowNum());
		searchVo.setFirstBlockPage(pageVo.getFirstBlockPage());
		searchVo.setLastBlockPage(pageVo.getLastBlockPage());
		searchVo.setTotalRecord(totalRecord);
		log.info("after setting searchVo={}", searchVo);
		List<GroupBoardVO>list= ser.selectList(searchVo);
		log.info("그룹게시판 조회 결과, list.size()={}", list.size());
		
		model.addAttribute("list", list);
	}
	
	@RequestMapping("/listNotice.do")
	public String listNotice(@RequestParam(defaultValue= "0") int groupNo,
			Model model) {
		log.info("group board notice parameter : groupNo={}", groupNo);
		if(groupNo== 0) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/indiGroup/groupMain.do");
			return "common/message";
		}
		List<GroupBoardVO> list= ser.listNotice(groupNo);
		
		model.addAttribute("list", list);
		
		return "indiGroup/groupBoard/listNotice";
	}
}
