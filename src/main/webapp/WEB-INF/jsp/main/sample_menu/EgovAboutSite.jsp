<%--
  Class Name : EgovAboutSite.jsp
  Description : 샘플화면 - 사이트소개(sample)
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
    <title>사이트소개 - 표준프레임워크 심플 홈페이지템플릿</title>
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
                                    <li>소개</li>
                                </ul>
                            </div>
                            <!--// Location -->

                            <h1 class="tit_1">사이트소개</h1>

                            <p class="txt_1">표준프레임워크 심플 홈페이지 사이트를 소개합니다.</p>

                            <h2 class="tit_2">전자정부표준프레임워크 소개</h2>

                            <h3 class="tit_3">개요</h3>
                            <p class="msg_1">
                                전자정부 표준 프레임워크는 응용SW의 구성기반이 되며 응용SW실행 시 필요한 기본 기능을 제공하는 환경이다.<br>
                                전자정부 표준 프레임워크는 '전자정부 서비스의 품질향상 및 정보화 투자 효율성 향상'을 위해 개발된 프레임워크이며, 
                                개발 프레임워크 표준 적용을 통한 응용 SW의 표준화 및 품질과 재사용성 향상을 목표로 한다.
                            </p>

                            <h3 class="tit_3">배경</h3>
                            <p class="msg_1">
                                과거 다양한 종류 및 버전의 프레임워크를 공공정보화 사업 개발시 사용되어 왔으며, 이에 따라 다양한 문제점들이 발생하였다.<br>
                                당시 개발프레임워크는 Black Box 형태로 제공되어 특정 사업자의 기술지원 없이는 응용 SW를 유지보수하기 어렵기 때문에 특정 사업자에 대한 의존성(락인 효과)이 발생하였다.<br>
                                복수개의 개발프레임워크가 적용된 사업의 경우, 프레임워크에 따라 개발표준 정의, 개발자수급, 교육시행 등 별도의 유지보수 체계를 갖추는 중복 투자가 발생하였다.<br>
                                <br>
                                전자정부표준프레임워크는 사업자 고유 개발프레임워크에 대한 기술 종속성을 배제하고 표준화를 통해 응용 SW의 표준화와 품질, 재사용성을 향상시키며, 
                                개발 프레임워크의 유지 보수 단일화를 통한 투자 효율성을 높인다.
                            </p>

                            <h3 class="tit_3">특징</h3>
                            <p class="msg_1">
                                전자정부 표준프레임워크는 다음과 같은 특징을 가지고 있습니다.<br>
                                - 개방형 표준 준수를 통한 사업자 종속성 배제<br>
                                - 표준화를 통한 응용 SW 품질 및 재사용성 향상<br>
                                - 공개 소프트웨어 기반의 개발 프레임워크 (모든 소스코드 및 모든 기술문서 공개)<br>
                                - 검증된 오픈소스 기술의 활용<br>
                                - 필요한 기능만 선택적으로 사용 가능한 모듈화된 구조<br>
                                - 개발자 교육, 기술지원, 적용점검 서비스 , 호환성 확인 등 개발자 및 개발사업단 지원
                            </p>
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