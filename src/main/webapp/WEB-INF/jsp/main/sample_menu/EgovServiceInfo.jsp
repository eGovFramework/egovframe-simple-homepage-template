<%--
  Class Name : EgovServiceInfo.jsp
  Description : 샘플화면 - 대표서비스 상세조회화면(sample)
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
    <title>대표서비스소개 - 표준프레임워크 심플 홈페이지템플릿</title>
    <link rel="stylesheet" href="<c:url value='/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/layout.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/component.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/page.css'/>">
    <script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="<c:url value='/js/ui.js'/>"></script>
</head>
<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 현재 페이지는 기능이 없는 디자인 샘플 페이지 입니다! -->

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
                                    <li>대표서비스소개</li>
                                </ul>
                            </div>
                            <!--// Location -->

                            <h1 class="tit_1">정보마당</h1>

                            <p class="txt_1">표준프레임워크의 대표 서비스를 소개합니다.</p>

                            <h2 class="tit_2">대표서비스소개</h2>

                            <div class="intro_box">
                                <p>
                                    전자정부 표준 프레임워크 실행환경은 <strong>6개 서비스 그룹</strong>으로 구성되며 <strong>34개 서비스</strong>를 제공합니다.<br>
                                    실행환경은 업무 프로그램 개발 시 필요한 다양한 기능을 표준화된 방식으로 제공하여 개발 생산성과 품질을 향상시킵니다.
                                </p>
                            </div>

                            <div class="service_group">
                                <h4>화면처리 서비스</h4>
                                <div class="description">
                                    화면처리 서비스그룹은 업무처리 서비스와 사용자 간의 인터페이스를 담당하는 서비스로 
                                    사용자 화면 구성 및 사용자 입력 정보 검증 등의 기능을 지원합니다.
                                </div>
                                <ul class="service_list">
                                    <li>
                                        <strong>Ajax Support</strong>
                                        Ajax는 대화식 웹 애플리케이션의 제작을 위해 HTML과 CSS, DOM, 자바스크립트, XML, XSLT 등과 같은 조합을 이용하는 
                                        웹 개발 기법으로 Ajax 기능 지원을 위한 Custom Tag Library를 제공합니다.
                                    </li>
                                    <li>
                                        <strong>Internationalization (국제화)</strong>
                                        다양한 지역과 언어 환경을 지원할 수 있는 서비스로, 서버 설정 및 클라이언트 브라우저 환경에 따라 
                                        자동화된 다국어 기능을 제공합니다.
                                    </li>
                                    <li>
                                        <strong>MVC (Model-View-Controller)</strong>
                                        MVC 디자인 패턴을 적용하여 사용자 화면을 개발할 수 있도록 MVC 기반 구조를 제공합니다.
                                    </li>
                                    <li>
                                        <strong>Security (보안)</strong>
                                        웹 응용프로그램 작성 시 발생될 수 있는 웹 보안상의 취약점(XSS, SQL Injection 등)에 대응하기 위한 
                                        기능을 제공합니다.
                                    </li>
                                </ul>
                            </div>

                            <div class="service_group" style="margin-top: 30px;">
                                <h4>업무처리 서비스</h4>
                                <div class="description">
                                    업무처리 서비스는 업무 프로그램의 업무 로직을 담당하는 서비스로 
                                    업무 흐름제어, 트랜잭션 관리, 에러 처리 등의 기능을 제공합니다.
                                </div>
                                <ul class="service_list">
                                    <li>
                                        <strong>Process Control (프로세스 제어)</strong>
                                        비즈니스 로직과 업무 흐름의 분리를 지원하며, XML 등의 외부 설정으로 업무흐름 구성을 제공하고, 
                                        미리 정의된 프로세스를 실행하는 기능을 제공합니다.
                                    </li>
                                    <li>
                                        <strong>Exception Handling (예외 처리)</strong>
                                        응용 프로그래밍의 수행 과정에서 발생하는 예외사항(Exception)을 처리하기 위해 
                                        표준화된 방법을 제공합니다.
                                    </li>
                                </ul>
                            </div>

                            <div style="margin-top: 40px;">
                                <h3 class="tit_3">기타 서비스 그룹</h3>
                                <p class="msg_1">
                                    이외에도 <strong>데이터처리</strong>, <strong>연계통합</strong>, <strong>배치처리</strong> 등의 서비스 그룹이 있으며, 
                                    각 서비스 그룹은 업무 개발에 필요한 다양한 기능을 제공합니다.<br><br>
                                    자세한 내용은 표준프레임워크 포털(<a href="https://www.egovframe.go.kr" target="_blank" style="color: #169bd5; text-decoration: underline;">www.egovframe.go.kr</a>)을 참조하시기 바랍니다.
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