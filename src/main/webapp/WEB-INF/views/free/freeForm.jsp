
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/inc/common_header.jsp"%>
<%@include file="/inc/top_menu.jsp"%>

<title>게시판 등록</title>
</head>

	<div class="container">
		<div class="col-md-12">
			<div class="left">
				<h1 class="title">게시글 등록</h1>
				<div class="message1">자유롭게 이용하세요.</div>
			</div>
			<form:form action="freeRegist.wow" commandName="board" cssClass="form-horizontal">
 			<input type="hidden" name="dup_key" value="${dup_key}"> 
				<div class="form-group">
					<a href="freeList.wow" class="btn btn-info pull-right">게시판 목록</a>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="boTitle">제 목</label>
					<div class="col-sm-7">
					<form:input path="boTitle" cssClass="form-control"/>
					<form:errors path="boTitle" cssClass="text-danger"></form:errors>
<!-- 						<input class="form-control" id="boTitle" type="text"
							name="boTitle" value="" required="required">  -->
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="boWriter">작 성 자</label>
					<div class="col-sm-7">
					<form:input path="boWriter" cssClass="form-control"/>
					<form:errors path="boWriter" cssClass="text-danger"></form:errors>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="boPass">패스워드</label>
					<div class="col-sm-7">
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
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="boIp">IP</label>
					<div class="col-sm-7" id="boIp">
							<%=request.getRemoteAddr()%>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="boContent">내 용</label>
					<div class="col-sm-7">
						<form:textarea path="boContent" cssClass="form-control" rows="20"/>
					</div>
				</div>
				<hr>
				<div class="pull-right">
					<button type="submit" class="btn btn-success">등 록</button>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>
	<%-- <div class="container">
<h3>회원 상세 보기</h3>

<table class="table table-striped table-bordered">
	<colgroup>
		<col width="15%" />
		<col width="35%" />
		<col width="15%" />
		<col />
	</colgroup>
	<tr>
		<th>글번호</th>
		<td>${board.boNum}</td>
		<th>제목</th>
		<td>${board.boTitle}</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td colspan="3">${board.boWriter}</td>
	</tr>
	<tr>
		<th>분류</th>
		<td colspan="3">
			${board.boCateName}
		</td>
	</tr>
	<tr>
		<th>ip</th>
		<td colspan="3">${board.boIp}</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td colspan="3">${board.boHit}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${board.boContent}
		</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${board.boRegDate}</td>
	</tr>	
	<tr>
		<th>수정일</th>
		<td>${board.boModDate}</td>

	</tr>	
	<tr>
		<td colspan="4">
		<div class="pull-left">
					<a href="memberList.jsp" class="btn btn-info pull-right">회원 목록</a>
		</div>
		</td>		
	</tr>	
</table>
</div> --%>
