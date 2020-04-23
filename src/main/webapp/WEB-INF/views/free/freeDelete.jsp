
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
  
<!DOCTYPE html>
<html lang="ko">
  <head>
  	<%@include file="/inc/common_header.jsp" %>
 	<title>회원가입</title>
  </head>
<body>
  <%@include file="/inc/top_menu.jsp" %>
	<div class="container">

<%-- 	
	<c:catch var="ex">

	<!-- 0보다크면 성공 작으면 실패 trycatch사용-->
	<c:if test="${res>0}">
		<c:redirect url="freeList.jsp">
			<c:param name="msg" value="success" />
		</c:redirect>
	</c:if>
	<c:if test="${res<1}">
			<div>
			<h3>삭제 실패</h3>
		</div>
		<div>
			<a href="freeList.jsp" class="btn btn-sm btn-default">게시판 목록</a>
			<a href="#" onclick="history.go(-1)">뒤로가기</a>
		</div>
	</c:if>
	</c:catch>
	<c:if test="${not empty ex}">
		<div>
			<h3>게시판 등록 도중 오류가 발생했습니다.</h3>
			${ex.message}
		</div>
		<div>
			<a href="freeList.jsp" class="btn btn-sm btn-default">게시판 목록</a>
			<a href="#" onclick="history.go(-1)" class="btn btn-sm btn-warning">뒤로가기</a>
		</div>
	</c:if> --%>
	
	</div>
	</body>
</html>