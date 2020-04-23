
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
  	<%@include file="/inc/common_header.jsp" %>
  <%@include file="/inc/top_menu.jsp" %>
 	<title>게시판 상세 보기</title>
<script type="text/javascript">
/* 	var fn_frm_submit=function(e){
		e.preventDefault();
		
		var f=document.forms["frm_member"];
		f.action="memberModify.jsp"
		f.submit();
	}
	
	var fn_btn_del_click=function(e){
		e.preventDefault();
		var f=document.forms["frm_member"];
		f.action="memberDelete.jsp"
		f.submit();
	}
	window.onload=function(){
		document.forms["frm_member"].addEventListener("sumit",fn_frm_submit);
		document.getElementById("id_btn_delete").addEventListener("click",fn_btn_del_click);
	} */
	
</script>
  </head>
<body>

<div class="container">
		<div class="col-md-12">
			<div class="left">
				<h1 class="title">게시글 수정</h1>
				<div class="message1">자유롭게 이용하세요.</div>
			</div>
			<form:form action="freeModify.wow" commandName="board" cssClass="form-horizontal">
			<input type="hidden" name="boNum" value="${board.boNum}">
			<form:hidden path="boNum" />
				<div class="form-group">
					<a href="freeList.wow" class="btn btn-info pull-right">게시판 목록</a>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="boTitle">글번호</label>
					<div class="col-sm-7">
						${board.boNum}
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="boTitle">제 목</label>
					<div class="col-sm-7">
					<form:input path="boTitle" cssClass="form-control"/>
					<form:errors path="boTitle" cssClass="text-danger"></form:errors>
					<%-- 	<input class="form-control" id="boTitle" type="text"
							name="boTitle" value="${board.boTitle}" required="required"> --%>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="boWriter">작 성 자</label>
					<div class="col-sm-7">
						<%-- <input class="form-control" id="boWriter" type="text"
							name="boWriter" value="${board.boWriter}" required="required"> --%>
							<form:input path="boWriter" cssClass="form-control"/>
							<form:errors path="boWriter" cssClass="text-danger"></form:errors>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="boPass">패스워드</label>
					<div class="col-sm-7">
<!-- 						<input class="form-control" id="boPass" type="password"
							name="boPass" value="" required="required"><span> 현재의 비밀번호를 입력하세요.</span> -->
							<form:password path="boPass" cssClass="form-control"/>
							<form:errors path="boPass" cssClass="text-danger"></form:errors>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="boCategory">분 류</label>
					<div class="col-sm-7">
						<form:select cssClass="form-control" path="boCategory">
							<option value="">-- 선택하세요--</option>
							<form:options items="${catList}" itemLabel="commNm" itemValue="commCd"  />
						</form:select>
						<form:errors path="boCategory" cssClass="text-danger"></form:errors>
					
					
<%-- 							<select class="form-control" name="boCategory">
							<option value="">-- 선택하세요--</option>
							<c:forEach items="${catList}" var="vo">
								<c:choose>
									<c:when test="${board.boCateName eq vo.commNm}">
										<option value="${vo.commCd}" selected="selected">${vo.commNm}</option>
									</c:when>
									<c:otherwise>
										<option value="${vo.commCd}">${vo.commNm}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select> --%>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="boIp">IP</label>
					<div class="col-sm-7">
							<%=request.getRemoteAddr()%>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="boContent">내 용</label>
					<div class="col-sm-7">
<%-- 						<textarea class="form-control" id="boContent" rows="20"
							name="boContent">${board.boContent}</textarea> --%>
							<form:textarea path="boContent" cssClass="form-control" rows="20"/>
					</div>
				</div>
				<hr>
		<div class="pull-right">
			<button type="submit" onclick="javascript: form.action='freeModify.wow'" class="btn btn-sm btn-info">게시글 수정</button>
			<button type="submit"  onclick="javascript: form.action='freeDelete.wow'" class="btn btn-sm btn-info">게시글 삭제</button>		
		</div>
			</form:form>
		</div>
	</div>
</body>
</html>


