<%--
  Class Name : EgovLocation.jsp
  Description : 샘플화면 - 찾아오시는길(sample)
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
    <title>찾아오시는 길 - 표준프레임워크 심플 홈페이지템플릿</title>
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
                                    <li>찾아오시는 길</li>
                                </ul>
                            </div>
                            <!--// Location -->

                            <h1 class="tit_1">사이트소개</h1>

                            <p class="txt_1">표준프레임워크 심플 홈페이지 사이트를 소개합니다.</p>

                            <h2 class="tit_2">찾아오시는 길</h2>

                            <div class="map_image">
                                <img src="<c:url value='/images/map.png'/>" alt="표준프레임워크센터 위치 지도" />
                            </div>

                            <div class="location_info">
                                <h3>표준프레임워크센터 주소</h3>
                                <dl>
                                    <dt>도로명주소</dt>
                                    <dd>04513 서울특별시 중구 세종대로 39 대한서울상공회의소 7층</dd>
                                </dl>
                                <dl>
                                    <dt>지번주소</dt>
                                    <dd>04513 서울특별시 중구 남대문로4가 45 대한서울상공회의소 7층</dd>
                                </dl>

                                <div class="transport_section">
                                    <h4>지하철</h4>
                                    <ul>
                                        <li><strong>[1호선]</strong> 시청역 5번출구 → 시청삼거리에서 좌회전 → 서울파이낸스빌딩 옆</li>
                                        <li><strong>[2호선]</strong> 을지로입구역 1번출구 → 시청삼거리에서 우회전 → 맥도날드 건너편 (또는 시청역 9번 출구 5분거리)</li>
                                        <li><strong>[5호선]</strong> 광화문역 5번출구 → 동아일보사 건너편</li>
                                    </ul>

                                    <h4>버스</h4>
                                    <ul>
                                        <li>파이낸셜빌딩 앞 서울신문사 정류장 하차 → 청계천 방면 우회전 → 동아일보사 건너편</li>
                                        <li>중앙인사위원회 건물 우측 한국정보화진흥원 빌딩</li>
                                        <li>이용 가능 버스: 150, 162, 402, 0014, 0015, 1011, 1711, 7017, 7020, 7021</li>
                                    </ul>

                                    <h4>승용차</h4>
                                    <ul>
                                        <li>건물 뒷편 주차장 입구에서 차량용 리프트를 이용하여 지하 주차장에 주차</li>
                                        <li>엘리베이터를 이용하여 1층 안내데스크에서 안내를 받아주시기 바랍니다</li>
                                    </ul>

                                    <h4>공항에서 오시는 길 (KAL LIMOUSINE BUS)</h4>
                                    <ul>
                                        <li><strong>승차위치:</strong> 인천공항(동4B, 11A), 코리아나호텔 정문 앞</li>
                                        <li><strong>인천공항 → 코리아나호텔:</strong> 첫차 05:55 / 간격 15~30분 / 막차 22:25 / 소요시간 80분</li>
                                        <li><strong>코리아나호텔 → 인천공항:</strong> 첫차 05:55 / 간격 15~30분 / 막차 18:45 / 소요시간 80분</li>
                                        <li><strong>김포공항 → 인천공항:</strong> 첫차 05:00 / 간격 15~30분 / 막차 21:30 / 소요시간 40분</li>
                                        <li><strong>요금:</strong> 코리아나호텔 ↔ 인천공항 13,000원 / 김포공항 → 인천공항 6,000원</li>
                                    </ul>

                                    <h4>연락처</h4>
                                    <ul>
                                        <li><strong>전화:</strong> 1566-3598</li>
                                        <li><strong>이메일:</strong> egovframesupport@gmail.com</li>
                                    </ul>
                                </div>
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