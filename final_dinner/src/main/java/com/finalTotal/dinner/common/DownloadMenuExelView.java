package com.finalTotal.dinner.common;

import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

import com.finalTotal.dinner.food.model.FoodItemVO;
import com.finalTotal.dinner.food.model.FoodMenuVO;
import com.finalTotal.dinner.food.model.MenuVO;

@Component
public class DownloadMenuExelView extends AbstractView{
	private static final Logger logger = LoggerFactory.getLogger(DownloadMenuExelView.class);
	
	public DownloadMenuExelView() {
		setContentType("application/octet-stream");
	}
	
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//엑셀 파일 생성후 다운로드
		
		List<MenuVO> menuList=(List)map.get("menuList");
		
		//엑셀 생성
		
		//WorkBook 생성
		XSSFWorkbook workBook=new XSSFWorkbook();
		
		//시트 생성
		XSSFSheet menuSheet=workBook.createSheet("메뉴종류");
		XSSFSheet itemSheet=workBook.createSheet("메뉴");
		
		//행
		XSSFRow row=null;
		
		//열
		XSSFCell cell=null;
		
		int k=0;
		for(int i=0; i<menuList.size(); i++) {
			//메뉴종류 저장
			MenuVO menuVO=menuList.get(i);
			
			FoodMenuVO fVO=menuVO.getFoodMenuVO();
			row=menuSheet.createRow(i);
			cell=row.createCell(0);
			cell.setCellValue(fVO.getFoodMenuName());	//메뉴종류 이름
			
			String menuDesc=fVO.getFoodMenuDesc();
			if(menuDesc==null || menuDesc.isEmpty()) {
				menuDesc="";
			}
			
			cell=row.createCell(1);
			cell.setCellValue(menuDesc);	//메뉴종류 설명
			
			//메뉴 저장
			List<FoodItemVO> itemList=menuVO.getFoodItemList();
			
			for(int j=0; j<itemList.size(); j++) {
				FoodItemVO foodItem=itemList.get(j);
				String iName = foodItem.getFoodItemName();
				String iDesc = foodItem.getFoodItemDesc();
				int iPrice = foodItem.getFoodItemPrice();
				
				if(iDesc==null || iDesc.isEmpty()) {
					iDesc="";
				}
				
				row=itemSheet.createRow(k);
				k++;
				
				cell=row.createCell(0);
				cell.setCellValue((i+1));	//메뉴종류와 연결용
				
				cell=row.createCell(1);
				cell.setCellValue(iName);	//메뉴 이름
				
				cell=row.createCell(2);
				cell.setCellValue(iDesc);	//메뉴 설명
				
				cell=row.createCell(3);
				cell.setCellValue(iPrice);	//메뉴 가격
				
			}
			
		}
		
		//시험용(다운로드 대신)
		FileOutputStream fileoutputstream=new FileOutputStream("D:\\lecture\\test.xlsx");
		workBook.write(fileoutputstream);
		
		fileoutputstream.close();
		workBook.close();
	}
	
}
