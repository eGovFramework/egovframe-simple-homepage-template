<%--
  Class Name : EgovIndvdlSchdulManageDetail.jsp
  Description : 일정관리 상세보기
  Modification Information
 
    수정일        수정자        수정내용
    ----------  --------    ---------------------------
    2008.03.09  장동한        최초 생성
    2011.08.31  JJY         경량환경 버전 생성
    2026.01.12  신용호        신규 디자인 적용
 
    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09
   
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="egovc" uri="/WEB-INF/tlds/egovc.tld" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<%
String sLinkType = request.getParameter("linkType") == null ? "" : (String)request.getParameter("linkType");
%>
<c:set var="sLinkType" value="<%=sLinkType %>"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일정 상세</title>
    <link rel="stylesheet" href="<c:url value='/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/layout.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/component.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/page.css'/>">
    <script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="<c:url value='/js/ui.js'/>"></script>

<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_IndvdlSchdulManage(){

}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_IndvdlSchdulManage(){
    <%-- 일정목록 이동 --%>
    <c:if test="${sLinkType eq ''}">
    history.back();
    </c:if>
    
    <%-- 전체일정목록 이동 --%>
    <c:if test="${sLinkType eq 'asm'}">
        location.href = "<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageMonthList.do'/>";
    </c:if>
}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_modify_IndvdlSchdulManage(){
    var vFrom = document.IndvdlSchdulManageForm;
    vFrom.cmd.value = '';
    vFrom.action = "<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageModify.do'/>";
    vFrom.submit();
}

/* ********************************************************
 * 삭제처리
 ******************************************************** */
function fn_egov_delete_IndvdlSchdulManage(){
    var vFrom = document.IndvdlSchdulManageForm;
    if(confirm("삭제 하시겠습니까?")){
        vFrom.cmd.value = 'del';
        vFrom.action = "<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDetail.do'/>";
        vFrom.submit();
    }else{
        vFrom.cmd.value = '';
    }
}
</script>

</head>
<body onLoad="fn_egov_init_IndvdlSchdulManage();">
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
                                    <li><a class="home" href="<c:url value='/'/>">Home</a></li>
                                    <li><a href="">사용자관리</a></li>
                                    <li>일정관리 상세보기</li>
                                </ul>
                            </div>
                            <!--// Location -->

                            <h1 class="tit_1">사용자관리</h1>

                            <p class="txt_1">일정 정보를 상세하게 확인할 수 있습니다.</p>

                            <h2 class="tit_2">일정관리 상세보기</h2>

                            <form name="IndvdlSchdulManageForm" id="IndvdlSchdulManageForm" 
                                action="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDetail.do'/>" method="post">
                                
                                <input name="schdulId" type="hidden" value="${resultList[0].schdulId}">
                                <input name="linkType" type="hidden" value="${sLinkType}">
                                <input name="cmd" type="hidden" value=""/>

                                <!-- 일정 상세정보 -->
                                <div class="board_view2">
                                    <table>
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label>일정구분</label>
                                            </td>
                                            <td>
                                                <c:forEach items="${schdulSe}" var="schdulSeInfo" varStatus="status">
                                                    <c:if test="${schdulSeInfo.code eq resultList[0].schdulSe}">    
                                                        <c:out value="${fn:replace(schdulSeInfo.codeNm , crlf , '<br/>')}" escapeXml="false" />
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label>중요도</label>
                                            </td>
                                            <td>
                                                <c:forEach items="${schdulIpcrCode}" var="schdulSeInfo" varStatus="status">
                                                    <c:if test="${schdulSeInfo.code eq resultList[0].schdulIpcrCode}">  
                                                        <c:out value="${fn:replace(schdulSeInfo.codeNm , crlf , '<br/>')}" escapeXml="false" />
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label>부서</label>
                                            </td>
                                            <td>
                                                <c:out value="${fn:replace(resultList[0].schdulDeptName , crlf , '<br/>')}" escapeXml="false" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label>일정명</label>
                                            </td>
                                            <td>
                                                <c:out value="${fn:replace(resultList[0].schdulNm , crlf , '<br/>')}" escapeXml="false" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label>일정 내용</label>
                                            </td>
                                            <td>
                                                <div style="min-height: 100px; white-space: pre-wrap;"><c:out value="${fn:replace(resultList[0].schdulCn , crlf , '<br/>')}" escapeXml="false" /></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label>반복구분</label>
                                            </td>
                                            <td>
                                                <c:forEach items="${reptitSeCode}" var="schdulSeInfo" varStatus="status">
                                                    <c:if test="${fn:trim(schdulSeInfo.code) eq fn:trim(resultList[0].reptitSeCode)}">    
                                                        <c:out value="${fn:replace(schdulSeInfo.codeNm , crlf , '<br/>')}" escapeXml="false" />
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label>날짜/시간</label>
                                            </td>
                                            <td>
                                                <strong>
                                                    ${fn:substring(resultList[0].schdulBgnde, 0, 4)}-${fn:substring(resultList[0].schdulBgnde, 4, 6)}-${fn:substring(resultList[0].schdulBgnde, 6, 8)} 
                                                    ${fn:substring(resultList[0].schdulBgnde, 8, 10)}:${fn:substring(resultList[0].schdulBgnde, 10, 12)}
                                                </strong>
                                                <span style="margin: 0 10px;">~</span>
                                                <strong>
                                                    ${fn:substring(resultList[0].schdulEndde, 0, 4)}-${fn:substring(resultList[0].schdulEndde, 4, 6)}-${fn:substring(resultList[0].schdulEndde, 6, 8)} 
                                                    ${fn:substring(resultList[0].schdulEndde, 8, 10)}:${fn:substring(resultList[0].schdulEndde, 10, 12)}
                                                </strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label>담당자</label>
                                            </td>
                                            <td>
                                                <c:out value="${fn:replace(resultList[0].schdulChargerName , crlf , '<br/>')}" escapeXml="false" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label>파일첨부</label>
                                            </td>
                                            <td>
                                                <c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfs.do">
                                                    <c:param name="param_atchFileId" value="${egovc:encrypt(resultList[0].atchFileId)}" />
                                                </c:import>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <!--// 일정 상세정보 -->

                                <!-- 버튼 영역 -->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                        <% if(null != session.getAttribute("LoginVO")){ %>
                                        <a href="#LINK" class="btn btn_skyblue_h46 w_100" 
                                            onclick="JavaScript:fn_egov_delete_IndvdlSchdulManage(); return false;">
                                            <spring:message code="button.delete" />
                                        </a>
                                        <% } %>
                                    </div>

                                    <div class="right_col btn1">
                                        <% if(null != session.getAttribute("LoginVO")){ %>
                                        <a href="#LINK" class="btn btn_blue_46 w_100" 
                                            onclick="JavaScript:fn_egov_modify_IndvdlSchdulManage(); return false;">
                                            <spring:message code="button.update" />
                                        </a>
                                        <% } %>
                                        <a href="#LINK" class="btn btn_blue_46 w_100" 
                                            onclick="JavaScript:fn_egov_list_IndvdlSchdulManage(); return false;">
                                            <spring:message code="button.list" />
                                        </a>
                                    </div>
                                </div>
                                <!--// 버튼 영역 -->

                            </form>

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
