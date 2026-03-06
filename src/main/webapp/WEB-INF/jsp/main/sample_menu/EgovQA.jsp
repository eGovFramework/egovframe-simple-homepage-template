<%--
  Class Name : EgovQA.jsp
  Description : 샘플화면 - 묻고답하기 목록조회(sample)
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
    <title>묻고답하기 - 표준프레임워크 심플 홈페이지템플릿</title>
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
                                    <li>묻고답하기</li>
                                </ul>
                            </div>
                            <!--// Location -->

                            <h1 class="tit_1">고객지원</h1>
                            <p class="txt_1">각종 문의사항에 대한 답변을 친절하게 제공해 드립니다.</p>
                            <h2 class="tit_2">묻고답하기 (Q&A)</h2>

                            <!-- 검색 영역 -->
                            <div class="search_area">
                                <form action="<c:url value='/EgovPageLink.do?linkIndex=16'/>" method="post">
                                    <select name="search_select" id="search_select">
                                        <option value="0" selected="selected">전체</option>
                                        <option value="1">제목</option>
                                        <option value="2">제목/내용</option>
                                        <option value="3">작성자</option>
                                    </select>
                                    <input type="text" name="search_keyword" placeholder="검색어를 입력하세요" />
                                    <button type="submit">검색</button>
                                </form>
                            </div>
                            <!--// 검색 영역 -->

                            <!-- Q&A 목록 테이블 -->
                            <div class="data_table">
                                <table>
                                    <caption>묻고답하기 목록</caption>
                                    <colgroup>
                                        <col style="width: 80px;">
                                        <col style="width: auto;">
                                        <col style="width: 120px;">
                                        <col style="width: 100px;">
                                        <col style="width: 120px;">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>조회수</th>
                                            <th>등록일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><strong>10</strong></td>
                                            <td class="align_left">
                                                <a href="<c:url value='/EgovPageLink.do?linkIndex=7'/>">공통컴포넌트 중 모니터링 관련 서비스 실행시 오류가 발생합니다 <span style="color: #169bd5;">(15)</span></a>
                                            </td>
                                            <td>홍길동</td>
                                            <td>1,232</td>
                                            <td>2026-01-09</td>
                                        </tr>
                                        <tr>
                                            <td><strong>9</strong></td>
                                            <td class="align_left">
                                                <a href="<c:url value='/EgovPageLink.do?linkIndex=7'/>">validation 처리 시 패스워드에 대한 메소드를 찾지 못합니다</a>
                                            </td>
                                            <td>이영희</td>
                                            <td>111</td>
                                            <td>2026-01-08</td>
                                        </tr>
                                        <tr>
                                            <td><strong>8</strong></td>
                                            <td class="align_left">
                                                <a href="<c:url value='/EgovPageLink.do?linkIndex=7'/>">Spring Boot 연동 관련 문의드립니다</a>
                                            </td>
                                            <td>김철수</td>
                                            <td>324</td>
                                            <td>2026-01-07</td>
                                        </tr>
                                        <tr>
                                            <td><strong>7</strong></td>
                                            <td class="align_left">
                                                <a href="<c:url value='/EgovPageLink.do?linkIndex=7'/>">데이터베이스 연결 설정 방법 문의</a>
                                            </td>
                                            <td>박민수</td>
                                            <td>521</td>
                                            <td>2026-01-06</td>
                                        </tr>
                                        <tr>
                                            <td><strong>6</strong></td>
                                            <td class="align_left">
                                                <a href="<c:url value='/EgovPageLink.do?linkIndex=7'/>">파일 업로드 시 용량 제한 설정 문의</a>
                                            </td>
                                            <td>최지영</td>
                                            <td>755</td>
                                            <td>2026-01-05</td>
                                        </tr>
                                        <tr>
                                            <td><strong>5</strong></td>
                                            <td class="align_left">
                                                <a href="<c:url value='/EgovPageLink.do?linkIndex=7'/>">로그인 세션 타임아웃 설정 방법</a>
                                            </td>
                                            <td>정수현</td>
                                            <td>324</td>
                                            <td>2026-01-04</td>
                                        </tr>
                                        <tr>
                                            <td><strong>4</strong></td>
                                            <td class="align_left">
                                                <a href="<c:url value='/EgovPageLink.do?linkIndex=7'/>">공통컴포넌트 커스터마이징 가이드</a>
                                            </td>
                                            <td>강동훈</td>
                                            <td>521</td>
                                            <td>2026-01-03</td>
                                        </tr>
                                        <tr>
                                            <td><strong>3</strong></td>
                                            <td class="align_left">
                                                <a href="<c:url value='/EgovPageLink.do?linkIndex=7'/>">REST API 개발 시 권한 체크 방법</a>
                                            </td>
                                            <td>윤서아</td>
                                            <td>755</td>
                                            <td>2026-01-02</td>
                                        </tr>
                                        <tr>
                                            <td><strong>2</strong></td>
                                            <td class="align_left">
                                                <a href="<c:url value='/EgovPageLink.do?linkIndex=7'/>">메일 발송 기능 설정 문의</a>
                                            </td>
                                            <td>송민지</td>
                                            <td>521</td>
                                            <td>2026-01-01</td>
                                        </tr>
                                        <tr>
                                            <td><strong>1</strong></td>
                                            <td class="align_left">
                                                <a href="<c:url value='/EgovPageLink.do?linkIndex=7'/>">배치 작업 스케줄링 설정 방법</a>
                                            </td>
                                            <td>한태영</td>
                                            <td>755</td>
                                            <td>2025-12-31</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--// Q&A 목록 테이블 -->

                            <!-- 페이지네이션 -->
                            <div class="pagination">
                                <a href="#">◀</a>
                                <span class="active">1</span>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#">4</a>
                                <a href="#">5</a>
                                <a href="#">▶</a>
                            </div>
                            <!--// 페이지네이션 -->

                            <!-- 문의하기 버튼 -->
                            <div class="btn_area">
                                <a href="<c:url value='/EgovPageLink.do?linkIndex=17'/>" class="btn_upload">✏️ 문의하기</a>
                            </div>
                            <!--// 문의하기 버튼 -->

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