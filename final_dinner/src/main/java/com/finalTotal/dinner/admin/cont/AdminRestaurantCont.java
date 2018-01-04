package com.finalTotal.dinner.admin.cont;

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
import com.finalTotal.dinner.restaurant.general.model.RestaurantService;
import com.finalTotal.dinner.restaurant.general.model.RestaurantVO;

@Controller
@RequestMapping("/admin/restaurant")
public class AdminRestaurantCont {
	public static final Logger log= LoggerFactory.getLogger(AdminRestaurantCont.class);
	
	@Autowired
	private AddrService addr_ser;
	
	@Autowired
	private RestaurantService res_ser;
	
	@RequestMapping("/Ares.do")
	public void resList(Model model) {
		List<SidoVO> sido_list= addr_ser.selectSido();
		
		model.addAttribute("sido_list", sido_list);
		log.info("sido 검색 결과 list.size()= {}", sido_list.size());
		
		List<RestaurantVO> res_list= res_ser.all();
		model.addAttribute("res_list", res_list);
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
		for(int i=0 ; i< temp.length; i++) {
			Bkey+= temp[i];
		}
		log.info("변경후 Bkey={}", Bkey);
		model.addAttribute("key", Bkey);
	}
	
	@RequestMapping("/getSigungu.do")
	@ResponseBody
	public List<SigunguVO> getSigungu(@RequestParam int sidoNo) {
		List<SigunguVO> sigungu_list= addr_ser.allSigungu(sidoNo);
		log.info("sigungu_list.size={}", sigungu_list.size());
		
		return sigungu_list;
	}
	
	@RequestMapping("/ArestList.do")
	public String restList(Model model) {
		List<RestaurantVO> list= res_ser.all();
		
		model.addAttribute("list", list);
		
		return "admin/restaurant/ArestList";
	}

}
