<%--
  Class Name : EgovIncTopnav.jsp
  Description : 상단메뉴(include)
  Modification Information
 
    수정일        수정자        수정내용
    ----------  --------    ---------------------------
    2011.08.31  JJY         경량환경 버전 생성
    2026.01.09  신용호        신규 디자인 적용
 
    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>

<!-- gnb -->
<div class="gnb">
    <ul>
        <li><a href="<c:url value='/EgovPageLink.do?menuNo=11&linkIndex=9'/>">사이트소개</a></li>
        <li><a href="<c:url value='/EgovPageLink.do?menuNo=21&linkIndex=13'/>">정보마당</a></li>
        <li><a href="<c:url value='/EgovPageLink.do?menuNo=31&linkIndex=15'/>">고객지원</a></li>
        <li><a href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageWeekList.do?menuNo=42'/>">알림마당</a></li>
        <%
           LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO"); 
           if(loginVO != null){ 
        %>
        <li><a href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageMonthList.do?menuNo=52'/>" class="manager">사이트관리</a></li>
        <%
           }
        %>
    </ul>
</div>
<!--// gnb -->