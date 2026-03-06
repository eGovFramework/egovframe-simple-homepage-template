<%--
  Class Name : EgovMainView.jsp 
  Description : 메인화면
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
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>표준프레임워크 심플 홈페이지 템플릿</title>
<link href="<c:url value='/css/base.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/layout.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/component.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/page.css'/>" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<c:url value='/js/ui.js'/>"></script>
</head>
<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<!-- Skip navigation -->
<a href="#main_container" class="skip_navi">본문 바로가기</a>

<div class="wrap">
    <!-- Header -->
    <jsp:include page="/WEB-INF/jsp/main/inc/EgovIncHeader.jsp" />
    <!--// Header -->

    <div class="container">
        <div class="p_main">
            <!-- Main Visual Banner -->
            <div class="visual">
                <div class="banner_inner">
                    <span class="t1">표준프레임워크</span>
                    <span class="t2">심플 홈페이지</span>
                    <span class="t3">표준프레임워크 경량환경 템플릿에 대한 최신정보와 기술을 제공하고 있습니다.</span>
                </div>
            </div>
            <!--// Main Visual Banner -->

            <!-- Dashboard: 공지사항 & 갤러리 -->
            <div class="dash_board">
                <div class="inner">
                    <ul class="tab">
                        <li><a href="#" class="cur">공지사항</a></li>
                        <li><a href="#">갤러리</a></li>
                    </ul>

                    <div class="tab_contents">
                        <!-- 공지사항 Tab -->
                        <div class="tab_item">
                            <h2 class="blind">공지사항</h2>
                            <ul>
                                <c:if test="${fn:length(notiList) == 0}">
                                    <li>
                                        <a href="<c:url value='/EgovPageLink.do?menuNo=31&linkIndex=15'/>">
                                            <span class="tit">등록된 공지사항이 없습니다.</span>
                                            <span class="desc">공지사항 게시판을 확인해주세요.</span>
                                            <span class="dates"><c:out value="<%= new java.text.SimpleDateFormat(\"yyyy-MM-dd\").format(new java.util.Date()) %>"/></span>
                                        </a>
                                    </li>
                                </c:if>
                                
                                <c:forEach var="result" items="${notiList}" begin="0" end="2" step="1" varStatus="status">
                                    <li>
                                        <a href="<c:url value='/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA&menuNo=43'/>">
                                            <c:if test="${!(result.isExpired=='Y' || result.useAt == 'N')}">
                                                <span class="tit">
                                                    <c:choose>
                                                        <c:when test="${fn:length(result.nttSj) > 51}">
                                                            <c:out value="${fn:substring(result.nttSj, 0, 50)}" />...
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:out value="${result.nttSj}" />
                                                        </c:otherwise>
                                                    </c:choose>
                                                </span>
                                                <span class="desc">
                                                    <c:choose>
                                                        <c:when test="${fn:length(result.nttCn) > 101}">
                                                            <c:out value="${fn:substring(result.nttCn, 0, 100)}" />...
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:out value="${result.nttCn}" />
                                                        </c:otherwise>
                                                    </c:choose>
                                                </span>
                                                <span class="dates">
                                                    <c:out value="${result.frstRegisterPnttm}"/>
                                                </span>
                                            </c:if>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                            <a href="<c:url value='/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA&menuNo=43'/>" class="more">더보기</a>
                        </div>
                        
                        <!-- 갤러리 Tab -->
                        <div class="tab_item">
                            <h2 class="blind">갤러리</h2>
                            <ul>
                                <c:if test="${fn:length(galList) == 0}">
                                    <li>
                                        <a href="<c:url value='/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_BBBBBBBBBBBB&menuNo=43'/>">
                                            <span class="tit">등록된 갤러리가 없습니다.</span>
                                            <span class="desc">갤러리 게시판을 확인해주세요.</span>
                                            <span class="dates"><c:out value="<%= new java.text.SimpleDateFormat(\"yyyy-MM-dd\").format(new java.util.Date()) %>"/></span>
                                        </a>
                                    </li>
                                </c:if>
                                
                                <c:forEach var="result" items="${galList}" begin="0" end="2" step="1" varStatus="status">
                                    <li>
                                        <a href="<c:url value='/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_BBBBBBBBBBBB&menuNo=43'/>">
                                            <c:if test="${!(result.isExpired=='Y' || result.useAt == 'N')}">
                                                <span class="tit">
                                                    <c:choose>
                                                        <c:when test="${fn:length(result.nttSj) > 51}">
                                                            <c:out value="${fn:substring(result.nttSj, 0, 50)}" />...
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:out value="${result.nttSj}" />
                                                        </c:otherwise>
                                                    </c:choose>
                                                </span>
                                                <span class="desc">
                                                    <c:choose>
                                                        <c:when test="${fn:length(result.nttCn) > 101}">
                                                            <c:out value="${fn:substring(result.nttCn, 0, 100)}" />...
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:out value="${result.nttCn}" />
                                                        </c:otherwise>
                                                    </c:choose>
                                                </span>
                                                <span class="dates">
                                                    <c:out value="${result.frstRegisterPnttm}"/>
                                                </span>
                                            </c:if>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                            <a href="<c:url value='/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_BBBBBBBBBBBB&menuNo=43'/>" class="more">더보기</a>
                        </div>
                    </div>
                </div>
            </div>
            <!--// Dashboard -->

            <!-- Banner Section: 주요 사업, 대표서비스, 자료실, 찾아오시는 길 -->
            <div class="banner_section">
                <div class="banner_wrap">
                    <h2>주요 서비스</h2>
                    <div class="banner_grid">
                        <div class="banner_item business">
                            <a href="<c:url value='/EgovPageLink.do?menuNo=21&linkIndex=13'/>">
                                <span class="text">주요 사업 소개</span>
                            </a>
                        </div>
                        <div class="banner_item service">
                            <a href="<c:url value='/EgovPageLink.do?menuNo=22&linkIndex=14'/>">
                                <span class="text">대표서비스 소개</span>
                            </a>
                        </div>
                        <div class="banner_item download">
                            <a href="<c:url value='/EgovPageLink.do?menuNo=31&linkIndex=15'/>">
                                <span class="text">자료실</span>
                            </a>
                        </div>
                        <div class="banner_item location">
                            <a href="<c:url value='/EgovPageLink.do?menuNo=14&linkIndex=12'/>">
                                <span class="text">표준프레임워크센터<br>찾아오시는 길</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!--// Banner Section -->

            <!-- Service Section: 서비스 신청, 일정 현황 -->
            <div class="service_section">
                <div class="service_grid">
                    <div class="service_item">
                        <h3>서비스 <span>신청</span></h3>
                        <p>표준프레임워크 심플 홈페이지의<br>다양한 서비스를 신청하실 수 있습니다.</p>
                        <a href="<c:url value='/EgovPageLink.do?menuNo=33&linkIndex=17'/>">신청하기</a>
                    </div>
                    <div class="service_item">
                        <h3>일정 <span>현황</span></h3>
                        <p>표준프레임워크 심플 홈페이지의<br>전체적인 일정현황을 조회하실 수 있습니다.</p>
                        <a href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageWeekList.do?menuNo=42'/>">조회하기</a>
                    </div>
                </div>
            </div>
            <!--// Service Section -->

        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="/WEB-INF/jsp/main/inc/EgovIncFooter.jsp" />
    <!--// Footer -->
</div>

</body>
</html>
