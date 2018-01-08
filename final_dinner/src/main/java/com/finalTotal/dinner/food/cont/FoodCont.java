package com.finalTotal.dinner.food.cont;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.finalTotal.dinner.food.model.FoodItemVO;
import com.finalTotal.dinner.food.model.FoodItemVO2;
import com.finalTotal.dinner.food.model.FoodMenuService;
import com.finalTotal.dinner.food.model.FoodMenuVO;
import com.finalTotal.dinner.food.model.MenuVO;
import com.finalTotal.dinner.restaurant.general.model.RestaurantService;


@Controller
@RequestMapping("/restaurantEnterprise")
public class FoodCont {
	
	private static final Logger logger
	= LoggerFactory.getLogger(FoodCont.class);
	
	@Autowired
	private FoodMenuService foodMenuService;
	
	@Autowired
	private RestaurantService restaruntService;
	
	
	@RequestMapping(value="/foodWrite.do", method=RequestMethod.GET)
	public String foodWirte_get(HttpSession session , Model model) {
		logger.info("메뉴등록 페이지");

		String memId=(String)session.getAttribute("memId");
		
		//식당번호 가져오기
		List<Integer> resNoList=restaruntService.selectNoByMemId(memId);
		int resNo=0;
		if(resNoList!=null && !resNoList.isEmpty()) {
			resNo=resNoList.get(0);
		}
		
		List<FoodMenuVO> menuList=foodMenuService.selectMenuListByResNo(resNo);
		
		model.addAttribute("menuList", menuList);
		
		return "restaurantEnterprise/foodWrite";
	}
	
	@RequestMapping(value="/foodWrite.do", method=RequestMethod.POST )
	public String foodWirte(HttpSession session , @ModelAttribute FoodItemVO2 vo2, Model model) {
		logger.info("메뉴 등록 페이지 파라미터 vo={}",vo2);
		
		String[] foodMenuNoarr = vo2.getFoodMenuNo().split(",");
		String[] foodItemNamearr = vo2.getFoodItemName().split(",");
		String[] foodItemDescarr = vo2.getFoodItemDesc().split(",");
		String[] foodItemPricearr = vo2.getFoodItemPrice().split(",");
	
		int cnt = 0;
		for (int i = 0; i < foodMenuNoarr.length; i++) {
			FoodItemVO vo = new FoodItemVO();
			vo.setFoodMenuNo(Integer.parseInt(foodMenuNoarr[i]));
			vo.setFoodItemName(foodItemNamearr[i]);	
			if(i<foodItemDescarr.length) {
				vo.setFoodItemDesc(foodItemDescarr[i]);
			}else {
				vo.setFoodItemDesc("");
			}
			
			
			int resNo = (Integer)session.getAttribute("resNo");
			
			
			vo.setFoodItemPrice(Integer.parseInt(foodItemPricearr[i]));
			
			cnt += foodMenuService.insertFoodMenu(vo);
			logger.info("메뉴 등록 결과, cnt={}",cnt);
		}
		
		String msg = "", url="";
		
		if(cnt==foodMenuNoarr.length) {
			msg="메뉴 등록되었습니다";
			url="/member/myPage.do";
		}else {
			msg= "메뉴 등록 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	
	@RequestMapping(value="/menuDelete.do", method=RequestMethod.GET)
	public String deleteMenu_get(HttpSession session, Model model) {
		logger.info("삭제 페이지");
		
		int memNo = (Integer)session.getAttribute("memNo");
		
		List<FoodItemVO> list = foodMenuService.selectAll(memNo);
		logger.info("삭제할 메뉴 목록, list.size()={}, list+{}", list.size(),list);
		
		model.addAttribute("list", list);
		
		return "restaurantEnterprise/menuDelete";
	}
	
	
	@RequestMapping(value="/menuDelete.do", method=RequestMethod.POST)
	public String deleteMenu_post(@ModelAttribute FoodItemVO vo, Model model) {
		logger.info("삭제처리 파라미터 vo={}", vo);
		
		String msg = "", url="/restaurantEnterprise/menuDelete.do?foodItemNo="+vo.getFoodItemNo();
		
		
		int cnt = foodMenuService.deleteMenu(vo.getFoodItemNo());
		
		if(cnt>0) {
			msg="삭제되었습니다";
			url="/member/myPage.do";
		}else {
			msg="삭제 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	
	@RequestMapping(value="/writeMenu.do", method=RequestMethod.GET)
	public String writeMenu_get() {
		logger.info("메뉴종류 등록 페이지");
		
		return "restaurantEnterprise/writeMenu";
	}
	
	@RequestMapping(value="/writeMenu.do", method=RequestMethod.POST )
	public String writeMenu_post(@RequestParam String[] foodMenuName, @RequestParam String[] foodMenuDesc,
			HttpSession session , Model model) {
		logger.info("메뉴 등록 페이지 파라미터 foodMenuName={}, foodMenuDesc={}", foodMenuName, foodMenuDesc);
		
		String memId=(String)session.getAttribute("memId");
		
		//식당번호 가져오기
		List<Integer> resNoList=restaruntService.selectNoByMemId(memId);
		int resNo=0;
		if(resNoList!=null && !resNoList.isEmpty()) {
			resNo=resNoList.get(0);
		}
		
		List<FoodMenuVO> menuList=new ArrayList<FoodMenuVO>();
		
		String msg="";
		String url="";
		boolean back=false;
		
		for(int i=0; i<foodMenuName.length; i++) {
			String name=foodMenuName[i];
			String desc="";
			if(foodMenuDesc.length>i) {
				desc=foodMenuDesc[i];
			}
			
			if(name==null || name.isEmpty()) {
				msg="종류명을 입력하세요";
				url="";
				back=true;
				break;
			}
			
			FoodMenuVO fVO=new FoodMenuVO();
			fVO.setFoodMenuName(name);
			fVO.setFoodMenuDesc(desc);
			fVO.setResNo(resNo);
			
			menuList.add(fVO);
		}
		
		if(!back) {
			int cnt=foodMenuService.insertMenuList(menuList);
			logger.info("메뉴 입력결과 cnt={}", cnt);
			
			if(cnt>0) {
				msg="입력완료";
				url="/restaurantEnterprise/writeMenu.do";
			}else {
				msg="입력실패";
				url="";
				back=true;
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("back", back);
		
		return "common/message";
		
	}
	
	@RequestMapping("/menuBackUp.do")
	public ModelAndView menuBackUp(HttpSession session) {

		String memId=(String)session.getAttribute("memId");
		
		//식당번호 가져오기
		List<Integer> resNoList=restaruntService.selectNoByMemId(memId);
		int resNo=0;
		if(resNoList!=null && !resNoList.isEmpty()) {
			resNo=resNoList.get(0);
		}
		logger.info("메뉴 백업 파라미터, resNo={}", resNo);
		
		if(resNo==0) {
			return new ModelAndView("/WEB-INF/views/common/message.jsp", "msg", "잘못된 접근입니다");
		}
		
		List<MenuVO> menuList=foodMenuService.selectMenuByResNo(resNo);
		logger.info("메뉴 조회 결과 menuList.size={}", menuList.size());
		
		return new ModelAndView("downloadMenuExelView", "menuList", menuList);
	}
	
	@RequestMapping(value="/menuRestore.do", method=RequestMethod.GET )
	public void restoreMenu_get() {
		logger.info("식당 메뉴 복구 페이지");
	}
	
	@RequestMapping(value="/menuRestore.do", method=RequestMethod.POST )
	public String restoreMenu_post(@RequestParam(defaultValue="N") String isOverwrite, 
	HttpServletRequest request, MultipartRequest multiRequest, Model model) {
		HttpSession session=request.getSession();

		String memId=(String)session.getAttribute("memId");
		
		//식당번호 가져오기
		List<Integer> resNoList=restaruntService.selectNoByMemId(memId);
		int resNo=0;
		if(resNoList!=null && !resNoList.isEmpty()) {
			resNo=resNoList.get(0);
		}
		
		logger.info("식당 메뉴 복구 페이지, 파라미터 isOverwrite={}, resNo={}", isOverwrite, resNo);
		
		String msg="", url="";
		boolean back=false;
		
		if(resNo==0) {
			msg="";
			back=true;
		}else {
			int overWrite=0;
			if(isOverwrite.equals("Y")) {
				overWrite=resNo;
			}
			
			MultipartFile menuFile=null;
			File file=null;
			try {
				menuFile=multiRequest.getFile("menuFile");
				if(!menuFile.isEmpty()) {
					file=new File(menuFile.getOriginalFilename());
				
					menuFile.transferTo(file);
					
				}else {
					msg="파일이 없습니다";
					back=true;
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(!back) {
				List<MenuVO> menuList=new ArrayList<MenuVO>();
				Workbook workbook=null;
				try {
					workbook=WorkbookFactory.create(file);
					
					//
					Map<Integer, List<FoodItemVO>>itemList=new HashMap<Integer, List<FoodItemVO>>();
					
					Sheet itemSheet=workbook.getSheetAt(1);
					int itemRows=itemSheet.getPhysicalNumberOfRows();
					for(int itemRowindex=1; itemRowindex<itemRows; itemRowindex++){
						Row itemRow=itemSheet.getRow(itemRowindex);
						
						if(itemRow!=null) {
							FoodItemVO itemVO=new FoodItemVO();
							Cell itemCell=itemRow.getCell(0);
							int key=0;
								
							if(itemCell!=null) {
								key=(int) itemCell.getNumericCellValue();
							}
							
							itemCell=itemRow.getCell(1);
							String itemName="";
							if(itemCell!=null) {
								itemName=itemCell.getStringCellValue();
							}
							
							itemCell=itemRow.getCell(2);
							String itemDesc="";
							if(itemCell!=null) {
								itemDesc=itemCell.getStringCellValue();
								if(itemDesc==null) {
									itemDesc="";
								}
							}
							
							itemCell=itemRow.getCell(3);
							int itemPrice=0;
							if(itemCell!=null) {
								itemPrice=(int) itemCell.getNumericCellValue();
							}
							
							itemVO.setFoodItemName(itemName);
							itemVO.setFoodItemDesc(itemDesc);
							itemVO.setFoodItemPrice(itemPrice);
							
							
							List<FoodItemVO> voList=null;
							
							if(itemList.containsKey(key)) {
								voList=itemList.get(key);
							}else {
								voList=new ArrayList<FoodItemVO>();
								itemList.put(key, voList);
							}
							
							voList.add(itemVO);
						}
						
					}
					
					Sheet sheet=workbook.getSheetAt(0);
					int rows=sheet.getPhysicalNumberOfRows();
					for(int rowindex=1; rowindex<rows; rowindex++){
						MenuVO mVO = new MenuVO();
						FoodMenuVO fVO = new FoodMenuVO();
						
						Row row=sheet.getRow(rowindex);
						
						Cell cell=row.getCell(0);
						String menuName="";
						if(cell!=null) {
							menuName=cell.getStringCellValue();
						}
						
						cell=row.getCell(1);
						String menuDesc="";
						if(cell!=null) {
							menuDesc=cell.getStringCellValue();
							if(menuDesc==null) {
								menuDesc="";
							}
						}
						
						
						fVO.setFoodMenuName(menuName);
						fVO.setFoodMenuDesc(menuDesc);
						fVO.setResNo(resNo);
						
						mVO.setFoodMenuVO(fVO);
						
						List<FoodItemVO> menuItemList=null;
						
						int menuCode=rowindex+1;
						
						if(itemList.containsKey(menuCode)) {
							menuItemList=itemList.get(menuCode);
						}
						
						if(menuItemList!=null && !menuItemList.isEmpty()) {
							mVO.setFoodItemList(menuItemList);
						}
						
						menuList.add(mVO);
					}
					logger.info("데이터 추출결과, menuList.size={}", menuList.size());
					
					if(menuList!=null && !menuList.isEmpty()) {
						int cnt=foodMenuService.restoreMenu(menuList, overWrite);
						
						if(cnt>0) {
							msg="복원 완료";
							url="/restaurantEnterprise/foodWrite.do";
							back=false;
						}else {
							msg="복원 실패";
							back=true;
						}
						
					}else {
						msg="데이터가 없거나 양식이 잘못되엇습니다";
						back=true;
					}
				} catch (InvalidFormatException e) {
					//e.printStackTrace();
					msg="지원하지 않는 파일형식 입니다";
					back=true;
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				
			}
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("back", back);
		
		return "common/message";
	}
	
	@RequestMapping("/menuList.do")
	public String menuList(HttpSession session, Model model) {

		String memId=(String)session.getAttribute("memId");
		
		//식당번호 가져오기
		List<Integer> resNoList=restaruntService.selectNoByMemId(memId);
		int resNo=0;
		if(resNoList!=null && !resNoList.isEmpty()) {
			resNo=resNoList.get(0);
		}
		logger.info("메뉴 목록 파라미터, resNo={}", resNo);
		
		if(resNo==0) {
			model.addAttribute("msg", "잘못된 접근 입니다");
			model.addAttribute("url", "/index.do");
			
			return "common/message";
		}
		
		List<MenuVO> list=foodMenuService.selectMenuByResNo(resNo);
		
		model.addAttribute("menuList", list);
		
		return "restaurantEnterprise/menuList";
	}
	
}
