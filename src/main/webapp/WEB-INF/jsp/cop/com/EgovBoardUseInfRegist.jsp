<%--
  Class Name : EgovBoardUseInfRegist.jsp
  Description : 게시판  사용정보  등록화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.04.02   이삼섭          최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.04.02 
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
    <link rel="stylesheet" href="<c:url value='/css/jqueryui.css'/>">
    <script src="<c:url value='/js/jquery-1.11.2.min.js'/>"></script>
    <script src="<c:url value='/js/jqueryui.js'/>"></script>
    <script src="<c:url value='/js/ui.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/EgovValidation.js'/>" ></script>
    <script type="text/javascript">
        function fn_egov_select_bbsUseInfs(){
            document.boardUseInf.action = "<c:url value='/cop/com/selectBBSUseInfs.do'/>?searchCondition=1";
            document.boardUseInf.submit();
        }
        
        function fn_egov_regist_bbsUseInf(){
            if (!validateBoardUseInf(document.boardUseInf)){
                return;
            }
            if (confirm('<spring:message code="common.regist.msg" />')) {
                document.boardUseInf.param_trgetType.value = document.boardUseInf.trgetType.value;
                document.boardUseInf.action = "<c:url value='/cop/com/insertBBSUseInf.do'/>";
                document.boardUseInf.submit();      
            }
        }
        
        function fn_egov_inqire_bbsInf(){
            var $dialog = $('<div id="modalPan"></div>')
            .html('<iframe style="border: 0px; " src="' + "<c:url value='/cop/bbs/SelectBBSMasterInfsPop.do'/>" +'" width="100%" height="100%"></iframe>')
            .dialog({
                autoOpen: false,
                modal: true,
                width: 1100,
                height: 700,
                title: "게시판 조회"
            });
            $(".ui-dialog-titlebar").hide();
            $dialog.dialog('open');
        }
        
        function fn_egov_returnValue(retVal){
            if(retVal != null){
                var tmp = retVal.split("|");
                document.boardUseInf.bbsId.value = tmp[0];
                document.boardUseInf.bbsNm.value = tmp[1];
            }
            fn_egov_modal_remove();
        }

        function fn_egov_modal_remove() {
            $('#modalPan').remove();
        }
        
        function fn_egov_selectTargetType(obj) {
            var retVal;
            var _strType = obj.value;
            
            if (_strType == 'CMMNTY') {
                retVal = fn_egov_inqire_cmmnty();
            } else if (_strType == 'CLUB') {
                retVal = fn_egov_inqire_club();
            } else if (_strType == '') {
                retVal = "|";
            } else {
                retVal = "SYSTEM_DEFAULT_BOARD"+"|"+"시스템 활용";
            }
                    
            if (retVal != null) {
                var tmp = retVal.split("|");
                document.boardUseInf.trgetId.value = tmp[0];
                document.boardUseInf.trgetNm.value = tmp[1];
            }
        }
        
        /* function fn_egov_inqire_cmmnty(){
            var retVal;
            var url = "/cop/com/openPopup.do?requestUrl=/cop/cmy/selectCmmntyInfsByPop.do&width=850&height=360";        
            var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";
             
            retVal = window.showModalDialog(url,"p_cmmntyInqire", openParam);
            return retVal;
        }   
        
        function fn_egov_inqire_club(){
            var retVal;
            var url = "/cop/com/openPopup.do?requestUrl=/cop/clb/selectClubInfsByPop.do&width=850&height=360";      
            var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";
             
            retVal = window.showModalDialog(url,"p_cmmntyInqire", openParam);
            return retVal;      
        } */
    </script>

    <title>게시판 사용등록</title>
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
                                    <li><a class="home" href="<c:url value='/'/>">Home</a></li>
                                    <li><a href="">사이트관리</a></li>
                                    <li>게시판사용관리</li>
                                </ul>
                            </div>
                            <!--// Location -->

                            <h1 class="tit_1">사이트관리</h1>

                            <p class="txt_1">게시판 사용정보를 등록합니다.</p>

                            <h2 class="tit_2">게시판사용관리</h2>

                            <form:form modelAttribute="boardUseInf" name="boardUseInf" method="post">
                                <div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
                                <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
                                <input type="hidden" name="param_trgetType" value="" />

                                <!-- 게시판 사용 등록 폼 -->
                                <div class="board_view2">
                                    <table>
                                        <colgroup>
                                            <col style="width: 200px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="bbsNm"><spring:message code="cop.bbsNm" /></label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <span class="f_search2 w_500">
                                                    <input id="bbsNm" name="bbsNm" type="text" value="" maxlength="40" title="게시판명" readonly />
                                                    <button type="button" class="btn" onclick="fn_egov_inqire_bbsInf();">조회</button>
                                                </span>
                                                <input name="bbsId" type="hidden" />
                                                <form:errors path="bbsNm" cssClass="error"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="trgetType"><spring:message code="cop.trgetNm" /></label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select w_200" for="trgetType">
                                                    <select id="trgetType" name="trgetType" title="커뮤니티/동호회 유형" onchange="fn_egov_selectTargetType(this)">
                                                        <option value="">--선택하세요--</option>
                                                        <option value="SYSTEM">시스템</option>
                                                    </select>
                                                </label>
                                                <input class="f_txt w_300" type="text" name="trgetNm" value="" title="커뮤니티/동호회 명" readonly="readonly" style="margin-left: 10px;" />
                                                <input type="hidden" name="trgetId" value="" />
                                                <form:errors path="trgetNm" cssClass="error"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>

                                <!-- 버튼 영역 -->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                    </div>
                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46" onclick="fn_egov_regist_bbsUseInf(); return false;"><spring:message code="button.create" /></a>
                                        <a href="<c:url value='/cop/com/selectBBSUseInfs.do'/>?searchCondition=1" class="btn btn_blue_46" onclick="fn_egov_select_bbsUseInfs(); return false;"><spring:message code="button.list" /></a>
                                    </div>
                                </div>
                                <!--// 버튼 영역 -->
                            </form:form>
                            <!--// 게시판 사용 등록 폼 -->

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
