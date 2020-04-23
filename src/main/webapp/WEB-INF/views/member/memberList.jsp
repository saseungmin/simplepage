
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
  <head>
  <%@include file="/inc/common_header.jsp" %>
 	<title>회원목록</title>
 	 	<script type="text/javascript">
 		function fn_goPage() {
 			console.log("fn_goPage call...",this.dataset.page);
			var f= document.forms["frm_search"];
			f.curpage.value=this.dataset.page;
			f.submit();
		}
 		function fn_frm_search_submit() {
			var f=document.forms["frm_search"];
			f.curpage.value=1;
 			console.log("fn_frm_search_submit call...",f.curpage.value);
			f.submit();

		}
 		function fn_recordCountPerPage_change() {
			var f=document.forms["frm_search"];
			f.curpage.value=1;
			f.recordCountPerPage.value=this.value;
			console.log("fn_recordCountPerPage_change call...","curpage",f.curpage.value,"recordCountPerPage",f.recordCountPerPage.value);
			f.submit();
		}
 		window.onload=function(){
 			document.forms["frm_search"].addEventListener("submit",fn_frm_search_submit);
 			document.getElementById("id_recordCountPerPage").addEventListener("change", fn_recordCountPerPage_change);
 			document.querySelectorAll(".pagination li a").forEach(obj => { obj.addEventListener("click", fn_goPage); });
 		}
 	
 	</script>
  </head>
<body>
  <%@include file="/inc/top_menu.jsp" %>
<div class="container">
<div class="row">
	<h3>회원 목록</h3>
</div>
<div class="row">
	<a href="memberForm.wow" class="btn btn-primary btn-sm" >
		<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
		회원가입
	</a>
</div>
<%-- <%
	IMemberDao memberDao=new MemberDaoOracle();
	int rowCount=memberDao.getMemberCount(searchVO);
	searchVO.setTotalRowCount(rowCount);
	searchVO.setting();
	
	List<MemberVO> list=memberDao.getMemberList(searchVO);
	request.setAttribute("list",list);
	
	ICommonCodeDao codeDao = new CommonCodeOracle();
	List<CodeVO> a = codeDao.getCodeListByParent("JB00");
	request.setAttribute("jobs", a);

	request.setAttribute("list",list);
%> --%>


<div class="container">

<div class="row">
</div>
	<div class="panel panel-default">
		<div class="panel-body">
	  	<form name="frm_search" action="memberList.wow" method="post" class="form-horizontal">
	  			<input type="hidden" name="curpage" value="${searchVO.curpage}">
	  			<input type="hidden" name="recordCountPerPage" value="${searchVO.recordCountPerPage}">
			  <div class="form-group">
			    <label for="id_searchType" class="col-sm-2 control-label">검색</label>
			    <div class="col-sm-2">
			    	<select id="id_searchType" name="searchType" class="form-control input-sm">
								<option value="I" ${ searchVO.searchType eq 'I' ? 'selected="selected"':""} >ID</option>
				    		<option value="N" ${ searchVO.searchType eq 'N' ? 'selected="selected"':""} >회원명</option>
				    		<option value="A" ${ searchVO.searchType eq 'A' ? 'selected="selected"':""} >주소</option>
			    	</select>
			    </div>
					<div class="col-sm-2">	
			      <input type="text" name="searchWord" class="form-control input-sm" value="${searchVO.searchWord}" placeholder="검색어" >			      
			    </div>
			    <label for="id_searchJob" class="col-sm-2 col-sm-offset-2 control-label">분류</label>
			    <div class="col-sm-2">
			    	<select id="id_searchJob" name="searchJob" class="form-control input-sm">
				    	<option value="">-- 전체 --</option>
							<c:forEach items="${jobs}" var="vo">
								<option value="${vo.commNm}" ${vo.commNm eq searchVO.searchJob ? 'selected="selected"' : '' } >${vo.commNm}</option>		
							</c:forEach>
			    	</select>
			    </div>
			  </div>
			  <div class="form-group">
			  	<div class="col-sm-2 col-sm-offset-10" >
			  		<button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-search"></i>&nbsp;검색</button>
			  	</div>
			  </div>
			 </form>
			</div>
	</div>
	<div class="row">
	<div class="col-sm-3 form-inline" style="margin-bottom:5px;">
		전체 ${searchVO.totalRowCount} 건
		<select id="id_recordCountPerPage" name="recordCountPerPage" class="form-control input-sm">
			<option value="10" ${ searchVO.recordCountPerPage eq 10 ? 'selected="selected"':""}>10</option>
			<option value="20" ${ searchVO.recordCountPerPage eq 20 ? 'selected="selected"':""}>20</option>
			<option value="30" ${ searchVO.recordCountPerPage eq 30 ? 'selected="selected"':""}>30</option>
			<option value="50" ${ searchVO.recordCountPerPage eq 50 ? 'selected="selected"':""}>50</option>
		</select>
	</div>
	</div>


<table class="table table-striped table-hover table-bordered">
	<colgroup>
		<col width="5%" />
		<col width="10%" />
		<col width="15%" />
		<col />
		<col width="20%" />
		<col width="10%" />
	</colgroup>
	<tr>
		<th>Number</th>
		<th>ID</th>
		<th>이름</th>
		<th>주소</th>
		<th>취미</th>
		<th>직업</th>
		<th>마일리지</th>
	</tr>
	<c:forEach items="${list}" var="vo" varStatus="st">
		<tr>
			<td>${st.count} </td>
			<td><a href="memberView.wow?memId=${vo.memId}">${vo.memId}</a></td>
			<td>${vo.memName}</td>
			<td>${vo.memAdd1} ${vo.memAdd2}</td>
			<td>${vo.memLikeNm}</td>
			<td>${vo.memJobNm}</td>
			<td>${vo.memMileage}</td>
		</tr>
	</c:forEach>
	</table>
	
		<div class="text-center">
		<nav>
			<ul class="pagination">
				<c:if test="${searchVO.firstPage>1}">
					<li><a aria-label="Previous" href="#" data-page="${searchVO.firstPage-1}"><span aria-hidden="true">&laquo;</span></a>
				</c:if>
				<c:forEach var="i" begin="${searchVO.firstPage}" end="${searchVO.lastPage}">
					<c:if test="${searchVO.curpage eq i}">
					 <li class="active"><a href="#" data-page="${i}">${i}</a> 
					<%-- <li class="active"><a href="freeList.jsp?curpage=${i}&searchWord=${searchVO.searchWord}&searchType=${searchVO.searchWord}">${i}</a> --%>
					</c:if>
					<c:if test="${searchVO.curpage ne i}">
						<li><a href="#" data-page="${i}">${i}</a> 
					</c:if>
				</c:forEach>
				<c:if test="${searchVO.lastPage<searchVO.totalPageCount}">
					<li><a aria-label="Next" href="#" data-page="${searchVO.lastPage+1}"><span aria-hidden="true">&raquo;</span></a>
				</c:if>
			</ul>
		</nav>
		</div>
		
</div>
</div>
</body>
</html>





