package com.finalTotal.dinner.common;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.finalTotal.dinner.member.model.MemberVO;

@Component
public class AdminLoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri= request.getRequestURI();
		if(uri.indexOf("admin/login/log")== -1|| uri.indexOf("Ares2.do")!= -1) {
			MemberVO vo= (MemberVO)request.getSession().getAttribute("admin_login");
			if(vo== null|| vo.getMemId().isEmpty()) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out= response.getWriter();
				out.println("<script type='text/javascript'>alert('관리자 로그인이 필요합니다');");
				out.println("location.href='"+ request.getContextPath()+ "/admin/login/login.do';</script>");
				
				return false;
			}
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
