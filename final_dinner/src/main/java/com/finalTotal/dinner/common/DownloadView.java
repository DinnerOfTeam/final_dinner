package com.finalTotal.dinner.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Component
public class DownloadView extends AbstractView{
	private static final Logger logger = LoggerFactory.getLogger(DownloadView.class);
	
	public DownloadView() {
		setContentType("application/octet-stream");
	}
	
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//파일 다운로드 처리
		File file =(File)map.get("downloadFile");
		String originalName =(String)map.get("originalName");
		boolean wrong=false;
		if(map.get("wrongURL")!=null) {
			wrong=(Boolean)map.get("wrongURL");
		}
		
		String msg="";
		boolean error=false;
		if(wrong){
			msg="잘못된 URL입니다.";
			error=true;
		}else if(file==null || !file.exists() || !file.canRead()) {
			msg="파일이 존재하지 않거나 손상되었습니다.";
			error=true;
		}
		
		if(error){
			response.setCharacterEncoding("");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('"+ msg +"');history.back();</script>");
			
			return;
		}
		
		String fName =file.getName();
		logger.info("다운로드할 파일명"+fName);
		
		if(originalName!=null && !originalName.isEmpty()) {
			fName=originalName;
		}
		
		String fileName = new String(fName.getBytes("euc-kr"), "8859_1");
		
		response.setContentType(getContentType());
		response.setHeader("Content-disposition", "attachment;filename="+fileName);
		
		OutputStream os=response.getOutputStream();
		FileInputStream fis=null;
		
		try {
			fis=new FileInputStream(file);
			FileCopyUtils.copy(fis, os);
			//=>FileCopyUtils.copy(InputStream in, OutputStream out)
		}finally {
			fis.close();
		}
		
		
	}
	
}
