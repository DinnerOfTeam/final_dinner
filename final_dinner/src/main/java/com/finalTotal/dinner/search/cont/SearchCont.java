package com.finalTotal.dinner.search.cont;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalTotal.dinner.addr.model.AddrService;
import com.finalTotal.dinner.addr.model.SidoVO;
import com.finalTotal.dinner.addr.model.SigunguVO;

@Controller
public class SearchCont {
	private static final Logger logger = LoggerFactory.getLogger(SearchCont.class);
	
	@Autowired
	private AddrService addrService;
	
	@RequestMapping("/search.do")
	public String searchForm(Model model) {
		logger.info("searchForm page");
		
		List<SidoVO> sidoList=addrService.selectSido();
		logger.info("검색-지역정보 조회결과, sidoList.size={}", sidoList.size());
		
		model.addAttribute("sidoList", sidoList);
		
		return "search";
	}
	
	@RequestMapping("/addr/getSigungu.do")
	@ResponseBody
	public List<SigunguVO> searchForm(@RequestParam(defaultValue="0") int sidoNo) {
		logger.info("ajax- 시군구 조회, 파라미터 sidoNo={}", sidoNo);
		
		List<SigunguVO> sigunguList=addrService.selectSigungu(sidoNo);
		logger.info("ajax- 시군구 조회결과, sigunguList.size={}", sigunguList.size());
		
		return sigunguList;
	}
}
