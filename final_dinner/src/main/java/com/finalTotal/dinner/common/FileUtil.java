package com.finalTotal.dinner.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUtil {
	public static final Logger Logger
		=LoggerFactory.getLogger(FileUtil.class);
	
	//파일업로드 경로 관련 함수
	public static final int FILE_UPLOAD=1;	//자료실 업로드인 경우
	public static final int IMAGE_UPLOAD=2;	//상품등록시 이미지 업로드인 경우
	
	@Resource(name="fileUploadProperties")
	private Properties fileProperties;
	
	/*public Map<String, List<Map<String, Object>>> fileUpload(HttpServletRequest request, int uploadGb) throws IllegalStateException, IOException {
		//파일 업로드 처리
		MultipartHttpServletRequest multipartRequest
			=(MultipartHttpServletRequest) request;
		
		Map<String, MultipartFile> fileMap=multipartRequest.getFileMap();
		
		Map<String, List<Map<String, Object>>> resultMap=new HashMap<String, List<Map<String, Object>>>();
		
		Iterator<String> iter=fileMap.keySet().iterator();
		while(iter.hasNext()) {
			String key=iter.next();
			
			List<Map<String, Object>> tempList=fileUploadByKey(request, key , uploadGb);
			Logger.info("key={}, tempList.size()={}", key, tempList.size());
			
			resultMap.put(key, tempList);
		}
		
		return resultMap;
	}*/
	
	public List<Map<String, Object>> fileupload(HttpServletRequest request,
			int uploadGb) 
			throws IllegalStateException, IOException {
		//파일업로드 처리
		MultipartHttpServletRequest multipartRequest 
			= (MultipartHttpServletRequest) request;
		
		Map<String, MultipartFile> fileMap
			=multipartRequest.getFileMap();
		
		//file정보 결과를 저장할 list
		List<Map<String, Object>> list
			=new ArrayList<Map<String,Object>>();
		
		Iterator<String> iter = fileMap.keySet().iterator();
		while(iter.hasNext()) {
			String key =iter.next();
			MultipartFile tempFile =fileMap.get(key);
			//=> 업로드된 파일을 임시파일 형태로 제공

			//업로드 된경우
			if(!tempFile.isEmpty()) {
				String ofileName=tempFile.getOriginalFilename();
				//unique한 파일명 구하기
				String fileName=getUniqueFileName(ofileName);
				
				long fileSize=tempFile.getSize();
				
				//업로드 처리
				String uploadPath= getUploadPath(request, uploadGb);
				
				File file = new File(uploadPath, fileName);
				tempFile.transferTo(file);

				//결과 저장
				Map<String, Object> resultMap
				= new HashMap<String, Object>();
				resultMap.put("originalFilename", ofileName);
				resultMap.put("filename", fileName);
				resultMap.put("fileSize", fileSize);
				
				list.add(resultMap);
			}
		}//while		
		
		return list;
	}
	
	public List<Map<String, Object>> fileUploadByKey(HttpServletRequest request, String key , int uploadGb) throws IllegalStateException, IOException {
		//파일 업로드 처리
		MultipartHttpServletRequest multipartRequest
			=(MultipartHttpServletRequest) request;
		
		List<MultipartFile> fileList
			=multipartRequest.getFiles(key);
		
		List<Map<String, Object>> list
			=new ArrayList<Map<String, Object>>();
		
		for(MultipartFile tempFile : fileList) {
			
			//업로드 된경우
			if(!tempFile.isEmpty()) {
				String ofileName=tempFile.getOriginalFilename();
				//unique한 파일명 구하기
				String fileName=getUniqueFileName(ofileName);
				
				long fileSize=tempFile.getSize();
				
				
				
				//업로드 처리
				String uploadPath= getUploadPath(request, uploadGb);
				
				File file = new File(uploadPath, fileName);
				tempFile.transferTo(file);
				
				//결과저장
				Map<String, Object> resultMap = new HashMap<String, Object>();
				resultMap.put("originalFilename", ofileName);
				resultMap.put("filename", fileName);
				resultMap.put("fileSize", fileSize);
				
				list.add(resultMap);
			}
		}//while
		
		return list;
	}

	public String getUploadPath(HttpServletRequest request, int uploadGb) {
		String upPath="";
		
		String type=fileProperties.getProperty("file.upload.type");
		if(type.equals("test")) {
			//테스트시 경로
			if(uploadGb==FILE_UPLOAD) {
				upPath=fileProperties.getProperty("file.upload.path.test");
			}else if(uploadGb==IMAGE_UPLOAD) {
				upPath=fileProperties.getProperty("imageFile.upload.path.test");
			}
			Logger.info("test경로:"+ upPath);
		}else {
			//배포시 경로
			if(uploadGb==FILE_UPLOAD) {
				upPath=fileProperties.getProperty("file.upload.path");
			}else if(uploadGb==IMAGE_UPLOAD) {
				upPath=fileProperties.getProperty("imageFile.upload.path");
			}
			Logger.info("배포시경로:"+ upPath);
			
			//실제 물리적인 경로 구하기
			upPath
			=request.getSession().getServletContext().getRealPath(upPath);
			Logger.info("배포시 실제 물리적 경로:"+ upPath);
		}
		
		return upPath;
	}

	private String getUniqueFileName(String ofileName) {
		//test.txt => test20171204054830123.txt
		int idx = ofileName.lastIndexOf(".");
		String fName = ofileName.substring(0, idx);	//test
		String ext = ofileName.substring(idx);	//.txt
		
		String fileName = fName+getCurrentTime()+ext;
		Logger.info("변경된 파일 이름:"+ fileName);
		
		return fileName;
	}
	
	private String getCurrentTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssSSS");
		
		Date d = new Date();
		
		return sdf.format(d);
	}
}
