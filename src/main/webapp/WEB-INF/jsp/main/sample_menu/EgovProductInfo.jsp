<%--
  Class Name : EgovProductInfo.jsp
  Description : 샘플화면 - 대표제품 소개페이지(sample)
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
    <title>주요사업소개 - 표준프레임워크 심플 홈페이지템플릿</title>
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
                                    <li><a href="<c:url value='/EgovPageLink.do?menuNo=21&linkIndex=13'/>">정보마당</a></li>
                                    <li>주요사업소개</li>
                                </ul>
                            </div>
                            <!--// Location -->

                            <h1 class="tit_1">정보마당</h1>

                            <p class="txt_1">표준프레임워크 관련 주요 사업을 소개합니다.</p>

                            <h2 class="tit_2">주요사업소개</h2>

                            <h3 class="tit_3">전자정부 표준프레임워크 구성</h3>
                            <p class="msg_1">
                                전자정부 표준프레임워크는 <strong>실행환경</strong>, <strong>개발환경</strong>, <strong>관리환경</strong>, <strong>운영환경</strong> 등 
                                4개의 표준프레임워크 환경과 <strong>공통컴포넌트</strong>로 구성됩니다.<br><br>
                                전자정부 및 공공사업에서 웹 애플리케이션 시스템 구축 시 애플리케이션 아키텍처와 기본 기능 및 공통컴포넌트를 표준으로 제공하는 
                                개발프레임워크로서 다음과 같이 실행, 개발, 운영, 관리환경과 공통컴포넌트로 구성됩니다.
                            </p>

                            <div class="framework_structure">
                                <div class="framework_item">
                                    <h4>실행 환경</h4>
                                    <p>
                                        전자정부 사업에서 개발하는 업무 프로그램의 실행에 필요한 공통모듈을 제공합니다. 
                                        업무 프로그램 개발 시 화면, 서버 프로그램, 데이터 처리 개발을 용이하도록 지원하는 응용프로그램 기반환경입니다.
                                    </p>
                                </div>

                                <div class="framework_item">
                                    <h4>개발 환경</h4>
                                    <p>
                                        표준프레임워크 기반의 응용 소프트웨어 개발 시 개발자의 코딩, 테스트, 형상관리, 빌드 등을 지원하는 
                                        도구들의 모음과 각 도구들 간의 유기적인 연계를 제공합니다.
                                    </p>
                                </div>

                                <div class="framework_item">
                                    <h4>관리 환경</h4>
                                    <p>
                                        표준프레임워크에 대한 다양한 문의 및 기술지원, 서비스 요청에 대한 접수 및 처리를 하기위한 것으로
                                        표준프레임워크 포탈사이트를 통해 지원합니다.
                                    </p>
                                </div>

                                <div class="framework_item">
                                    <h4>운영 환경</h4>
                                    <p>
                                        응용 소프트웨어 운영에 필요한 서버 설정, 모니터링, 로그 관리 등의 기능을 제공하며, 
                                        안정적인 서비스 운영을 지원하는 환경입니다.
                                    </p>
                                </div>
                            </div>

                            <div style="margin-top: 40px;">
                                <h3 class="tit_3">공통 컴포넌트</h3>
                                <p class="msg_1">
                                    전자정부 사업 시 업무별로 공통적으로 활용 가능한 컴포넌트들을 미리 구현하여 재사용이 가능한 컴포넌트로 제공합니다. 
                                    사용자관리, 권한관리, 게시판, 통계, 유틸리티 등 다양한 공통 기능을 포함하고 있습니다.
                                </p>
                            </div>

                            <div class="intro_image">
                                <img src="<c:url value='/images/sample/egov_intro.png'/>" alt="전자정부 표준프레임워크 개념" />
                                <p style="margin-top: 15px; color: #888; font-size: 14px;">전자정부 표준프레임워크 개념</p>
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