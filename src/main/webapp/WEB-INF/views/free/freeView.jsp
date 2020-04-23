
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    <%request.setCharacterEncoding("utf-8"); %>
  
<!DOCTYPE html>
<html lang="ko">
  <head>
  	<%@include file="/inc/common_header.jsp" %>
  	  <%@include file="/inc/top_menu.jsp" %>
  	
  	<title>게시판</title>
  </head>
<body>
<%-- <%
	String bonum =request.getParameter("boNum");
	int bonumber=Integer.parseInt(bonum);
	IFreeBoardDao freeDao = new FreeBoardDaoOracle();
	FreeBoardVO board = freeDao.getBoard(bonumber);
	if(board!=null){
		// 현재 글을 읽지 않았다면 조회수 증가
		CookieBox box=new CookieBox(request);
		String readBoard=box.getValue("free"); //23|2|1|
		if(readBoard==null)readBoard="";
		String pat="\\b"+bonumber+"\\b";
		if(! Pattern.compile(pat).matcher(readBoard).find()){			
			freeDao.increaseHit(board.getBoNum());		
			// 쿠키에 다시 저장 : "23|2|1|45|"
			Cookie cookie=CookieBox.createCookie("free", readBoard+bonumber+"|");
			response.addCookie(cookie);
		}
	}
	
	request.setAttribute("board", board);
	// memberView.jsp 
	// ${mem.memId}<sdsdf?>
	// ${mem.memId}
	// Find :  <input.+?name="(\w+)".+?>
	// Repl : \${mem.$1}
%> --%>

	<div class="container">
		<div class="col-md-12">
			<div class="left">
				<h1 class="title">자유 게시판</h1>
				<div class="message1">자유롭게 이용하세요.</div>
			</div>
			<form class="form-horizontal">
				<div class="form-group">
					<a href="freeList.wow" class="btn btn-info pull-right">게시판 목록</a>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="boardNum">글 번호</label>
					<div class="col-sm-7">
						<input class="form-control" id="boardNum" type="text"
							value="${board.boNum}" name="boardNum" readonly>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="boardtitle">제 목</label>
					<div class="col-sm-7">
						<input class="form-control" id="boardtitle" type="text"
							name="boardtitle" value="${board.boTitle}" readonly>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="boardNm">작 성 자</label>
					<div class="col-sm-7">
						<input class="form-control" id="boardNm" type="text"
							name="boardNm" value="${board.boWriter}" readonly>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="boardCate">분 류</label>
					<div class="col-sm-7">
						<input class="form-control" id="boardCate" type="text"
							name="boardCate" value="${board.boCateName}" readonly>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="boardIp">IP</label>
					<div class="col-sm-7">
						<input class="form-control" id="boardIp" type="text"
							name="boardIp" value="${board.boIp}" readonly>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="boardHit">조회수</label>
					<div class="col-sm-7">
						<input class="form-control" id="boardHit" type="text"
							name="boardHit" value="${board.boHit}" readonly>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="boardContents">내
						용</label>
					<div class="col-sm-7">
						<textarea class="form-control" id="boardContents" rows="20"
							name="boardContents" readonly>${board.boContent}</textarea>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="boardRegDate">작성일</label>
					<div class="col-sm-7">
						<input class="form-control" id="boardRegDate" type="text"
							name="boardRegDate" value="${board.boRegDate}" readonly>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="boardModDate">수정일</label>
					<div class="col-sm-7">
						<input class="form-control" id="boardModDate" type="text"
							name="boardModDate" value="${board.boModDate}" readonly>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<div class="pull-right">
								<a href="freeEdit.wow?boNum=${board.boNum}" class="btn btn-sm btn-success">게시판 수정</a>			
					</div>
				</div>
<!-- 				<div>
					<div class="form-group">
						<div class="col-sm-3 control-label"></div>
						<div class="col-sm-5 control-label"><p class="text-left"></p> </div>
					</div>
					<div class="form-group">
						<div class="col-sm-3 control-label"></div>
						<div class="col-sm-5 control-label"><p class="text-left"></p></div>
					</div>
					<div class="form-group">
						<div class="col-sm-6 control-label">
						 <button type="button" class="btn btn-warning"  name="conmentupdate">수 정</button> 
						 <button type="button" class="btn btn-danger"  name="conmentdelete">삭 제</button>
						 </div>
					</div>  
				</div> -->
				<hr>
<!-- 				<div class="form-group">
					<label class="col-sm-4 control-label" for="conmentuser">댓글 작성자</label>
					<div class="col-sm-5">
						<input class="form-control" id="conmentuser" type="text" name="conmentuser">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label" for="conmentcon">댓글 내용</label>
					<div class="col-sm-5">
						<textarea class="form-control" id="conmentcon" rows="5" name="conmentcon"></textarea>
					</div>
					<div class="col-sm-9">
						<button class="btn btn-success pull-right" type="button" id="conmentsumit" style="margin-top: 10px;">등 록</button>
					</div>
				</div> -->
				
				
				
			</form>
			
				<!--  댓글 -->
				
	<script type="text/javascript">
	var curpage = 1;
	var recordCountPerPage = 10;
	
	function fn_reply_list(){

		params={'curpage':curpage
					 ,'recordCountPerPage':recordCountPerPage
					 , 'reCategory':'FREE'
					 , 'reParentNo': ${board.boNum}
		}
		console.log('params',params);
		
		$.ajax({
			type:"POST",
			url: '<c:url value="/reply/replyList"/>',
			dataType: 'json',
			data : params,
			success : function(data) {
				
				if(data.result){
					$area=$('#id_reply_list_area');
					$.each(data.data, function(i, elt) {
						str ='';
						str += '<div id="comment" class="row" data-re-no="'+ elt.reNo+'">';
						str += '	<div class="col-sm-2 text-right" >'+elt.reMemName+'</div>';
						str += '	<div class="col-sm-6"><pre>'+elt.reContent+'</pre></div>';
						if(elt.reModDate==null){
							str += '	<div class="col-sm-2" >'+elt.reRegDate+'</div>';
						}else{
							str += '	<div class="col-sm-2" >'+elt.reModDate+'</div>';
						}
						
						str += '	<div class="col-sm-2">';
						if(elt.reMemId== '${sessionScope.USER_INFO.userID}'){
							
						str += '		<button name="btn_reply_edit" type="button" class=" btn btn-sm btn-info">수정</button>';
						str += '		<button name="btn_reply_delete" type="button" class="btn btn-sm btn-danger" >삭제</button>';
						
						}
						str += '	</div>';
						str += '</div>';
						$area.append(str);
						
					})
					curpage += 1;
					if(recordCountPerPage > data.count){
						//더보기 버튼 숨기기
						$('#btn_reply_list_more').hide();
					}
					
					
				}else{
					console.log(data.msg);
				}
	        },
			error: function(req, st, err) {
	              swal({
	                  title: "등록 실패",
	                  text: "등록에 실패하였습니다 다시 등록해주세요.",
	                  icon: "error",
	                })					
	           }
	
	})
} // 리스트 불러오는 펑션 끝
	

		$(document).ready(function() {
			fn_reply_list(); //바로 위 펑션
			
			//수정 버튼 클릭
			$('#id_reply_list_area').on('click','button[name=btn_reply_edit]',function(e){
				e.preventDefault();
			// 입력영역 (textarea)추가. 기존 내용을 복사, 기존 내용은 숨기고
			// 수정 저장버튼(btn_reply_modify)을 보이게 하시고
			
			$this = $(this);
			Drow = $this.closest('div.row');
			re = $this.closest('div.row').data('re-no');
			my = $this.closest('div.row').children();
			my.hide();
			var reCon=my[1].innerHTML;
			str='';
			str += '<div id="modifyCon" class="row" data-re-no="'+re+'">'
			str+='		<div class="col-sm-2 text-right" >'+my[0].innerHTML+'</div>';
			str+='		<div class="col-sm-8"><textarea rows="3" id="reContent" name="reContent" class="form-control" >'+reCon.replace(/(<([^>]+)>)/ig,"")+'</textarea></div>';
			str+='		<div class="col-sm-2">';
			str += '			<button name="btn_reply_modify" type="button" class=" btn btn-sm btn-info">저장</button>';
			str += '			<button name="btn_reply_cancle" type="button" class="btn btn-sm btn-danger" >취소</button>';
			str += '	</div>';
			str +='</div>';
			Drow.append(str);
	
			});
			
			//수정 저장버튼(btn_reply_modify) 클릭
			$('#id_reply_list_area').on('click','button[name=btn_reply_modify]',function(e){
				$this = $(this);
				e.preventDefault();
					re=$this.closest('div.row').data('re-no');
					reContent=$('#reContent').val();
					console.log(reContent);
					params={'reNo':re,'reContent':reContent}
 				$.ajax({
					type:"POST",
					url: '<c:url value="/reply/replyModify"/>',
					dataType: 'json',
					data : params,
					success : function(data) {
						
						if(data.result){
				              swal({
				                  title: "정상 수정",
				                  text: data.msg,
				                  icon: "success",
				                }).then(function(){
				                	window.location.reload();
				                });      
						}else{
							swal({
	                  title: "수정 실패",
	                  text: data.msg,
	                  icon: "success",
				                })
						}

			           }
				}); 
				
			})
			
			$('#id_reply_list_area').on('click','button[name=btn_reply_cancle]',function(e){
				e.preventDefault();
				$this = $(this);
				$this.closest('div.row').remove();
				$('#comment').children().show();
			});
			
			
			
			$('#id_reply_list_area').on('click','button[name=btn_reply_delete]',function(e){
				e.preventDefault();
				$this = $(this);
				//res=confirm("글을 삭제하시겠습니까?"); //yes true,no=false
				swal({
		            title: "삭제하시겠습니까?",
		            text: "삭제 후 되돌릴 수 없습니다.",
		            icon: "warning",
		            buttons: true,
		            dangerMode: true,
		        }).then((ok) => {
					if(ok){
						re = $this.closest('div.row').data('re-no');
						params={'reNo':re}
						console.log('params',params);
						$.ajax({
							type:"POST",
							url: '<c:url value="/reply/replyRemove"/>',
							dataType: 'json',
							data : params,
							success : function(data) {
								
								if(data.result){
						              swal({
						                  title: "정상삭제",
						                  text: data.msg,
						                  icon: "success",
						                }).then(function(){
						                	$this.closest('div.row').remove();
						                });      
								}else{
									alert(data.msg);
								}

					           }
						});
						
					}
		        });
				
				

			});
			
			
			// 더보기 버튼 클릭
			$('#btn_reply_list_more').click(function(e) {
				fn_reply_list();
			});
			
			// 댓글 등록 버튼 클릭
			$("#btn_reply_regist").click(function(e) {
				e.preventDefault();
			//	if(${empty sessionScope.USER_INFO}){
/* 					swal({
		                  title: "등록 실패",
		                  text: "로그인 후 이용해주세요.",
		                  icon: "error",
		                }).then(function(){
		                	return false;
		                });        */			
		                
					
//				}else{
					var reContent=document.forms.frm_reply.reContent.value;
					if(reContent==""){
						swal({
			                  title: "댓글 내용을 입력하세요.",
			                  icon: "error",
			                }).then(function(){
			                	return false;
			                });   
					}else{
						f= document.forms.frm_reply
						params= $(f).serialize();
						$.ajax({
							type:"POST",
							url: '<c:url value="/reply/replyRegist"/>',
							dataType: 'json',
							data : params,
							success : function(data) {
								console.log("data",data);
					              swal({
					                  title: "정상등록",
					                  text: data.msg,
					                  icon: "success",
					                }).then(function(){
					                	if(data.result){
						                			$('#id_reply_list_area').empty();
						                			document.forms.frm_reply.reContent.value="";
																	curpage=1;
																	fn_reply_list();
						                			$('#btn_reply_list_more').show();
														}	                	
					               				 	 });       
					               },
									error: function(req, st, err) {
											console.log("req",req)
											if(req.status == 401){
									              swal({
									                  title: "로그인 후 이용하세요",
									                  text: "로그인페이지로 이동합니다.",
									                  icon: "error",
									                }).then(function(){
									                	location.href= '<c:url value="/login/login.wow" />';
									                })
											}else{
									           swal({
									                  title: "에러 발생",
									                  icon: "error",
									                })
											}
											
					           }
						});
											
					}																			
		//		}
				
			});
		});
	</script>
	
	
	<div class="panel panel-default">	
		<div class="panel-body form-horizontal">
			<form name="frm_reply"  action="<c:url value='/reply/replyRegist'/>" method="post" onclick="return false;" >
			<input type="hidden" name="reParentNo" value="${board.boNum}">
			<input type="hidden" name="reCategory" value="FREE">
			<div class="form-group">		
				<label class="col-sm-2 control-label">댓글</label>
				<div class="col-sm-8">
					<textarea rows="3" name="reContent" class="form-control" ></textarea>
				</div>			
				<div class="col-sm-2">
					<button id="btn_reply_regist" type="button" class="btn btn-sm btn-info" >등록</button>
				</div>
			</div>
			</form>
		</div>
	</div>	
<%-- 					<div class="form-group">
					<label class="col-sm-2 control-label" for="boardNum">글 번호</label>
					<div class="col-sm-7">
						<input class="form-control" id="boardNum" type="text"
							value="${board.boNum}" name="boardNum" readonly>
					</div>
				</div> --%>
				
	<div id="id_reply_list_area">

	</div>
	<div class="row text-center" id="id_reply_list_more">
		<button id="btn_reply_list_more">
			<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
			더보기 
		</button>
	</div>
				
<!-- 	<div id="id_reply_list_area">
		<div class="form-group">
			<label class="col-sm-2 control-label">홍길동</label>
					<div class="col-sm-5">
						<textarea class="form-control" id="conmentcon" rows="5" name="conmentcon">ㅎ</textarea>
					</div>
 			<div class="col-sm-2" >12/30 23:45</div>
			<div class="col-sm-2">
				<button name="btn_reply_edit" type="button" class=" btn btn-sm btn-info" >수정</button>
				<button name="btn_reply_delete" type="button" class="btn btn-sm btn-danger" >삭제</button>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label">홍길동</label>
					<div class="col-sm-5">
						<textarea class="form-control" id="conmentcon" rows="5" name="conmentcon">ㅎ</textarea>
					</div>
 			<div class="col-sm-2" >12/30 23:45</div>
			<div class="col-sm-2">
				<button name="btn_reply_edit" type="button" class=" btn btn-sm btn-info" >수정</button>
				<button name="btn_reply_delete" type="button" class="btn btn-sm btn-danger" >삭제</button>
			</div>
		</div>
	</div> -->
		</div>
	</div>
</body>
</html>
