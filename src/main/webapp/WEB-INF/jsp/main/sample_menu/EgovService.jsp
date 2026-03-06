<%--
  Class Name : EgovService.jsp
  Description : 샘플화면 - 서비스신청 안내화면(sample)
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
    <title>서비스신청 - 표준프레임워크 심플 홈페이지템플릿</title>
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
                                    <li>서비스신청</li>
                                </ul>
                            </div>
                            <!--// Location -->

                            <h1 class="tit_1">고객지원</h1>
                            <p class="txt_1">표준프레임워크 경량환경의 다양한 서비스를 신청하실 수 있습니다.</p>
                            <h2 class="tit_2">서비스 신청</h2>

                            <!-- 서비스 신청 안내 -->
                            <div class="intro_box">
                                <p>
                                    <strong>표준프레임워크 서비스 신청 절차</strong><br>
                                    필요하신 서비스가 있으시면 아래의 절차에 따라 신청해 주시기 바랍니다.
                                </p>
                            </div>

                            <!-- 신청 절차 -->
                            <div class="service_group" style="margin-top: 40px;">
                                <h4>서비스 신청 절차</h4>
                                <div class="service_list">
                                    <div style="position: relative; padding: 20px 20px 20px 80px; margin-bottom: 15px; background: #fff; border-radius: 8px; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">
                                        <div style="position: absolute; left: 20px; top: 50%; transform: translateY(-50%); width: 50px; height: 50px; display: flex; align-items: center; justify-content: center; background: linear-gradient(135deg, #169bd5 0%, #1282b8 100%); color: #fff; border-radius: 50%; font-size: 24px; font-weight: 700;">1</div>
                                        <strong style="display: block; margin-bottom: 8px; color: #222; font-size: 18px;">필요한 서비스 확인</strong>
                                        <p style="color: #666; line-height: 1.6; margin: 0;">제공되는 서비스 목록을 확인하시고 필요하신 서비스를 선택합니다.</p>
                                    </div>
                                    
                                    <div style="position: relative; padding: 20px 20px 20px 80px; margin-bottom: 15px; background: #fff; border-radius: 8px; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">
                                        <div style="position: absolute; left: 20px; top: 50%; transform: translateY(-50%); width: 50px; height: 50px; display: flex; align-items: center; justify-content: center; background: linear-gradient(135deg, #169bd5 0%, #1282b8 100%); color: #fff; border-radius: 50%; font-size: 24px; font-weight: 700;">2</div>
                                        <strong style="display: block; margin-bottom: 8px; color: #222; font-size: 18px;">자료실에서 관련 자료 확인</strong>
                                        <p style="color: #666; line-height: 1.6; margin: 0;">자료실에서 필요한 서비스의 존재 여부와 관련 문서를 확인합니다.</p>
                                    </div>
                                    
                                    <div style="position: relative; padding: 20px 20px 20px 80px; margin-bottom: 15px; background: #fff; border-radius: 8px; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">
                                        <div style="position: absolute; left: 20px; top: 50%; transform: translateY(-50%); width: 50px; height: 50px; display: flex; align-items: center; justify-content: center; background: linear-gradient(135deg, #169bd5 0%, #1282b8 100%); color: #fff; border-radius: 50%; font-size: 24px; font-weight: 700;">3</div>
                                        <strong style="display: block; margin-bottom: 8px; color: #222; font-size: 18px;">서비스 신청서 작성</strong>
                                        <p style="color: #666; line-height: 1.6; margin: 0;">서비스 요청 양식을 작성하여 필요한 서비스를 신청합니다.</p>
                                    </div>
                                </div>
                            </div>

                            <!-- 제공 서비스 -->
                            <div style="margin-top: 50px;">
                                <h3 class="tit_3">제공 서비스</h3>
                                <div class="framework_structure">
                                    <div class="framework_item">
                                        <h4>기술 지원</h4>
                                        <p>표준프레임워크 사용 중 발생하는 기술적인 문제에 대한 지원을 제공합니다.</p>
                                    </div>
                                    <div class="framework_item">
                                        <h4>교육 서비스</h4>
                                        <p>표준프레임워크 활용을 위한 교육 프로그램을 제공합니다.</p>
                                    </div>
                                    <div class="framework_item">
                                        <h4>컨설팅</h4>
                                        <p>프로젝트 적용을 위한 전문 컨설팅 서비스를 제공합니다.</p>
                                    </div>
                                    <div class="framework_item">
                                        <h4>커스터마이징</h4>
                                        <p>특정 요구사항에 맞는 커스터마이징 지원을 제공합니다.</p>
                                    </div>
                                </div>
                            </div>

                            <!-- 버튼 영역 -->
                            <div style="margin-top: 50px; text-align: center;">
                                <a href="<c:url value='/EgovPageLink.do?linkIndex=8'/>" 
                                   style="display: inline-block; padding: 15px 40px; background: #169bd5; color: #fff; text-decoration: none; border-radius: 8px; font-size: 16px; font-weight: 700; transition: all 0.3s; box-shadow: 0 2px 8px rgba(22, 155, 213, 0.3); margin-right: 15px;">
                                    대표서비스 자세히 보기
                                </a>
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