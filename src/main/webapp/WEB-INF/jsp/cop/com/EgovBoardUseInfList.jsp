<%--
  Class Name : EgovBoardUseInfList.jsp
  Description : 게시판 사용정보 목록화면
  Modification Information
 
    수정일        수정자        수정내용
    ----------  --------    ---------------------------
    2009.04.02  이삼섭        최초 생성
    2011.08.31  JJY         경량환경 버전 생성
    2026.01.12  신용호        신규 디자인 적용
 
    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.04.02 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 사용정보 조회 - 표준프레임워크 심플 홈페이지템플릿</title>
    <link rel="stylesheet" href="<c:url value='/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/layout.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/component.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/page.css'/>">
    <script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="<c:url value='/js/ui.js'/>"></script>

<script type="text/javascript">
    function press(event) {
        if (event.keyCode == 13) {
            fn_egov_select_bbsUseInfs('1');
        }
    }

    function fn_egov_select_bbsUseInfs(pageNo) {
        document.frm.pageIndex.value = pageNo;
        document.frm.action = "<c:url value='/cop/com/selectBBSUseInfs.do'/>";
        document.frm.submit();
    }

    function fn_egov_insert_addbbsUseInf() {
        document.frm.action = "<c:url value='/cop/com/addBBSUseInf.do'/>";
        document.frm.submit();
    }

    function fn_egov_select_bbsUseInf(bbsId, trgetId) {
        document.frm.bbsId.value = bbsId;
        document.frm.trgetId.value = trgetId;
        document.frm.action = "<c:url value='/cop/com/selectBBSUseInf.do'/>";
        document.frm.submit();
    }

    function linkPage(pageNo) {
        fn_egov_select_bbsUseInfs(pageNo);
    }
</script>

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
                                    <li><a href="#">사이트관리</a></li>
                                    <li>게시판사용관리</li>
                                </ul>
                            </div>
                            <!--// Location -->

                            <h1 class="tit_1">사이트관리</h1>
                            <p class="txt_1">게시판 사용정보 목록입니다.</p>
                            <h2 class="tit_2">게시판 사용정보 조회</h2>

                            <form name="frm" method="post" action="<c:url value='/cop/com/selectBBSUseInfs.do'/>">
                                <input type="hidden" name="bbsId">
                                <input type="hidden" name="trgetId">
                                <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

                                <!-- 검색조건 -->
                                <div class="condition">
                                    <label class="item f_select" for="searchCnd">
                                        <select id="searchCnd" name="searchCnd" title="검색조건 선택">
                                            <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if>>게시판명</option>
                                        </select>
                                    </label>

                                    <span class="item f_search">
                                        <input class="f_input w_500" id="searchWrd" name="searchWrd" type="text" value="<c:out value='${searchVO.searchWrd}'/>" title="검색어 입력" maxlength="35" onkeypress="press(event);">
                                        <button class="btn" type="submit" onclick="fn_egov_select_bbsUseInfs('1'); return false;">조회</button>
                                    </span>

                                    <a href="<c:url value='/cop/com/addBBSUseInf.do'/>" class="item btn btn_blue_46 w_100" onclick="fn_egov_insert_addbbsUseInf(); return false;">등록</a>
                                </div>
                                <!--// 검색조건 -->

                                <!-- 게시판 -->
                                <div class="board_list">
                                    <table>
                                        <caption>게시판 사용정보 목록</caption>
                                        <colgroup>
                                            <col style="width: 8%;">
                                            <col style="width: auto;">
                                            <col style="width: 15%;">
                                            <col style="width: 15%;">
                                            <col style="width: 15%;">
                                            <col style="width: 10%;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th scope="col">번호</th>
                                                <th scope="col">게시판명</th>
                                                <th scope="col">사용 커뮤니티 명</th>
                                                <th scope="col">사용 동호회 명</th>
                                                <th scope="col">등록일시</th>
                                                <th scope="col">사용여부</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="result" items="${resultList}" varStatus="status">
                                            <tr>
                                                <td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
                                                <td class="al">
                                                    <a href="<c:url value='/cop/com/selectBBSUseInf.do'/>?bbsId=<c:out value='${result.bbsId}'/>&amp;trgetId=<c:out value='${result.trgetId}'/>" class="lnk">
                                                        <c:out value="${result.bbsNm}"/>
                                                    </a>
                                                </td>
                                                <td><c:out value="${result.cmmntyNm}"/></td>
                                                <td><c:out value="${result.clbNm}"/></td>
                                                <td><c:out value="${result.frstRegisterPnttm}"/></td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${result.useAt == 'Y'}">
                                                            <span class="badge badge_active"><spring:message code="button.use" /></span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge badge_inactive"><spring:message code="button.notUsed" /></span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                            </c:forEach>
                                            
                                            <c:if test="${fn:length(resultList) == 0}">
                                            <tr>
                                                <td colspan="6"><spring:message code="common.nodata.msg" /></td>
                                            </tr>
                                            </c:if>
                                        </tbody>
                                    </table>
                                </div>

                                <!-- 페이징 -->
                                <div class="board_list_bot">
                                    <div class="paging" id="paging_div">
                                        <ul>
                                            <ui:pagination paginationInfo="${paginationInfo}" type="renew" jsFunction="linkPage" />
                                        </ul>
                                    </div>
                                </div>
                                <!--// 페이징 -->
                            </form>
                            <!--// 게시판 -->

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