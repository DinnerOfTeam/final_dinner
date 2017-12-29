package com.finalTotal.dinner.restaurant.search.cont;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalTotal.dinner.addr.model.AddrService;
import com.finalTotal.dinner.addr.model.SidoVO;
import com.finalTotal.dinner.addr.model.SigunguVO;
import com.finalTotal.dinner.common.PagingVO;
import com.finalTotal.dinner.restaurant.general.model.RestaurantService;
import com.finalTotal.dinner.restaurant.general.model.RestaurantVO;
import com.finalTotal.dinner.restaurant.search.model.RestaruntSearchVO;

@Controller
public class SearchCont {
	private static final Logger logger = LoggerFactory.getLogger(SearchCont.class);
	
	@Autowired
	private AddrService addrService;
	
	@Autowired
	private RestaurantService restaurantService;
	
	@RequestMapping("/search.do")
	public String searchForm(@ModelAttribute RestaruntSearchVO searchVO,
			Model model) {
		logger.info("searchForm page, 파라미터 searchVO={}", searchVO);
		
		
		List<Map<String, String>> locationList=searchVO.getLocationList();
		if(locationList!=null) {
			logger.info("찾을 지역 수 : {}", locationList.size());
		}
		
		int totalRes=restaurantService.countRestarunt(searchVO);
		logger.info("검색- 식당 : {}", totalRes);
		
		PagingVO paging=new PagingVO();
		paging.setCurrentPage(searchVO.getCurrentPage());
		paging.setPageSize(9);
		paging.setTotalRecord(totalRes);
		
		searchVO.setPageSize(paging.getPageSize());
		searchVO.setTotalPage(paging.getTotalPage());
		searchVO.setFirstRowNum(paging.getFirstRowNum());
		searchVO.setFirstBlockPage(paging.getFirstBlockPage());
		searchVO.setLastBlockPage(paging.getLastBlockPage());
		
		List<SidoVO> sidoList=addrService.selectSido();
		logger.info("검색-지역정보 조회결과, sidoList.size={}", sidoList.size());
		
		List<RestaurantVO> list=restaurantService.searchRestarunt(searchVO);
		logger.info("검색- 결과, list.size={}", list.size());
		
		model.addAttribute("sidoList", sidoList);
		model.addAttribute("list", list);
		
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
