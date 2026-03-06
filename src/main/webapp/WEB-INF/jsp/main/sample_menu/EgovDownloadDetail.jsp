<%--
  Class Name : EgovDownloadDetail.jsp
  Description : 샘플화면 - 자료실 상세조회(sample)
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
    <title>자료실 상세 - 표준프레임워크 심플 홈페이지템플릿</title>
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
                                    <li><a href="<c:url value='/EgovPageLink.do?menuNo=31&linkIndex=15'/>">고객지원</a></li>
                                    <li>자료실</li>
                                </ul>
                            </div>
                            <!--// Location -->

                            <h1 class="tit_1">고객지원</h1>
                            <p class="txt_1">자료실 상세 정보입니다.</p>
                            <h2 class="tit_2">자료 상세</h2>

                            <!-- 자료 헤더 -->
                            <div class="detail_header">
                                <h3>📦 eGovFrame Installer v5.0</h3>
                                <div class="meta">
                                    <span>👤 작성자: innovate</span>
                                    <span>📅 등록일: 2026-01-09 14:30:00</span>
                                    <span>👁️ 조회: 1,234</span>
                                </div>
                            </div>
                            <!--// 자료 헤더 -->

                            <!-- 자료 상세 내용 -->
                            <div class="detail_content">
                                <div class="detail_image">
                                    <img src="<c:url value='/images/sample/img_download.gif'/>" alt="다운로드 자료 이미지"/>
                                </div>
                                <div class="detail_info">
                                    <a href="#" class="download_btn">⬇️ 다운로드</a>
                                    
                                    <div class="specs_table">
                                        <table>
                                            <colgroup>
                                                <col style="width: 150px;">
                                                <col style="width: auto;">
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th>운영체제</th>
                                                    <td>Windows 10/11, macOS, Linux</td>
                                                </tr>
                                                <tr>
                                                    <th>권장사양</th>
                                                    <td>Intel Core i5 이상, RAM 8GB 이상</td>
                                                </tr>
                                                <tr>
                                                    <th>파일정보</th>
                                                    <td>256MB (총 1개) / egovframework-installer-v5.0.zip [268,435,456 byte]</td>
                                                </tr>
                                                <tr>
                                                    <th>등록일자</th>
                                                    <td>2026-01-09 14:30:00</td>
                                                </tr>
                                                <tr>
                                                    <th>언어</th>
                                                    <td>한국어, 영어</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!--// 자료 상세 내용 -->

                            <!-- 자료 상세 설명 -->
                            <div class="description_section">
                                <h3>📝 자료 상세 설명</h3>
                                <div class="description_content">안녕하세요.

전자정부 표준프레임워크 5.0 인스톨러입니다.

이 인스톨러는 전자정부 표준프레임워크 개발환경을 손쉽게 설치할 수 있도록 지원합니다.

<strong>주요 기능:</strong>
• 개발환경 자동 설치 및 설정
• Eclipse 기반 통합 개발 환경 제공
• Maven, Git 등 필수 도구 포함
• 샘플 프로젝트 자동 생성

<strong>설치 방법:</strong>
1. 다운로드 받은 파일의 압축을 해제합니다.
2. installer.exe (또는 installer.sh) 파일을 실행합니다.
3. 설치 마법사의 안내에 따라 진행합니다.
4. 설치 완료 후 Eclipse를 실행하여 개발을 시작합니다.

관련된 자세한 내용은 다음 가이드를 참조하십시오.
https://www.egovframe.go.kr/wiki/doku.php?id=egovframework:com:v5:init_guide

감사합니다.
                                </div>
                            </div>
                            <!--// 자료 상세 설명 -->

                            <!-- 목록 버튼 -->
                            <div class="btn_list">
                                <a href="<c:url value='/EgovPageLink.do?linkIndex=15'/>">📋 목록</a>
                            </div>
                            <!--// 목록 버튼 -->

                            <!-- 이전/다음 글 네비게이션 -->
                            <div class="nav_buttons">
                                <a href="#" class="prev">이전글: 표준프레임워크 개발자 가이드 v5.0</a>
                                <a href="#" class="next">다음글: 공통 컴포넌트 샘플 소스</a>
                            </div>
                            <!--// 이전/다음 글 네비게이션 -->

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