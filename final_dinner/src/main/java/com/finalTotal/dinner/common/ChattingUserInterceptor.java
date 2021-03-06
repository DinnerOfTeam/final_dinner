package com.finalTotal.dinner.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.finalTotal.dinner.chat.model.ChattingService;
import com.finalTotal.dinner.indiGroup.model.IndiGroupService;

@Component
public class ChattingUserInterceptor implements HandlerInterceptor {
/*	@Autowired
	private ChattingService chat_service;*/
	@Autowired
	private IndiGroupService group_service;

	public static final Logger log= LoggerFactory.getLogger(ChattingUserInterceptor.class);
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		String uri= request.getRequestURI();
		if(uri.indexOf("/chat/")== -1) {
			if(request.getSession().getAttribute("memNo")!= null) {
				int memNo= (Integer)request.getSession().getAttribute("memNo");
				group_service.updateUserNone(memNo);
				log.info("채팅 접속 off");
			}
		}
		
		return true;
	}

}
