<%--
  Class Name : EgovTemplateRegist.jsp
  Description : 템플릿 속성 등록화면
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
    <title>템플릿 등록 - 표준프레임워크 심플 홈페이지템플릿</title>
    <link rel="stylesheet" href="<c:url value='/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/layout.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/component.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/page.css'/>">
    <script src="<c:url value='/js/jquery-1.11.2.min.js'/>"></script>
    <script src="<c:url value='/js/ui.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/EgovValidation.js'/>" ></script>

<script type="text/javascript">
    function fn_egov_regist_tmplatInfo(){
        if (!validateTemplateInf(document.templateInf)){
            return;
        }
        if (confirm('<spring:message code="common.regist.msg" />')) {
            document.templateInf.action = "<c:url value='/cop/com/insertTemplateInf.do'/>";
            document.templateInf.submit();
        }
    }
    
    function fn_egov_select_tmplatInfo(){
        document.templateInf.action = "<c:url value='/cop/com/selectTemplateInfs.do'/>";
        document.templateInf.submit();  
    }

    function fn_egov_selectTmplatType(obj){
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

        if (frm.tmplatSeCode.value == 'TMPT01') {
            target = "<c:url value='/cop/bbs/previewBoardList.do'/>";
            width = "1024";
        } else {
            alert('<spring:message code="cop.tmplatCours" /> 지정 후 선택해 주세요.');
        }

        if (target != "") {
            window.open(target + "?searchWrd="+url, "preview", "width=" + width + "px, height=500px;");
        }
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
                                    <li>게시판템플릿관리</li>
                                </ul>
                            </div>
                            <!--// Location -->

                            <h1 class="tit_1">사이트관리</h1>
                            <p class="txt_1">게시판 템플릿을 등록합니다.</p>
                            <h2 class="tit_2">게시판템플릿관리</h2>
                            <h3 class="tit_3">템플릿 등록</h3>
                            <!-- 템플릿 등록 폼 -->
                            <form:form modelAttribute="templateInf" name="templateInf" method="post">
                                <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />

                                <div class="board_view2">
                                    <table>
                                        <caption>템플릿 등록 정보</caption>
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="tmplatNm"><spring:message code="cop.tmplatNm" /></label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input name="tmplatNm" type="text" class="f_txt w_full" value="" maxlength="60" id="tmplatNm" title="템플릿명" />
                                                <form:errors path="tmplatNm" cssClass="error"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="tmplatSeCode"><spring:message code="cop.tmplatSeCode" /></label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select" for="tmplatSeCode">
                                                    <select name="tmplatSeCode" onchange="fn_egov_selectTmplatType(this)" id="tmplatSeCode" title="템플릿구분">
                                                        <option selected value=''>--선택하세요--</option>
                                                        <c:forEach var="result" items="${resultList}" varStatus="status">
                                                            <option value='<c:out value="${result.code}"/>'><c:out value="${result.codeNm}"/></option>
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
                                                <input name="tmplatCours" type="text" class="f_txt w_full" value="" maxlength="60" id="tmplatCours" title="템플릿경로" />
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
                                                    <label for="useAtY">
                                                        <input type="radio" name="useAt" id="useAtY" value="Y" checked="checked" />
                                                        사용
                                                    </label>
                                                    <label for="useAtN">
                                                        <input type="radio" name="useAt" id="useAtN" value="N" />
                                                        미사용
                                                    </label>
                                                </span>
                                                <form:errors path="useAt" cssClass="error"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>


                                <!-- 버튼 영역 -->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                        <a href="#LINK" class="btn btn_gray_48" onclick="fn_egov_previewTmplat();">미리보기</a>
                                    </div>
                                    <div class="right_col btn1">
                                        <a href="<c:url value='/cop/com/insertTemplateInf.do'/>" class="btn btn_blue_46" onclick="fn_egov_regist_tmplatInfo(); return false;">저장</a>
                                        <a href="<c:url value='/cop/com/selectTemplateInfs.do'/>" class="btn btn_blue_46">목록</a>
                                    </div>
                                </div>
                                <!--// 버튼 영역 -->
                            </form:form>
                            <!--// 템플릿 등록 폼 -->

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