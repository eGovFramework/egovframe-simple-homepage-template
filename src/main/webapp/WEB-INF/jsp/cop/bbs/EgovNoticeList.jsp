<%--
  Class Name : EgovNoticeList.jsp
  Description : 게시물 목록화면
  Modification Information
 
    수정일        수정자        수정내용
    ----------  --------    ---------------------------
    2009.03.19  이삼섭        최초 생성
    2011.08.31  JJY         경량환경 버전 생성
    2026.01.12  신용호        신규 디자인 적용
 
    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.03.19  
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/cop/bbs/"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${brdMstrVO.bbsNm}"/> 목록 - 표준프레임워크 심플 홈페이지템플릿</title>
    <link rel="stylesheet" href="<c:url value='/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/layout.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/component.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/page.css'/>">
    <script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="<c:url value='/js/ui.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>

<c:choose>
<c:when test="${preview == 'true'}">
<script type="text/javascript">
    function press(event) {}
    function fn_egov_addNotice() {}
    function fn_egov_select_noticeList(pageNo) {}
    function fn_egov_inqire_notice(nttId, bbsId) {}
    function linkPage(pageNo) {}
</script>
</c:when>
<c:otherwise>
<script type="text/javascript">
    function press(event) {
        if (event.keyCode == 13) {
            fn_egov_select_noticeList('1');
        }
    }

    function fn_egov_addNotice() {
        document.frm.action = "<c:url value='/cop/bbs${prefix}/addBoardArticle.do'/>";
        document.frm.submit();
    }
    
    function fn_egov_select_noticeList(pageNo) {
        document.frm.pageIndex.value = pageNo;
        document.frm.action = "<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>";
        document.frm.submit();  
    }
    
    function fn_egov_inqire_notice(nttId, bbsId) {
        document.subForm.nttId.value = nttId;
        document.subForm.bbsId.value = bbsId;
        document.subForm.action = "<c:url value='/cop/bbs${prefix}/selectBoardArticle.do'/>";
        document.subForm.submit();          
    }
    
    function linkPage(pageNo) {
        fn_egov_select_noticeList(pageNo);
    }
</script>
</c:otherwise>
</c:choose>

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
                                    <li><a href="#">알림마당</a></li>
                                    <li><c:out value="${brdMstrVO.bbsNm}"/></li>
                                </ul>
                            </div>
                            <!--// Location -->

                            <h1 class="tit_1">알림마당</h1>
                            <p class="txt_1"><c:out value="${brdMstrVO.bbsNm}"/> 목록입니다.</p>
                            <h2 class="tit_2"><c:out value="${brdMstrVO.bbsNm}"/></h2>

                            <form name="frm" action="<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>" method="get">
                                <input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
                                <input type="hidden" name="nttId" value="0" />
                                <input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
                                <input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
                                <input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
                                <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
                                <input name="menuNo" type="hidden" value="<c:out value="${searchVO.menuNo}" />">

                                <!-- 검색조건 -->
                                <div class="condition">
                                    <label class="item f_select" for="searchCnd">
                                        <select name="searchCnd" id="searchCnd" title="검색조건 선택">
                                            <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if>>제목</option>
                                            <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if>>내용</option>
                                            <option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if>>작성자</option>
                                        </select>
                                    </label>

                                    <span class="item f_search">
                                        <input class="f_input w_500" name="searchWrd" type="text" value="<c:out value='${searchVO.searchWrd}'/>" title="검색어 입력" maxlength="35" onkeypress="press(event);">
                                        <button class="btn" type="submit" onclick="fn_egov_select_noticeList('1'); return false;">조회</button>
                                    </span>

                                    <% if(null != session.getAttribute("LoginVO")){ %>
                                    <c:if test="${brdMstrVO.authFlag == 'Y'}">
                                        <a href="<c:url value='/cop/bbs${prefix}/addBoardArticle.do'/>?bbsId=<c:out value='${boardVO.bbsId}'/>&searchCnd=<c:out value='${boardVO.searchCnd}'/>&searchWrd=<c:out value='${boardVO.searchWrd}'/>&pageIndex=<c:out value='${boardVO.pageIndex}'/>&menuNo=<c:out value='${param.menuNo}'/>" class="item btn btn_blue_46 w_100">등록</a>
                                    </c:if>
                                    <% } %>
                                </div>
                                <!--// 검색조건 -->

                                <!-- 게시판 -->
                                <div class="board_list">
                                    <table>
                                        <caption>게시물 목록</caption>
                                        <colgroup>
                                            <col style="width: 10%;">
                                            <col style="width: auto;">
                                            <c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
                                                <col style="width: 12%;">
                                                <col style="width: 12%;">
                                            </c:if>
                                            <c:if test="${anonymous != 'true'}">
                                                <col style="width: 10%;">
                                            </c:if>
                                            <col style="width: 12%;">
                                            <col style="width: 8%;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th scope="col">번호</th>
                                                <th scope="col">제목</th>
                                                <c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
                                                    <th scope="col">게시시작일</th>
                                                    <th scope="col">게시종료일</th>
                                                </c:if>
                                                <c:if test="${anonymous != 'true'}">
                                                    <th scope="col">작성자</th>
                                                </c:if>
                                                <th scope="col">작성일</th>
                                                <th scope="col">조회수</th>
                                            </tr>
                                        </thead>
                                        <tbody>                 
                                            <c:forEach var="result" items="${resultList}" varStatus="status">
                                            <tr>
                                                <td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
                                                <td class="al">
                                                    <c:if test="${result.replyLc != 0}">
                                                        <c:forEach begin="0" end="${result.replyLc}" step="1">&nbsp;</c:forEach>
                                                        <img src="<c:url value='/images/reply_arrow.gif'/>" class="re" alt="답글"/>
                                                    </c:if>
                                                    <c:choose>
                                                        <c:when test="${result.isExpired=='Y' || result.useAt == 'N'}">
                                                            <c:out value="${result.nttSj}" />
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="#LINK" class="lnk" 
                                                               data-ntt-id="<c:out value='${result.nttId}'/>" 
                                                               data-bbs-id="<c:out value='${result.bbsId}'/>"
                                                               onclick="fn_egov_inqire_notice(this.getAttribute('data-ntt-id'), this.getAttribute('data-bbs-id')); return false;">
                                                                <c:out value="${result.nttSj}"/>
                                                            </a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
                                                    <td><c:out value="${result.ntceBgnde}"/></td>
                                                    <td><c:out value="${result.ntceEndde}"/></td>
                                                </c:if>
                                                <c:if test="${anonymous != 'true'}">
                                                    <td><c:out value="${result.frstRegisterNm}"/></td>
                                                </c:if>
                                                <td><c:out value="${result.frstRegisterPnttm}"/></td>
                                                <td><c:out value="${result.inqireCo}"/></td>
                                            </tr>
                                            </c:forEach>
                                            
                                            <c:if test="${fn:length(resultList) == 0}">
                                            <tr>
                                                <c:choose>
                                                    <c:when test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
                                                        <td colspan="7"><spring:message code="common.nodata.msg" /></td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:choose>
                                                            <c:when test="${anonymous == 'true'}">
                                                                <td colspan="4"><spring:message code="common.nodata.msg" /></td>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <td colspan="5"><spring:message code="common.nodata.msg" /></td>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:otherwise>
                                                </c:choose>
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

<!-- 게시글 상세보기용 숨겨진 폼 -->
<form name="subForm" method="get" action="<c:url value='/cop/bbs${prefix}/selectBoardArticle.do'/>">
    <input type="hidden" name="nttId" value="" />
    <input type="hidden" name="bbsId" value="" />
    <input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
    <input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
    <input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
    <input type="hidden" name="searchCnd" value="<c:out value='${searchVO.searchCnd}'/>" />
    <input type="hidden" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
    <input type="hidden" name="menuNo" value="<c:out value='${searchVO.menuNo}'/>" />
</form>

</body>
</html>