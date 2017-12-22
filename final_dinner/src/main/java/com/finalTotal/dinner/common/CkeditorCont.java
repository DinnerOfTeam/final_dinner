package com.finalTotal.dinner.common;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/ckeditor")
public class CkeditorCont {
	private static final Logger logger=LoggerFactory.getLogger(CkeditorCont.class);
	
	@Autowired
	FileUtil fileUtil;
	
	@RequestMapping("/upload.do")
	public String imageUpload(@RequestParam String CKEditorFuncNum, HttpServletRequest request, Model model) {
		logger.info("ckeditor 업로드 테스트, 파라미터 CKEditorFuncNum={}", CKEditorFuncNum);
		
		String uploadUrl="";
		String msg="업로드 실패";
		try {
			List<Map<String, Object>> fileList
				=fileUtil.fileUploadByKey(request, "upload", FileUtil.CKEDITOR_UPLOAD);
			
			if(fileList!=null && !fileList.isEmpty()) {
				Map<String, Object> dataMap = fileList.get(0);
				uploadUrl=(String)dataMap.get("filename");
				msg="";
			}else {
				msg="파일이 없습니다";
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		logger.info("ckeditor 업로드 결과, uploadUrl={}, msg='{}'", uploadUrl, msg);
		
		model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);
		model.addAttribute("uploadUrl", uploadUrl);
		model.addAttribute("msg", msg);
		
		return "common/ckeditorUpload";
	}
	
}
