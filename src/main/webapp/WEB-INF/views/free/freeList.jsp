

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
  <head>
  <%@include file="/inc/common_header.jsp" %>
 	<title>게시판 목록</title>
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
 		
 		$(document).ready(function(){
 			$("#id_check_all").change(function(){
 				var chk=$(this).prop("checked");
 				$("input[type='checkbox'][name=boNums]").prop("checked",chk);
 			});
 			//삭제버튼 클릭
 			$("#btn_checked_delete").click(function(e){
 				e.preventDefault();
 				var f=document.forms.frm_free_list;
 				f.action="removeCheckedBoard.wow";
 				f.submit();
 			});
 		});
 	</script>
  </head>
<body>
  <%@include file="/inc/top_menu.jsp" %>
  <!-- 페이징, 검색 파라미터 -->
<div class="container">
<div class="row">
	<h3>자유 게시판</h3>
</div>
	<div class="panel panel-default">
		<div class="panel-body">
	  	<form name="frm_search" action="freeList.wow" method="post" class="form-horizontal">
	  			<input type="hidden" name="curpage" value="${searchVO.curpage}">
	  			<input type="hidden" name="recordCountPerPage" value="${searchVO.recordCountPerPage}">
			  <div class="form-group">
			    <label for="id_searchType" class="col-sm-2 control-label">검색</label>
			    <div class="col-sm-2">
			    	<select id="id_searchType" name="searchType" class="form-control input-sm">
								<option value="T" ${ searchVO.searchType eq 'T' ? 'selected="selected"':""} >제목</option>
				    		<option value="W" ${ searchVO.searchType eq 'W' ? 'selected="selected"':""} >작성자</option>
				    		<option value="C" ${ searchVO.searchType eq 'C' ? 'selected="selected"':""} >내용</option>
			    	</select>
			    </div>
					<div class="col-sm-2">	
			      <input type="text" name="searchWord" class="form-control input-sm" value="${searchVO.searchWord}" placeholder="검색어" >			      
			    </div>
			    <label for="id_searchCategory" class="col-sm-2 col-sm-offset-2 control-label">분류</label>
			    <div class="col-sm-2">
			    	<select id="id_searchCategory" name="searchCategory" class="form-control input-sm">
				    	<option value="">-- 전체 --</option>
							<c:forEach items="${catList}" var="vo">
								<option value="${vo.commCd}" ${vo.commCd eq searchVO.searchCategory ? 'selected="selected"' : '' } >${vo.commNm}</option>		
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
	<div class="col-sm-3 form-inline" style="margin-bottom:5px;">
		전체 ${searchVO.totalRowCount} 건
		<select id="id_recordCountPerPage" name="recordCountPerPage" class="form-control input-sm">
			<option value="10" ${ searchVO.recordCountPerPage eq 10 ? 'selected="selected"':""}>10</option>
			<option value="20" ${ searchVO.recordCountPerPage eq 20 ? 'selected="selected"':""}>20</option>
			<option value="30" ${ searchVO.recordCountPerPage eq 30 ? 'selected="selected"':""}>30</option>
			<option value="50" ${ searchVO.recordCountPerPage eq 50 ? 'selected="selected"':""}>50</option>
		</select>
	</div>
	<div class="pull-right">
	<button id="btn_checked_delete" type="button" class="btn btn-sm btn-danger" style="margin-left: 5px;">
	<i class="fa fa-trash fa-lg" aria-hidden="true" title="선택글 삭제"></i>&nbsp;삭제
	</button>
	</div>
<div class="pull-right">
	<a href="freeForm.wow" class="btn btn-success btn-sm" >
		<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>글쓰기</a>
</div>
<form name="frm_free_list" action="">
<table class="table table-striped table-hover table-bordered">
	<colgroup>
		<col width="3%" />
		<col width="10%" />
		<col width="10%" />
		<col width="30%" />
		<col />
		<col width="20%" />
		<col width="10%" />
	</colgroup>
	<tr>
	<th><input type="checkbox" id="id_check_all"/></th>
		<th>글번호</th>
		<th>분류</th>
		<th>제목</th>
		<th>작성자</th>
		<th>등록일</th>
		<th>조회수</th>
	</tr>
	<c:forEach items="${list}" var="vo">
		<tr class="text-center">
		<td><input type="checkbox" name="boNums" value="${vo.boNum}" /></td>
			<td>${vo.boNum} </td>
			<td>${vo.boCateName}</td>
			<td class="text-left"><a href="freeView.wow?boNum=${vo.boNum}">${vo.boTitle}</a></td>
			<td>${vo.boWriter}</td>
			<td>${vo.boRegDate}</td>
			<td>${vo.boHit}</td>
		</tr>
	</c:forEach>
	</table>
	</form>
	<div class="text-center">
		<nav>
			<ul class="pagination">
				<c:if test="${searchVO.firstPage>1}">
					<li><a aria-label="Previous" href="#" data-page="${searchVO.firstPage-1}"><span aria-hidden="true">&laquo;</span></a>
				</c:if>
				<c:forEach var="i" begin="${searchVO.firstPage}" end="${searchVO.lastPage}">
					<c:if test="${searchVO.curpage eq i}">
					 <li class="active"><a href="#" data-page="${i}">${i}</a> 
					<%-- <li class="active"><a href="freeList.wow?curpage=${i}&searchWord=${searchVO.searchWord}&searchType=${searchVO.searchWord}">${i}</a> --%>
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
</body>
</html>





