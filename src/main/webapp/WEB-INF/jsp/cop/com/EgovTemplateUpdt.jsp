<%--
  Class Name : EgovTemplateUpdt.jsp
  Description : 템플릿 속성 수정화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.18   이삼섭          최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.03.18
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value='/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/layout.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/component.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/page.css'/>">
    <script src="<c:url value='/js/jquery-1.11.2.min.js'/>"></script>
    <script src="<c:url value='/js/ui.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/EgovValidation.js'/>" ></script>
    <script type="text/javascript">
        function fn_egov_update_tmplatInfo() {
            if (!validateTemplateInf(document.templateInf)){
                return;
            }
            if (confirm('<spring:message code="common.update.msg" />')) {
                document.templateInf.action = "<c:url value='/cop/com/updateTemplateInf.do'/>";
                document.templateInf.submit();
            }
        }
        
        function fn_egov_select_tmplatInfo() {
            document.templateInf.action = "<c:url value='/cop/com/selectTemplateInfs.do'/>";
            document.templateInf.submit();  
        }
        
        function fn_egov_selectTmplatType(obj) {
            if (obj.value == 'TMPT01') {
                document.getElementById('sometext').innerHTML = "게시판 템플릿은 CSS만 가능합니다.";
            } else if (obj.value == '') {
                document.getElementById('sometext').innerHTML = "";
            } else {
                document.getElementById('sometext').innerHTML = "템플릿은 JSP만 가능합니다.";
            }       
        }

        function fn_egov_previewTmplat() {
            var frm = document.templateInf;
            
            var url = frm.tmplatCours.value;

            var target = "";
            var width = "";

            if (frm.tmplatSeCode.value == 'TMPT01') {
                target = "<c:url value='/cop/bbs/previewBoardList.do'/>";
                width = "1024";
            } else {
                alert('<spring:message code="cop.tmplatCours" /> 지정 후 선택해 주세요.');
            }

            if (target != "") {
                window.open(target + "?searchWrd="+url, "preview", "width=" + width + "px, height=800px;");
            }
        }
    </script>
    <title>템플릿 정보수정</title>
</head>
<body onload="fn_egov_selectTmplatType(document.templateInf.tmplatSeCode)">
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
                                    <li><a href="">사이트관리</a></li>
                                    <li>게시판템플릿관리</li>
                                </ul>
                            </div>
                            <!--// Location -->

                            <h1 class="tit_1">사이트관리</h1>

                            <p class="txt_1">템플릿 정보를 수정합니다.</p>

                            <h2 class="tit_2">게시판템플릿관리</h2>

                            <form:form modelAttribute="templateInf" name="templateInf" method="post">
                                <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
                                <input name="tmplatNm" type="hidden" value='<c:out value="${TemplateInfVO.tmplatNm}"/>' />

                                <!-- 템플릿 수정 폼 -->
                                <div class="board_view2">
                                    <table>
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <span><spring:message code="cop.tmplatNm" /></span>
                                            </td>
                                            <td>
                                                <input name="tmplatId" type="hidden" value='<c:out value="${TemplateInfVO.tmplatId}"/>' />
                                                <c:out value="${TemplateInfVO.tmplatNm}"/>
                                                <form:errors path="tmplatId" cssClass="error"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="tmplatSeCode"><spring:message code="cop.tmplatSeCode" /></label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select w_200" for="tmplatSeCode">
                                                    <select id="tmplatSeCode" name="tmplatSeCode" onchange="fn_egov_selectTmplatType(this)">
                                                        <option value=''>--선택하세요--</option>
                                                        <c:forEach var="result" items="${resultList}" varStatus="status">
                                                            <option value='<c:out value="${result.code}"/>' 
                                                                <c:if test="${TemplateInfVO.tmplatSeCode == result.code}">selected="selected"</c:if>>
                                                                <c:out value="${result.codeNm}"/>
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </label>
                                                <span id="sometext" style="margin-left: 15px; color: #666; font-size: 14px;"></span>
                                                <form:errors path="tmplatSeCode" cssClass="error"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="tmplatCours"><spring:message code="cop.tmplatCours" /></label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input id="tmplatCours" name="tmplatCours" type="text" class="f_txt w_full" 
                                                    value='<c:out value="${TemplateInfVO.tmplatCours}"/>' maxlength="60" title="템플릿경로입력">
                                                <form:errors path="tmplatCours" cssClass="error"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label><spring:message code="cop.useAt" /></label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <span class="radio_wrap">
                                                    <label class="radio_label">
                                                        <input type="radio" name="useAt" value="Y" 
                                                            <c:if test="${TemplateInfVO.useAt == 'Y'}"> checked="checked"</c:if>>
                                                        사용
                                                    </label>
                                                    <label class="radio_label">
                                                        <input type="radio" name="useAt" value="N" 
                                                            <c:if test="${TemplateInfVO.useAt == 'N'}"> checked="checked"</c:if>>
                                                        미사용
                                                    </label>
                                                </span>
                                            </td>
                                        </tr>
                                    </table>
                                </div>

                                <!-- 버튼 영역 -->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                        <a href="#LINK" class="btn btn_gray_48" onclick="javascript:fn_egov_previewTmplat(); return false;"><spring:message code="cop.preview" /></a>
                                    </div>
                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46" onclick="javascript:fn_egov_update_tmplatInfo(); return false;"><spring:message code="button.save" /></a>
                                        <a href="<c:url value='/cop/com/selectTemplateInfs.do'/>" class="btn btn_blue_46" onclick="javascript:fn_egov_select_tmplatInfo(); return false;"><spring:message code="button.list" /></a>
                                    </div>
                                </div>
                                <!--// 버튼 영역 -->
                            </form:form>
                            <!--// 템플릿 수정 폼 -->

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
