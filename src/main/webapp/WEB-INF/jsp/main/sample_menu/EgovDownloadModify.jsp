<%--
  Class Name : EgovDownloadModify.jsp
  Description : 샘플화면 - 자료실 등록(sample)
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
    <title>자료 등록 - 표준프레임워크 심플 홈페이지템플릿</title>
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
                                    <li><a href="<c:url value='/EgovPageLink.do?menuNo=31&linkIndex=15'/>">고객지원</a></li>
                                    <li><a href="<c:url value='/EgovPageLink.do?linkIndex=15'/>">자료실</a></li>
                                    <li>자료 등록</li>
                                </ul>
                            </div>
                            <!--// Location -->

                            <h1 class="tit_1">고객지원</h1>
                            <p class="txt_1">자료실 등록 및 수정 페이지입니다.</p>
                            <h2 class="tit_2">자료 등록</h2>

                            <!-- Form Section -->
                            <form class="modify_form">
                                <!-- Basic Info -->
                                <div class="form_section">
                                    <div class="form_header">
                                        <label for="program_name" class="required">프로그램명</label>
                                    </div>
                                    <div class="form_content">
                                        <input type="text" id="program_name" name="program_name" class="input_text_full" placeholder="프로그램명을 입력하세요">
                                    </div>
                                </div>

                                <div class="form_section">
                                    <div class="form_header">
                                        <label>작성 정보</label>
                                    </div>
                                    <div class="form_content form_meta">
                                        <span class="meta_item">작성자 : <strong>innovate</strong></span>
                                        <span class="meta_item">작성일 : <strong>2026-01-12 14:30:00</strong></span>
                                    </div>
                                </div>

                                <!-- Thumbnail Upload -->
                                <div class="form_section">
                                    <div class="form_header">
                                        <label for="thumbnail">썸네일 이미지</label>
                                    </div>
                                    <div class="form_content">
                                        <div class="thumbnail_upload">
                                            <div class="thumbnail_preview">
                                                <img src="<c:url value='/images/sample/img_download.gif'/>" alt="썸네일 미리보기" id="preview_img">
                                            </div>
                                            <div class="thumbnail_info">
                                                <p class="info_text">썸네일 이미지는 <strong>width: 160px, height: 109px</strong> 크기의 이미지를 올려주세요.</p>
                                                <input type="file" id="thumbnail" name="thumbnail" class="input_file" accept="image/*">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Specification Table -->
                                <div class="form_section">
                                    <div class="form_header">
                                        <label>상세 정보</label>
                                    </div>
                                    <div class="form_content">
                                        <table class="form_table">
                                            <colgroup>
                                                <col style="width: 20%;">
                                                <col style="width: 80%;">
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th><label for="os" class="required">운영체제</label></th>
                                                    <td><input type="text" id="os" name="os" class="input_text" placeholder="예: Windows 10, macOS, Linux"></td>
                                                </tr>
                                                <tr>
                                                    <th><label for="spec" class="required">권장사양</label></th>
                                                    <td><input type="text" id="spec" name="spec" class="input_text" placeholder="예: CPU 2GHz 이상, RAM 4GB 이상"></td>
                                                </tr>
                                                <tr>
                                                    <th><label for="file" class="required">파일정보</label></th>
                                                    <td><input type="file" id="file" name="file" class="input_file"></td>
                                                </tr>
                                                <tr>
                                                    <th><label for="filesize">파일크기</label></th>
                                                    <td><input type="text" id="filesize" name="filesize" class="input_text" value="13.0MB (13,670,274 바이트)" readonly></td>
                                                </tr>
                                                <tr>
                                                    <th><label for="reg_date" class="required">등록일자</label></th>
                                                    <td><input type="date" id="reg_date" name="reg_date" class="input_text"></td>
                                                </tr>
                                                <tr>
                                                    <th><label for="language" class="required">언어</label></th>
                                                    <td><input type="text" id="language" name="language" class="input_text" placeholder="예: 한국어, 영어"></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <!-- Description Section -->
                                <div class="form_section">
                                    <div class="form_header">
                                        <label for="description" class="required">자료 설명</label>
                                    </div>
                                    <div class="form_content">
                                        <textarea id="description" name="description" class="textarea_full" rows="14" placeholder="자료에 대한 상세 설명을 입력하세요."></textarea>
                                    </div>
                                </div>

                                <!-- Form Actions -->
                                <div class="form_actions">
                                    <a href="<c:url value='/EgovPageLink.do?menuNo=31&linkIndex=15'/>" class="btn btn_outline">취소</a>
                                    <button type="submit" class="btn btn_primary">등록</button>
                                </div>
                            </form>
                            <!--// Form Section -->

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