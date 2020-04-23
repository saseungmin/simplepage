package com.study.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.study.common.vo.ResultMessageVO;

// Tomcat 9.X  : java 8로 컴파일 interface 내부적으로 default 처리했음, 
               //  필요한 메서드만 오버라이드 하면 됨                  
// Tomcat 8.X  : java 7로 컴파일 interface 모든 메서드 구현해야 합니다. 

public class IpCheckFilter implements Filter {
	
	// 본 인 : 192.168.20.51 , 0:0:0:0:0:0:0:1, 127.0.0.1	
	// 짝꿍1 : 192.168.20.62
	// 짝꿍2 : 192.168.20.29
	// 짝꿍3 : 192.168.20.31
	
	private Map<String, String> accessMap = null; 
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	  // "A"ccess , "D"enied 
		accessMap = new HashMap<String, String>();
		accessMap.put("192.168.20.51", "A");
		accessMap.put("0:0:0:0:0:0:0:1", "A");
		accessMap.put("127.0.0.1",  "A");  
		accessMap.put("192.168.20.31", "D");
		accessMap.put("192.168.20.29", "D");
		accessMap.put("192.168.20.62", "D");  
	}
	
	@Override
	public void destroy() {
		accessMap = null;
	}

	/* 문제 : doFileter 를 오버라이드 하여 
	   유형 [A] : 자원에 접근 처리 
	        [D] : 다음과 같은 메시지 처리
	              title: 접근 거부 
	              message : 해당 IP : 192.168.20.d는 거부된 아이피입니다.
	                        문의사항이 있는 경우 042-719-8850으로 연락주세요 
	        [존재하지 않는 경우]
	             : 무조건 "/" 로 리다이렉트   
	 */       
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		System.out.printf("LoginCheckFilter = URI : %s IP : %s \n", req.getRequestURI(),req.getRemoteAddr());
		String addr=req.getRemoteAddr();
		System.out.println(accessMap.get(addr));
		if(accessMap.get(addr).equals("D")) {

				ResultMessageVO message =new ResultMessageVO();
				message.setResult(true).setTitle("접근 거부").setMessage("해당 IP : "+addr+"는 거부된 아이피입니다.").setUrl("/").setUrlTitle("메인으로");
				req.setAttribute("resultMessage", message);
				RequestDispatcher dispatcher=req.getRequestDispatcher("/WEB-INF/views/common/message.jsp");
				dispatcher.forward(request, response);
		}else if(accessMap.get(addr).equals("A")){
				chain.doFilter(request, response);
				
			}else {
				
				RequestDispatcher dispatcher=req.getRequestDispatcher(req.getRequestURI()+"/");
				dispatcher.forward(request, response);
			}
		
		}
	
	              	
}