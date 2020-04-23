package com.study.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LoggingFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
			//전처리 부분 (실제 요청에 대한 작업 이전)
			HttpServletRequest req=(HttpServletRequest)request;
			String uri=req.getRequestURI();
			long startTime=System.currentTimeMillis();
			System.out.println("------------------------------------------");
			System.out.printf("요청시작 : %s \n",uri);
		
		
			// 다음 자원으로 넘김(필터,서블릿)
			chain.doFilter(request, response); 
			
			//후처리 (실제 요청에 대한 작업 이후)
			
			System.out.printf("요청 끝 : %s Excute Time : %d\n",uri,(System.currentTimeMillis()-startTime));
			System.out.println("------------------------------------------");
	}

}
