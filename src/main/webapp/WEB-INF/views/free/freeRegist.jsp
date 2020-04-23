
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
  
<!DOCTYPE html>
<html lang="ko">
  <head>
  	<%@include file="/inc/common_header.jsp" %>
 	<title>게시판 쓰기</title>
  </head>
<body>
  <%@include file="/inc/top_menu.jsp" %>
	<div class="container">
<%-- 		<jsp:useBean id="free" class="study.free.vo.FreeBoardVO"/>
		<jsp:setProperty property="*" name="free"/> --%>
	
<%-- 	<c:catch var="ex">
	<%
		//중복제한 토큰 확인
 		String p_dup_key=request.getParameter("dup_key");
		String s_dup_key=(String)session.getAttribute("DUP_SUBMIT_PREVENT"); 
		
		//p_dup_key 널이거나 비어있다면 홈으로 리다이렉트
		//s_dup_key 널이거나 p_dup_key 같지 않다면 신규작성요청을 하는 메시지 출력
		// 뒤로가기는 안됨.
		
		 if(p_dup_key==null || p_dup_key.isEmpty()){
			response.sendRedirect(request.getContextPath()+"/");
			return; //메소드에서 빠져나감 서블릿 서비스 메소드에서
		}else{
			if(s_dup_key==null || !s_dup_key.equals(p_dup_key)){ 
				%>
				<div>
					<h3>다시 작성 요망</h3>
					<p>다시 작성해주세요.</p>
				</div>
				<div>
					<a href="freeList.jsp" class="btn btn-sm btn-default">게시판 목록</a>
					<a href="freeForm.jsp" class="btn btn-sm btn-info">글 작성</a>
				</div>
				<%
				return;
			}
		}
	
		IFreeBoardDao booardDao=new FreeBoardDaoOracle();
		free.setBoIp(request.getRemoteAddr());
		int res=booardDao.insertBoard(free);
		request.setAttribute("res",res);
		//res>0 ok
		//else fail
	%>
	<!-- 0보다크면 성공 작으면 실패 trycatch사용-->
	<c:if test="${res>0}">
		<% session.removeAttribute("DUP_SUBMIT_PREVENT"); %>
		<c:redirect url="freeList.jsp">
			<c:param name="msg" value="success" />
		</c:redirect>
	</c:if>
	<c:if test="${res<1}">
			<div>
			<h3>등록 실패</h3>
		</div>
		<div>
			<a href="freeList.jsp" class="btn btn-sm btn-default">게시판 목록</a>
			<a href="#" onclick="history.back">뒤로가기</a>
		</div>
	</c:if>
	</c:catch> --%>
<%-- 	<c:if test="${not empty ex}">
		<div>
			<h3>게시판 등록 도중 오류가 발생했습니다.</h3>
			${ex.message}
		</div>
		<div>
			<a href="freeList.wow" class="btn btn-sm btn-default">게시판 목록</a>
			<a href="#" onclick="history.go(-1)" class="btn btn-sm btn-warning">뒤로가기</a>
		</div>
	</c:if> --%>
	
	</div>
	</body>
</html>