<%--
  Class Name : EgovOrganization.jsp
  Description : 샘플화면 - 조직도(sample)
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
    <title>조직소개 - 표준프레임워크 심플 홈페이지템플릿</title>
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
                                    <li>조직소개</li>
                                </ul>
                            </div>
                            <!--// Location -->

                            <h1 class="tit_1">사이트소개</h1>

                            <p class="txt_1">표준프레임워크 심플 홈페이지 사이트를 소개합니다.</p>

                            <h2 class="tit_2">조직소개</h2>

                            <h3 class="tit_3">조직 구성</h3>
                            <p class="msg_1">
                                오픈커뮤니티의 초기 정착을 위해 표준프레임워크 개발 참여자와 국내 주요 오픈커뮤니티의 운영자·전문가를 리딩그룹(PMC, 커미터)으로 구성하였습니다.
                            </p>

                            <div style="margin-top: 40px;">
                                <h3 class="tit_3">운영 체계</h3>
                                <p class="msg_1">
                                    오픈커뮤니티의 지속적인 확대·발전을 위해 프로젝트 활동에 적극적으로 참여하는 커뮤니티 회원이 리딩그룹의 역할을 할수 있도록 하였습니다.<br><br>
                                    <strong>주요 역할:</strong><br>
                                    • PMC (Project Management Committee) - 프로젝트 관리 및 의사결정<br>
                                    • 커미터 (Committer) - 코드 검토 및 승인<br>
                                    • 컨트리뷰터 (Contributor) - 개발 및 문서화 기여<br>
                                    • 사용자 (User) - 피드백 및 커뮤니티 참여
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