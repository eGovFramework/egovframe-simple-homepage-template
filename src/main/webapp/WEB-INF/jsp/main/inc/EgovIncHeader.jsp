<%--
  Class Name : EgovIncHeader.jsp
  Description : 화면상단 Header(include)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성
     2025.01.06   System    모던 디자인 개선

    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>

<!-- Header -->
<div class="header">
    <div class="inner">
        <div class="left_col">
            <div class="logo_area">
                <p class="logo_txt">표준프레임워크 <span>심플 홈페이지</span></p>
                <h1 class="logo">
                    <a href="<c:url value='/cmm/main/mainPage.do' />">
                        <img src="<c:url value='/images/logo_hq.png' />" alt="표준프레임워크 포털 eGovFrame 샘플 포털" />
                    </a>
                </h1>
            </div>
        </div>

        <%
            LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");
            if(loginVO == null){
        %>
            <c:set var="loginName" value=""/>
        <% }else{ %>
            <c:set var="loginName" value="<%= loginVO.getName()%>"/>
            <div class="top_menu">
                <span class="t"><span><c:out value="${loginName}" />님</span>, 로그인하셨습니다.</span>
            </div>
        <% } %>

        <!-- gnb -->
        <div class="gnb">
            <ul>
                <li><a href="<c:url value='/EgovPageLink.do?menuNo=11&linkIndex=9'/>">사이트소개</a></li>
                <li><a href="<c:url value='/EgovPageLink.do?menuNo=21&linkIndex=13'/>">정보마당</a></li>
                <li><a href="<c:url value='/EgovPageLink.do?menuNo=31&linkIndex=15'/>">고객지원</a></li>
                <li><a href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageWeekList.do?menuNo=42'/>">알림마당</a></li>
                <%
                   if(loginVO != null){ 
                %>
                <li><a href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageMonthList.do?menuNo=52'/>" class="manager">사이트관리</a></li>
                <%
                   }
                %>
            </ul>
        </div>
        <!--// gnb -->

        <!-- util menu -->
        <div class="util_menu">
            <ul>
                <%
                   if(loginVO == null){ 
                %>
                <li><a href="<c:url value='/uat/uia/egovLoginUsr.do'/>" class="login">로그인</a></li>
                <%
                   }else{
                %>
                <li><a href="<c:url value='/uat/uia/actionLogout.do'/>" class="logout">로그아웃</a></li>
                <%
                   }
                %>
            </ul>
        </div>
        <!--// util menu -->

    </div>
</div>
<!--// Header -->
