package com.finalTotal.dinner.restaurant.general.cont;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalTotal.dinner.common.FileUtil;
import com.finalTotal.dinner.member.cont.LoginCont;
import com.finalTotal.dinner.restaurant.general.model.RestaurantService;
import com.finalTotal.dinner.restaurant.general.model.RestaurantVO;

@Controller
@RequestMapping("/restaurant")
public class RestaurantCont {
	
	private static final Logger logger = LoggerFactory.getLogger(RestaurantCont.class);

	@Autowired
	private RestaurantService restaurantService;
	
	@Autowired
	private FileUtil fileUtil;
	
	@RequestMapping(value="/restaurantJoin.do", method=RequestMethod.GET)
	public String restaurantJoin_get() {
		logger.info("식당등록 페이지");
		
		return "restaurantGeneral/restaurantJoin";
	}
	
	
	@RequestMapping(value="/restaurantJoin.do", method=RequestMethod.POST)
	public String restaurantJoin_post(HttpServletRequest request, @ModelAttribute RestaurantVO vo, Model model) {
	    logger.info("식당 등록 페이지 파라미터 vo={}",vo);
	    
	    //이미지 업로드 처리
	    String resThumbnail="";	  
	    	
			try {
				List<Map<String, Object>> list;
				list = fileUtil.fileupload(request, FileUtil.IMAGE_UPLOAD);
				for(Map<String, Object> map:list) {
					resThumbnail=(String)map.get("filename");
					
					vo.setResThumbnail(resThumbnail);
				}			
			
				logger.info("vo={}",vo);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
			//db insert    
	    
	    int cnt = restaurantService.insertRestuarant(vo);
	    logger.info("식당 등록 결과 , cnt={}",cnt);
	    
	    String msg = "";
	    String url = "";
	    
	    if(cnt > 0) {
	        msg = "식당등록이되었습니다.";
	        url = "/member/myPage.do";
	    }else{
	        msg = "식당등록실패";
	    }
	    model.addAttribute("msg", msg);
	    model.addAttribute("url", url);
	    
	    return "common/message";
	}
	
}