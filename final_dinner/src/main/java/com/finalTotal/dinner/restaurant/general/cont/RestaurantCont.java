package com.finalTotal.dinner.restaurant.general.cont;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalTotal.dinner.common.FileUtil;
import com.finalTotal.dinner.food.model.FoodMenuService;
import com.finalTotal.dinner.food.model.MenuVO;
import com.finalTotal.dinner.restaurant.general.model.RestaurantPhotoVO;
import com.finalTotal.dinner.restaurant.general.model.RestaurantService;
import com.finalTotal.dinner.restaurant.general.model.RestaurantTypeVO;
import com.finalTotal.dinner.restaurant.general.model.RestaurantVO;

@Controller
@RequestMapping("/restaurant")
public class RestaurantCont {
	
	private static final Logger logger = LoggerFactory.getLogger(RestaurantCont.class);

	@Autowired
	private RestaurantService restaurantService;
	
	@Autowired
	private FoodMenuService foodMenuService;
	
	@Autowired
	private FileUtil fileUtil;
	
	@RequestMapping(value="/restaurantJoin.do", method=RequestMethod.GET)
	public String restaurantJoin_get(@ModelAttribute RestaurantTypeVO vo, Model model) {
		logger.info("식당등록 페이지");
			
			List<RestaurantTypeVO> typeList = restaurantService.restaurantType();
			logger.info("식당종류 파라미터 typeList={}",typeList);
			
			model.addAttribute("typeList", typeList);
		
		return "restaurantGeneral/restaurantJoin";
	}	
	
	@RequestMapping(value="/restaurantJoin.do", method=RequestMethod.POST)
	public String restaurantJoin_post(HttpServletRequest request, @ModelAttribute RestaurantVO vo, Model model,
						HttpSession session) {
	    logger.info("식당 등록 페이지 파라미터 vo={}",vo);
	    
	    //이미지 업로드 처리
	    String resThumbnail="";	  
	    
	    List<RestaurantPhotoVO> imageList=new ArrayList<RestaurantPhotoVO>();
		try {
			List<Map<String, Object>> listThumb=null;
			listThumb=fileUtil.fileUploadByKey(request, "imageThumb", FileUtil.IMAGE_UPLOAD, false);
			
			if(listThumb!=null && !listThumb.isEmpty()) {
				Map<String, Object> map=listThumb.get(0);
				
				resThumbnail=(String)map.get("filename");
				
				vo.setResThumbnail(resThumbnail);
			}
			
			int memNo = (Integer)session.getAttribute("memNo");
			vo.setMemNo(memNo);
		
			logger.info("vo={}",vo);
			
			List<Map<String, Object>> listFileImg=null;
			listFileImg=fileUtil.fileUploadByKey(request, "imageUpload", FileUtil.IMAGE_UPLOAD);
			if(listFileImg!=null && !listFileImg.isEmpty()) {
				for(Map<String, Object> dataMap : listFileImg) {
					RestaurantPhotoVO imageVO = new RestaurantPhotoVO();
					imageVO.setResPhotoName((String)dataMap.get("filename"));
					imageVO.setResPhotoOriginalName((String)dataMap.get("originalFilename"));
					imageVO.setResPhotoTitle("이미지");
					
					imageList.add(imageVO);
				}
			}
			
			
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
	    	//이미지 DB작업
	    	for(RestaurantPhotoVO photoVO : imageList) {
	    		photoVO.setResNo(vo.getResNo());
	    	}
	    	int cntImg=restaurantService.insertPhotoList(imageList);
	    	
	        msg = "식당등록이되었습니다.";
	        url = "/member/myPage.do";
	        
	        if(cntImg==0) {
	        	msg = "식당 등록 완료 / 이미지 등록 실패";
	        }
	    }else{
	        msg = "식당등록실패";
	    }
	    model.addAttribute("msg", msg);
	    model.addAttribute("url", url);
	    
	    return "common/message";
	}
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam(defaultValue="0") int resNo,
			Model model) {
		logger.info("식당 페이지 파라미터 resNo={}",resNo);
		
		if(resNo==0) {
			model.addAttribute("msg", "잘못된 URL입니다");
			model.addAttribute("back", true);
			
			return "common/message";
		}
		
		RestaurantVO vo=restaurantService.selectByNo(resNo);
		logger.info("식당 조회결과 vo={}",vo);
		
		if(vo==null || vo.getResNo()==0) {
			model.addAttribute("msg", "존재하지 않거나 삭제된 식당입니다");
			model.addAttribute("url", "/search.do");
			
			return "common/message";
		}
		
		if(vo.getResIntroduce()!=null && !vo.getResIntroduce().isEmpty()) {
			vo.setResIntroduce(vo.getResIntroduce().replace("\r\n", "<br>"));
		}
		
		//메뉴 찾기
		List<MenuVO> menuList=foodMenuService.selectMenuByResNo(resNo);
		logger.info("메뉴 조회결과 menuList.size={}", menuList.size());
		
		List<RestaurantPhotoVO> photoList=restaurantService.selectPhotoByresNo(resNo);
		logger.info("사진 조회결과 photoList.size={}", photoList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("menuList", menuList);
		model.addAttribute("photoList", photoList);
		
		return "restaurant/detail";
	}
	
	
	
	
}