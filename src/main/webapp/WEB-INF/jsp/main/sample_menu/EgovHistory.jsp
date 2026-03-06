<%--
  Class Name : EgovHistory.jsp
  Description : 샘플화면 - 사이트 연혁(sample)
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
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>연혁 - 표준프레임워크 심플 홈페이지템플릿</title>
    <link rel="stylesheet" href="<c:url value='/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/layout.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/component.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/page.css'/>">
    <script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="<c:url value='/js/ui.js'/>"></script>
</head>
<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<!-- Skip navigation -->
<a href="#contents" class="skip_navi">본문 바로가기</a>

<div class="wrap">
    <!-- Header -->
    <jsp:include page="/WEB-INF/jsp/main/inc/EgovIncHeader.jsp"/>
    <!--// Header -->

    <div class="container">
        <div class="sub_layout">
            <div class="sub_in">
                <div class="layout">
                    <!-- Left menu -->
                    <jsp:include page="/WEB-INF/jsp/main/inc/EgovIncLeftmenu.jsp"/>
                    <!--// Left menu -->
    
                    <div class="content_wrap">
                        <div id="contents" class="content">
                            <!-- Location -->
                            <div class="location">
                                <ul>
                                    <li><a class="home" href="<c:url value='/cmm/main/mainPage.do'/>">Home</a></li>
                                    <li><a href="<c:url value='/EgovPageLink.do?menuNo=11&linkIndex=9'/>">사이트소개</a></li>
                                    <li>연혁</li>
                                </ul>
                            </div>
                            <!--// Location -->

                            <h1 class="tit_1">사이트소개</h1>

                            <p class="txt_1">표준프레임워크 심플 홈페이지 사이트를 소개합니다.</p>

                            <h2 class="tit_2">표준프레임워크 연혁</h2>

                            <h3 class="tit_3">History</h3>
                            <p class="msg_1">
                                표준프레임워크 활성화 및 운영을 전담할 조직으로 한국지능정보사회진흥원(NIA)에 「표준프레임워크센터」가 설립되었으며 
                                정책지원, 글로벌 확산 등을 담당할 NIA 인력과 R&D, 기술지원 등을 담당할 외부 민간 전문가로 구성되었습니다.
                            </p>

                            <div style="margin-top: 40px;">
                                <h3 class="tit_3">주요 연혁</h3>
                                <p class="msg_1">
                                    <strong>2010년 11월</strong> - 표준프레임워크센터 설립<br>
                                    <strong>2011년</strong> - 표준프레임워크 1.0 출시<br>
                                    <strong>2012년</strong> - 표준프레임워크 2.0 출시<br>
                                    <strong>2013년</strong> - 표준프레임워크 2.5 출시<br>
                                    <strong>2014년</strong> - 표준프레임워크 3.0 출시<br>
                                    <strong>2020년</strong> - 표준프레임워크 3.10 출시<br>
                                    <strong>2021년</strong> - 표준프레임워크 4.0 출시<br>
                                    <strong>2025년</strong> - 표준프레임워크 4.3 출시<br>
                                    <strong>2026년</strong> - 표준프레임워크 5.0 출시<br>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="/WEB-INF/jsp/main/inc/EgovIncFooter.jsp"/>
    <!--// Footer -->
</div>

</body>
</html>