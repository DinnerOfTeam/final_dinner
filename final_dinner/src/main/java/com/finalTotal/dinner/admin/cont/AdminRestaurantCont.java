package com.finalTotal.dinner.admin.cont;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalTotal.dinner.admin.model.AddrVO;

@Controller
@RequestMapping("/admin/restaurant")
public class AdminRestaurantCont extends SqlSessionDaoSupport {
	public static final Logger log= LoggerFactory.getLogger(AdminBookCont.class);
	
	private String name= "config.addr";
	
	@RequestMapping("/Ares.do")
	public void resList(Model model) {
		List<AddrVO> sido_list= getSqlSession().selectList(name+ ".allSido");
		List<AddrVO> sigungu_list= getSqlSession().selectList(name+ ".allSigungu");
		
		model.addAttribute("sido_list", sido_list);
		log.info("sido 검색 결과 list.size()= {}", sido_list.size());
		model.addAttribute("sigungu_list", sigungu_list);
		log.info("sigungu 검색 결과 list.size()= {}", sigungu_list.size());
		
	}
	
	@RequestMapping("/Ares2.do")
	public void searchMap(@RequestParam String Akey, Model model) {
		log.info("지도 장소검색 page parameter : Akey={}", Akey);
		
		Akey.replaceAll(" ", "");
		Akey.replaceAll("%20", "");
		Akey.replaceAll("\\p{Z}", "");
		log.info("변경후 Akey={}", Akey);
		String[] temp= Akey.split(" ");
		String Bkey= "";
		if(temp.length> 4) {
			for(int i=0 ; i< 4; i++) {
				Bkey+= temp[i];
			}
		}else {
			for(int i=0 ; i< temp.length; i++) {
				Bkey+= temp[i];
			}
		}
		log.info("변경후 Bkey={}", Bkey);
		model.addAttribute("key", Bkey);
	}
	
	@RequestMapping("/getSigungu.do")
	@ResponseBody
	public List<AddrVO> getSigungu(@RequestParam int sidoNo) {
		List<AddrVO> sigungu_list= getSqlSession().selectList(name+ ".selectSigungu", sidoNo);
		
		return sigungu_list;
	}

}
