package com.study.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


public class LoginCheckFilter implements Filter {
	
	private List<String> excludeList;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	
		Filter.super.init(filterConfig);
		
		excludeList =new ArrayList<String>();
		excludeList.add("/login/login.wow");
		excludeList.add("/login/logout.wow");
		excludeList.add("/login/loginCheck.wow");
	}
	
	@Override
	public void destroy() {
		excludeList=null;
	}

	//Tomcat 8.x : java 7 컴파일
	//Tomcat 9.x : java 8 컴파일, interface에 init(), destroy() default로 구현
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		HttpSession session=req.getSession(false); //세션이 없으면 그냥  null 리턴 
		
		String uri=req.getRequestURI();
		uri=uri.substring(req.getContextPath().length());
		
		System.out.printf("LoginCheckFilter = URI : %s IP : %s \n", req.getRequestURI(),req.getRemoteAddr());
		if(excludeList.contains(uri)) {
			chain.doFilter(request, response);
			return;
		}
		
		boolean login=false;
		if(session !=null) {
			if(session.getAttribute("USER_INFO")!=null){
				login=true;
			}
		}
		
		
		if(login) {
			chain.doFilter(request, response);
		}else {
			//리다이렉트(클라이언트가 이동)
			//포워드(서버 내부에서 이동)
			RequestDispatcher dispatcher=req.getRequestDispatcher("/login/login.wow");
			dispatcher.forward(request, response);
		}
		
	}

}
