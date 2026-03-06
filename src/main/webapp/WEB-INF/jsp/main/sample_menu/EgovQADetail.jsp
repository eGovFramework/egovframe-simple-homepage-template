<%--
  Class Name : EgovQADetail.jsp
  Description : 샘플화면 - 묻고답하기 상세조회(sample)
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
    <title>Q&A 상세 - 표준프레임워크 심플 홈페이지템플릿</title>
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
                                    <li><a href="<c:url value='/EgovPageLink.do?linkIndex=16'/>">묻고답하기</a></li>
                                    <li>상세보기</li>
                                </ul>
                            </div>
                            <!--// Location -->

                            <h1 class="tit_1">고객지원</h1>
                            <p class="txt_1">Q&A 상세 정보입니다.</p>
                            <h2 class="tit_2">Q&A 상세</h2>
                            <!-- Q&A 정보 테이블 -->
                            <div class="specs_table" style="margin-top: 30px;">
                                <table>
                                    <caption>Q&A 상세정보</caption>
                                    <colgroup>
                                        <col style="width: 120px;">
                                        <col style="width: auto;">
                                        <col style="width: 120px;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>제목</th>
                                            <td colspan="3">JSP 파일을 찾을 수 없습니다</td>
                                        </tr>
                                        <tr>
                                            <th>작성자</th>
                                            <td>박성환</td>
                                            <th>이메일</th>
                                            <td>agits@nate.com</td>
                                        </tr>
                                        <tr>
                                            <th>작성일</th>
                                            <td>2026-01-09</td>
                                            <th>조회수</th>
                                            <td>1,222</td>
                                        </tr>
                                        <tr>
                                            <th>처리상태</th>
                                            <td><span style="display: inline-block; padding: 4px 12px; background: #e3f2fd; color: #169bd5; border-radius: 4px; font-size: 13px;">답변완료</span></td>
                                            <th>답변요청</th>
                                            <td><span style="display: inline-block; padding: 4px 12px; background: #e8f5e9; color: #4caf50; border-radius: 4px; font-size: 13px;">이메일 답변</span></td>
                                        </tr>
                                        <tr>
                                            <th>전화</th>
                                            <td>010-1234-5678</td>
                                            <th>등록일자</th>
                                            <td>2026-01-09 14:30:00</td>
                                        </tr>
                                        <tr>
                                            <th>첨부파일</th>
                                            <td colspan="3">
                                                <a href="#" style="color: #169bd5; text-decoration: none;">
                                                    error_log.txt <span style="color: #999;">[85,320 byte]</span>
                                                </a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--// Q&A 정보 테이블 -->

                            <!-- 질문 내용 -->
                            <div class="description_section">
                                <h3>질문 내용</h3>
                                <div class="description_content">
안녕하세요. 웹 호스팅에 배포했더니 JSP 파일에서 오류가 발생합니다.

JSP 파일을 찾지 못하는 것 같은데, web.xml 파일을 수정해야 하나요?

<strong>오류 메시지:</strong>
심각: Servlet.service() for servlet action threw exception

javax.servlet.ServletException: Could not get RequestDispatcher for 
[/WEB-INF/jsp/egovframework//main/main.jsp]: check that this file exists within your WAR
    at org.springframework.web.servlet.view.InternalResourceView.renderMergedOutputModel
    (InternalResourceView.java:217)

도움 부탁드립니다.
                                </div>
                            </div>
                            <!--// 질문 내용 -->

                            <!-- 답변 목록 -->
                            <div class="description_section">
                                <h3>답변 <span style="color: #169bd5;">(3)</span></h3>
                                
                                <!-- 답변 1 -->
                                <div style="margin-bottom: 20px; padding: 25px; background: #f8f9fa; border-left: 4px solid #169bd5; border-radius: 8px;">
                                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px;">
                                        <div>
                                            <strong style="color: #222; font-size: 16px;">chanjin</strong>
                                            <span style="color: #999; font-size: 14px; margin-left: 10px;">2026-01-09 15:30:00</span>
                                        </div>
                                        <button style="padding: 6px 15px; background: #dc3545; color: #fff; border: none; border-radius: 5px; cursor: pointer; font-size: 13px;">삭제</button>
                                    </div>
                                    <div style="color: #555; line-height: 1.8;">
                                        <p>경로 설정을 확인해보세요. 경로에 슬래시(//)가 중복되어 있는 것 같습니다.</p>
                                        <p>'/WEB-INF/jsp/egovframework//main/main.jsp'에서 egovframework 뒤에 슬래시가 두 개 있네요.</p>
                                        <p>servlet-context.xml 또는 관련 설정 파일에서 ViewResolver의 prefix 설정을 확인해보시기 바랍니다.</p>
                                    </div>
                                </div>

                                <!-- 답변 2 -->
                                <div style="margin-bottom: 20px; padding: 25px; background: #f8f9fa; border-left: 4px solid #4caf50; border-radius: 8px;">
                                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px;">
                                        <div>
                                            <strong style="color: #222; font-size: 16px;">sunrise</strong>
                                            <span style="color: #999; font-size: 14px; margin-left: 10px;">2026-01-09 16:15:00</span>
                                        </div>
                                        <button style="padding: 6px 15px; background: #dc3545; color: #fff; border: none; border-radius: 5px; cursor: pointer; font-size: 13px;">삭제</button>
                                    </div>
                                    <div style="color: #555; line-height: 1.8;">
                                        <p>Tomcat 서버를 재시작해보세요. 저는 그렇게 하니까 해결되었습니다.</p>
                                        <p>또한 WAR 파일에 해당 JSP 파일이 제대로 포함되어 있는지도 확인해보시기 바랍니다.</p>
                                    </div>
                                </div>

                                <!-- 답변 3 -->
                                <div style="margin-bottom: 20px; padding: 25px; background: #f8f9fa; border-left: 4px solid #ff9800; border-radius: 8px;">
                                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px;">
                                        <div>
                                            <strong style="color: #222; font-size: 16px;">auto</strong>
                                            <span style="color: #999; font-size: 14px; margin-left: 10px;">2026-01-09 17:00:00</span>
                                        </div>
                                        <button style="padding: 6px 15px; background: #dc3545; color: #fff; border: none; border-radius: 5px; cursor: pointer; font-size: 13px;">삭제</button>
                                    </div>
                                    <div style="color: #555; line-height: 1.8;">
                                        <p>제가 직접 살펴볼게요. 로그 파일을 메일로 보내주세요.</p>
                                        <p>test@naver.com</p>
                                    </div>
                                </div>
                            </div>
                            <!--// 답변 목록 -->

                            <!-- 답변 작성 -->
                            <div class="description_section">
                                <h3>답변 작성</h3>
                                <div style="padding: 30px; background: #f8f9fa; border-radius: 10px;">
                                    <textarea 
                                        style="width: 100%; min-height: 150px; padding: 15px; border: 1px solid #ddd; border-radius: 8px; font-size: 14px; line-height: 1.6; resize: vertical;" 
                                        placeholder="답변을 입력하세요..."></textarea>
                                    <div style="margin-top: 15px; text-align: right;">
                                        <button style="padding: 12px 30px; background: #169bd5; color: #fff; border: none; border-radius: 8px; font-size: 15px; font-weight: 600; cursor: pointer; transition: all 0.3s;">답변 등록</button>
                                    </div>
                                </div>
                            </div>
                            <!--// 답변 작성 -->

                            <!-- 목록 버튼 -->
                            <div class="btn_list">
                                <a href="<c:url value='/EgovPageLink.do?linkIndex=16'/>">목록</a>
                            </div>
                            <!--// 목록 버튼 -->

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