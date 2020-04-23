
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
  <head>
  	<%@include file="/inc/common_header.jsp" %>
  <%@include file="/inc/top_menu.jsp" %>
 	<title>회원 상세 보기</title>
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
<h3>회원 상세 보기</h3>
<form name="formName" action="memberModify.wow" method="post">
<input type="hidden" name="memId" value="${mem.memId}">
<table class="table table-striped table-bordered">
	<colgroup>
		<col width="15%" />
		<col width="35%" />
		<col width="15%" />
		<col />
	</colgroup>
	<tr>
		<th>ID</th>
		<td>${mem.memId}</td>
		<th>회원명</th>
		<td><input type="text" name="memName" value="${mem.memName}" required="required"></td>
	</tr>
	<tr>
		<th>패스워드</th>
		<td colspan="3"><input type="password" name="memPass" value="" required="required"><span> 현재의 비밀번호를 입력하세요.</span></td>
	</tr>
	<tr>
		<th>주민번호</th>
		<td colspan="3">
			<input type="text" name="memRegno1" value="${mem.memRegno1}" placeholder="주민번호 앞 6자리">
			-
			<input type="password" name="memRegno2" value="${mem.memRegno2}" placeholder="주민번호 뒤 7자리">
		</td>
	</tr>
	<tr>
		<th>생일</th>
		<td colspan="3"><input type="date" name="memBir" value="${mem.memBir}" placeholder="생일입력" required="required"></td>
	</tr>
	<tr>
		<th>우편번호</th>
		<td colspan="3"><input type="text" name="memZip" value="${mem.memZip}" placeholder="우편번호입력"></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="memAdd1" value="${mem.memAdd1}"  placeholder="기본주소 입력"> <br> 
			<input type="text" name="memAdd2" value="${mem.memAdd2}" placeholder="상세주소 입력">
		</td>
	</tr>
	<tr>
		<th>핸드폰</th>
		<td><input type="text" name="memHp" value="${mem.memHp}" required="required"></td>
		<th>메일</th>
		<td><input type="email" name="memMail" value="${mem.memMail}"></td>
	</tr>	
	<tr>
		<th>직업</th>
		<td>
			<select name="memJob">
				<option value="">직업을 선택하세요</option>
 					<c:forEach items="${jobs}" var="jb">
 					<c:choose>
 					<c:when test="${mem.memJob eq jb.commCd}">
						<option value="${jb.commCd}" selected="selected">${jb.commNm}</option>	
 					</c:when>
 					<c:otherwise> 					
						<option value="${jb.commCd}" >${jb.commNm}</option>	
 					</c:otherwise>
 					</c:choose>

					</c:forEach> 
				
			</select>
		</td>
		<th>취미</th>
		<td>
			<select name="memLike">
				<option value="" >취미를 선택하세요</option>
					<c:forEach items="${hobbys}" var="lk" >
					<c:choose>
					 	<c:when test="${mem.memLike eq lk.commCd}">
							<option value="${lk.commCd}" selected="selected">${lk.commNm}</option>
						</c:when>
						<c:otherwise>
							<option value="${lk.commCd}" >${lk.commNm}</option>	
						</c:otherwise>
					</c:choose>
					</c:forEach> 
			</select>
		</td>
	</tr>	
	<tr>
		<td colspan="4">
		<a href="memberList.wow" class="btn btn-sm btn-default">회원 목록</a>
		<div class="pull-right">
			<button type="submit" onclick="javascript: formName.action='memberModify.wow'" class="btn btn-sm btn-info">정보수정</button>
			<button type="submit"  onclick="javascript: formName.action='memberDelete.wow'" class="btn btn-sm btn-info">회원탈퇴</button>		
		</div>
			</td>
	</tr>	
</table>
</form>
</div>
</body>
</html>


