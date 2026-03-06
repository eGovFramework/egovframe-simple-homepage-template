<%--
  Class Name : EgovDownload.jsp
  Description : 샘플화면 - 자료실목록조회(sample)
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
    <title>자료실 - 표준프레임워크 심플 홈페이지템플릿</title>
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
                            <p class="txt_1">다양한 자료를 다운로드 받으실 수 있습니다.</p>
                            <h2 class="tit_2">자료실</h2>


                            <!-- 검색 영역 -->
                            <div class="search_area">
                                <form action="<c:url value='/EgovPageLink.do?linkIndex=5'/>" method="post">
                                    <select name="search_select" id="search_select">
                                        <option value="0" selected="selected">전체</option>
                                        <option value="1">제목</option>
                                        <option value="2">제목/내용</option>
                                        <option value="3">작성자</option>
                                    </select>
                                    <input type="text" name="search_keyword" placeholder="검색어를 입력하세요" />
                                    <button type="submit">🔍 검색</button>
                                </form>
                            </div>
                            <!--// 검색 영역 -->		
		
                            <!-- 추천 다운로드 -->
                            <div class="recommend_section">
                                <h3>📥 추천 다운로드 자료</h3>
                                <div class="recommend_grid">
                                    <div class="recommend_item">
                                        <img src="<c:url value='/images/sample/img_download.gif'/>" alt="다운로드 자료 이미지"/>
                                        <div class="text">
                                            <h4><a href="<c:url value='/EgovPageLink.do?linkIndex=5'/>">eGovFrame Installer v1.03</a></h4>
                                            <p>eGovFrame의 템플릿 설치를 도와주는 인스톨러입니다. 간편하게 개발 환경을 구성할 수 있습니다.</p>
                                        </div>
                                    </div>
                                    <div class="recommend_item">
                                        <img src="<c:url value='/images/sample/img_download.gif'/>" alt="다운로드 자료 이미지"/>
                                        <div class="text">
                                            <h4>표준프레임워크 개발자 가이드</h4>
                                            <p>표준프레임워크 개발 시 참고할 수 있는 상세한 개발 가이드 문서입니다.</p>
                                        </div>
                                    </div>
                                    <div class="recommend_item">
                                        <img src="<c:url value='/images/sample/img_download.gif'/>" alt="다운로드 자료 이미지"/>
                                        <div class="text">
                                            <h4>공통 컴포넌트 매뉴얼</h4>
                                            <p>공통 컴포넌트 사용법을 설명하는 매뉴얼로, 다양한 예제가 포함되어 있습니다.</p>
                                        </div>
                                    </div>
                                    <div class="recommend_item">
                                        <img src="<c:url value='/images/sample/img_download.gif'/>" alt="다운로드 자료 이미지"/>
                                        <div class="text">
                                            <h4>샘플 프로젝트 소스</h4>
                                            <p>실무에 바로 적용 가능한 샘플 프로젝트 소스 코드를 제공합니다.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--// 추천 다운로드 -->

                            <!-- 최신 등록 자료 -->
                            <div class="latest_section">
                                <h3>🆕 최신 등록 자료</h3>
                                <div class="latest_grid">
                                    <div class="latest_item">
                                        <div class="number">1</div>
                                        <a href="#" class="title">2026년도 표준프레임워크 기술지원 안내</a>
                                        <span class="date">2026-01-09</span>
                                    </div>
                                    <div class="latest_item">
                                        <div class="number">2</div>
                                        <a href="#" class="title">표준프레임워크 5.0 업데이트 가이드</a>
                                        <span class="date">2026-01-08</span>
                                    </div>
                                    <div class="latest_item">
                                        <div class="number">3</div>
                                        <a href="#" class="title">Spring Boot 3.x 통합 가이드</a>
                                        <span class="date">2026-01-07</span>
                                    </div>
                                    <div class="latest_item">
                                        <div class="number">4</div>
                                        <a href="#" class="title">공통 컴포넌트 활용 매뉴얼</a>
                                        <span class="date">2026-01-06</span>
                                    </div>
                                    <div class="latest_item">
                                        <div class="number">5</div>
                                        <a href="#" class="title">개발환경 설치 가이드 v5.0</a>
                                        <span class="date">2026-01-05</span>
                                    </div>
                                    <div class="latest_item">
                                        <div class="number">6</div>
                                        <a href="#" class="title">eGovFrame Online Installer v5.0</a>
                                        <span class="date">2026-01-04</span>
                                    </div>
                                    <div class="latest_item">
                                        <div class="number">7</div>
                                        <a href="#" class="title">표준프레임워크 아키텍처 설명서</a>
                                        <span class="date">2026-01-03</span>
                                    </div>
                                    <div class="latest_item">
                                        <div class="number">8</div>
                                        <a href="#" class="title">REST API 개발 가이드</a>
                                        <span class="date">2026-01-02</span>
                                    </div>
                                    <div class="latest_item">
                                        <div class="number">9</div>
                                        <a href="#" class="title">보안 설정 가이드</a>
                                        <span class="date">2026-01-01</span>
                                    </div>
                                    <div class="latest_item">
                                        <div class="number">10</div>
                                        <a href="#" class="title">마이그레이션 가이드</a>
                                        <span class="date">2025-12-31</span>
                                    </div>
                                </div>
                            </div>
                            <!--// 최신 등록 자료 -->

                            <!-- 자료 목록 테이블 -->
                            <div class="data_table">
                                <table>
                                    <caption>자료실 목록</caption>
                                    <colgroup>
                                        <col style="width: 80px;">
                                        <col style="width: auto;">
                                        <col style="width: 100px;">
                                        <col style="width: 100px;">
                                        <col style="width: 120px;">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>소프트웨어명</th>
                                            <th>다운로드</th>
                                            <th>크기</th>
                                            <th>등록일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><strong>5</strong></td>
                                            <td class="align_left">
                                                <a href="<c:url value='/EgovPageLink.do?linkIndex=5'/>">전자정부표준프레임워크 인스톨러 (eGovFrame Installer) V5.0</a>
                                            </td>
                                            <td>1,234</td>
                                            <td>256MB</td>
                                            <td>2026-01-09</td>
                                        </tr>
                                        <tr>
                                            <td><strong>4</strong></td>
                                            <td class="align_left">
                                                <a href="<c:url value='/EgovPageLink.do?linkIndex=5'/>">표준프레임워크 개발자 가이드 v5.0</a>
                                            </td>
                                            <td>856</td>
                                            <td>12MB</td>
                                            <td>2026-01-08</td>
                                        </tr>
                                        <tr>
                                            <td><strong>3</strong></td>
                                            <td class="align_left">
                                                <a href="<c:url value='/EgovPageLink.do?linkIndex=5'/>">공통 컴포넌트 샘플 소스</a>
                                            </td>
                                            <td>542</td>
                                            <td>48MB</td>
                                            <td>2026-01-07</td>
                                        </tr>
                                        <tr>
                                            <td><strong>2</strong></td>
                                            <td class="align_left">
                                                <a href="<c:url value='/EgovPageLink.do?linkIndex=5'/>">모바일 표준프레임워크 가이드</a>
                                            </td>
                                            <td>321</td>
                                            <td>8MB</td>
                                            <td>2026-01-06</td>
                                        </tr>
                                        <tr>
                                            <td><strong>1</strong></td>
                                            <td class="align_left">
                                                <a href="<c:url value='/EgovPageLink.do?linkIndex=5'/>">표준프레임워크 아키텍처 설명서</a>
                                            </td>
                                            <td>198</td>
                                            <td>5MB</td>
                                            <td>2026-01-05</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--// 자료 목록 테이블 -->

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

                            <!-- 자료 올리기 버튼 -->
                            <div class="btn_area">
                                <a href="<c:url value='/EgovPageLink.do?linkIndex=6'/>" class="btn_upload">📤 자료 올리기</a>
                            </div>
                            <!--// 자료 올리기 버튼 -->

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