<%--
  Class Name : EgovTemplateInqirePop.jsp
  Description : 템플릿 목록 조회 팝업화면
  Modification Information
 
    수정일        수정자        수정내용
    ----------  --------    ---------------------------
    2009.03.18  이삼섭        최초 생성
    2011.08.31  JJY         경량환경 버전 생성
    2026.01.12  신용호        신규 디자인 적용
 
    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.03.18 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>템플릿 목록</title>
    <link rel="stylesheet" href="<c:url value='/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/layout.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/component.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/page.css'/>">
    <script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="<c:url value='/js/ui.js'/>"></script>

<script type="text/javascript">
    function press(event) {
        if (event.keyCode==13) {
            fn_egov_select_tmplatInfo('1');
        }
    }
    
    function fn_egov_select_tmplatInfo(pageNo){
        document.frm.pageIndex.value = pageNo;
        document.frm.action = "<c:url value='/cop/com/selectTemplateInfsPop.do'/>";
        document.frm.submit();	
    }
    
    function fn_egov_returnTmplatInfo(tmplatId, tmplatNm){
        var retVal = tmplatId +"|"+tmplatNm;
        parent.fn_egov_returnValue(retVal);
    }
    
    /* ********************************************************
     * 취소처리
     ******************************************************** */
    function fn_egov_cancel_popup() {
        parent.fn_egov_modal_remove();
    }
</script>
</head>
<body>
    
    <form name="frm" method="post" action="<c:url value='/cop/com/selectTemplateInfsPop.do'/>">
    
    <input type="hidden" name="tmplatId" value="" />
    
    <!-- 템플릿 정보 팝업 -->
    <div class="popup EgovTemplateInqirePopup" style="background-color: white;">
        <div class="pop_inner">
            <div class="pop_header">
                <h1>템플릿 목록</h1>
                <button type="button" class="close" onclick="fn_egov_cancel_popup(); return false;">닫기</button>
            </div>

            <div class="pop_container">
                <!-- 검색조건 -->
                <div class="condition">
                    <label class="item f_select" for="searchCnd">
                        <select id="searchCnd" name="searchCnd" title="검색조건 선택">
                            <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if>>템플릿명</option>
                            <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if>>템플릿구분</option>
                        </select>
                    </label>

                    <span class="item f_search">
                        <input class="f_input w_500" id="searchWrd" name="searchWrd" title="검색어" type="text" 
                            value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);"/>
                        <button class="btn" type="submit" onclick="javascript:fn_egov_select_tmplatInfo('1'); return false;">
                            <spring:message code='button.inquire' />
                        </button>
                    </span>
                </div>
                <!--// 검색조건 -->

                <!-- 템플릿 목록 -->
                <div class="board_list">
                    <table>
                        <caption>템플릿 목록</caption>
                        <colgroup>
                            <col style="width: 80px;">
                            <col style="width: auto;">
                            <col style="width: 100px;">
                            <col style="width: 200px;">
                            <col style="width: 100px;">
                            <col style="width: 120px;">
                            <col style="width: 100px;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">템플릿명</th>
                                <th scope="col">템플릿구분</th>
                                <th scope="col">템플릿경로</th>
                                <th scope="col">사용여부</th>
                                <th scope="col">등록일자</th>
                                <th scope="col">선택</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${fn:length(resultList) == 0}">
                                <tr>
                                    <td colspan="7"><spring:message code="common.nodata.msg" /></td>
                                </tr>
                            </c:if>
                            
                            <c:forEach var="result" items="${resultList}" varStatus="status">
                            <tr>
                                <td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
                                <td class="al"><c:out value="${result.tmplatNm}"/></td>
                                <td><c:out value="${result.tmplatSeCodeNm}"/></td>
                                <td class="al"><c:out value="${result.tmplatCours}"/></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${result.useAt == 'Y'}">
                                            <span class="badge_active"><spring:message code="button.use" /></span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge_inactive"><spring:message code="button.notUsed" /></span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td><c:out value="${result.frstRegisterPnttm}"/></td>
                                <td>
                                    <c:if test="${result.useAt == 'Y'}">
                                        <a href="#LINK" class="btn btn_blue_30 w_80" 
                                            onclick="javascript:fn_egov_returnTmplatInfo('<c:out value="${result.tmplatId}"/>','<c:out value="${result.tmplatNm}"/>'); return false;">
                                            선택
                                        </a>
                                    </c:if>
                                    <c:if test="${result.useAt != 'Y'}">
                                        <span style="color: #999;">-</span>
                                    </c:if>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!--// 템플릿 목록 -->

                <!-- 페이지 네비게이션 -->
                <div class="board_list_bot">
                    <div class="paging" id="paging_div">
                        <ul>
                            <ui:pagination paginationInfo="${paginationInfo}" type="renew" jsFunction="fn_egov_select_tmplatInfo" />
                        </ul>
                    </div>
                </div>
                <!--// 페이지 네비게이션 -->
            </div>
        </div>
    </div>
    <!--// 템플릿 정보 팝업 -->
    
    <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
    
    </form>
    
</body>
</html>
