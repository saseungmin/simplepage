<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


  <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">Project name</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="<%=request.getContextPath()%>/member/memberList.wow">회원조회</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">게시판 <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="<%=request.getContextPath()%>/free/freeList.wow">자유게시판</a></li>
                <li><a href="#">자료실</a></li>
                <li><a href="#">Q&amp;A</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
          <c:if test="${empty sessionScope.USER_INFO}">
            <li><a href="<%=request.getContextPath()%>/login/login.wow"><i class="fa fa-sign-in fa-lg" aria-hidden="true"></i>&nbsp;로그인</a></li>
            <li id="join_li"><a href="<%=request.getContextPath()%>/member/memberForm.wow"><span class="glyphicon glyphicon-user"></span>&nbsp;회원가입</a></li>
            
          </c:if>
          <c:if test="${not empty sessionScope.USER_INFO}">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;${sessionScope.USER_INFO.userName} 님<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="<%=request.getContextPath()%>/member/memberView.wow?memId=${sessionScope.USER_INFO.userID}"><i class="fa fa-cog fa-lg" aria-hidden="true"></i>&nbsp;회원정보</a></li>
                <li><a href="#"><i class="fa fa-calendar-check-o" aria-hidden="true"></i>&nbsp;일정관리</a></li>
                <li class="divider"></li>
                <li><a href="<%=request.getContextPath()%>/login/logout.wow"><i class="fa fa-sign-out fa-lg" aria-hidden="true"></i>&nbsp;로그아웃</a></li>
              </ul>
            </li>
            </c:if>
            </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>