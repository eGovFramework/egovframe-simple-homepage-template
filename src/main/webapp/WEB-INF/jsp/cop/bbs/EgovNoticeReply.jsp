<%--
  Class Name : EgovNoticeReply.jsp
  Description : 게시물 답글 생성 화면
  Modification Information
 
    수정일        수정자        수정내용
    ----------  --------    ---------------------------
    2009.03.24  이삼섭        최초 생성
    2011.08.31  JJY         경량환경 버전 생성
    2026.01.12  신용호        신규 디자인 적용
 
    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.03.24 
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
    <title><c:out value='${bdMstr.bbsNm}'/> - 답글쓰기</title>
    <link rel="stylesheet" href="<c:url value='/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/layout.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/component.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/page.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/jqueryui.css'/>">
    <link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="<c:url value='/js/ui.js'/>"></script>
    <script src="<c:url value='/js/jqueryui.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
    <script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/js/EgovValidation.js'/>" ></script>
<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>

<script type="text/javascript">
    function fn_egov_validateForm(obj) {
        return true;
    }

    function fn_egov_regist_notice() {
        event.preventDefault();

        if (!validateBoard(document.board)){
            return;
        }
        
        if (confirm('<spring:message code="common.regist.msg" />')) {
            document.board.action = "<c:url value='/cop/bbs${prefix}/replyBoardArticle.do'/>";
            document.board.submit();                    
        }
    }
    
    function fn_egov_select_noticeList() {
        event.preventDefault();
        document.board.action = "<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>";
        document.board.method = 'get';
        document.board.submit();    
    }
    
    /* ********************************************************
     * 달력 초기화
     ******************************************************** */
    function fn_egov_init_datepicker(){
        $("#ntceBgndeView").datepicker(
                {dateFormat:'yy-mm-dd'
                 , showOn: 'button'
                 , buttonImage: "<c:url value='/images/ico_calendar.png'/>"
                 , buttonImageOnly: true
                 , showMonthAfterYear: true
                 , showOtherMonths: true
                 , selectOtherMonths: true
                 , monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
                 , changeMonth: true
                 , changeYear: true
                 , showButtonPanel: true
                 , onSelect: function(dateText, inst) {
                     document.board.ntceBgnde.value = dateText.replace(/-/g, '');
                 }
        });

        $("#ntceEnddeView").datepicker( 
                {dateFormat:'yy-mm-dd'
                 , showOn: 'button'
                 , buttonImage: "<c:url value='/images/ico_calendar.png'/>"
                 , buttonImageOnly: true
                 , showMonthAfterYear: true
                 , showOtherMonths: true
                 , selectOtherMonths: true
                 , monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
                 , changeMonth: true
                 , changeYear: true
                 , showButtonPanel: true
                 , onSelect: function(dateText, inst) {
                     document.board.ntceEndde.value = dateText.replace(/-/g, '');
                 }
        });
    }
</script>

<style type="text/css">
.ui-datepicker-trigger {
    margin-left: 10px;
    vertical-align: middle;
    cursor: pointer;
}
</style>
</head>
<body onLoad="document.board.nttSj.focus(); fn_egov_init_datepicker();">
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
                                    <li><a href="">알림마당</a></li>
                                    <li><c:out value='${bdMstr.bbsNm}'/></li>
                                </ul>
                            </div>
                            <!--// Location -->

                            <h1 class="tit_1">알림마당</h1>

                            <p class="txt_1">표준프레임워크센터에서 회원여러분들께 알려드리는 모든 소식을 모았습니다.</p>

                            <h2 class="tit_2"><c:out value='${bdMstr.bbsNm}'/> - 답글쓰기</h2>

                            <form:form modelAttribute="board" name="board" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="replyAt" value="Y" />
                                <input type="hidden" name="searchCnd"  value="<c:out value="${searchVO.searchCnd}" />">
                                <input type="hidden" name="searchWrd"  value="<c:out value="${searchVO.searchWrd}" />">
                                <input type="hidden" name="pageIndex"  value="<c:out value='${searchVO.pageIndex}'/>"/>
                                <input name="menuNo" type="hidden" value="<c:out value="${searchVO.menuNo}" />">
                                <input type="hidden" name="nttId" value="<c:out value='${searchVO.nttId}'/>" />
                                <input type="hidden" name="parnts" value="<c:out value='${searchVO.parnts}'/>" />
                                <input type="hidden" name="sortOrdr" value="<c:out value='${searchVO.sortOrdr}'/>" />
                                <input type="hidden" name="replyLc" value="<c:out value='${searchVO.replyLc}'/>" />
                                
                                <input type="hidden" name="bbsId" value="<c:out value='${bdMstr.bbsId}'/>" />
                                <input type="hidden" name="bbsAttrbCode" value="<c:out value='${bdMstr.bbsAttrbCode}'/>" />
                                <input type="hidden" name="bbsTyCode" value="<c:out value='${bdMstr.bbsTyCode}'/>" />
                                <input type="hidden" name="replyPosblAt" value="<c:out value='${bdMstr.replyPosblAt}'/>" />
                                <input type="hidden" name="fileAtchPosblAt" value="<c:out value='${bdMstr.fileAtchPosblAt}'/>" />
                                <input type="hidden" name="posblAtchFileNumber" value="<c:out value='${bdMstr.posblAtchFileNumber}'/>" />
                                <input type="hidden" name="posblAtchFileSize" value="<c:out value='${bdMstr.posblAtchFileSize}'/>" />
                                <input type="hidden" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>" />
                                
                                <c:if test="${anonymous != 'true'}">
                                    <input type="hidden" name="ntcrNm" value="dummy">   <!-- validator 처리를 위해 지정 -->
                                    <input type="hidden" name="password" value="dummy"> <!-- validator 처리를 위해 지정 -->
                                </c:if>
                                
                                <c:if test="${bdMstr.bbsAttrbCode != 'BBSA01'}">
                                   <input name="ntceBgnde" type="hidden" value="10000101">
                                   <input name="ntceEndde" type="hidden" value="99991231">
                                </c:if>

                                <!-- 답글 작성 폼 -->
                                <div class="board_view2">
                                    <table>
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="nttSj"><spring:message code="cop.nttSj" /></label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input name="nttSj" id="nttSj" title="제목" type="text" class="f_txt w_full" 
                                                    value="RE: <c:out value='${result.nttSj}'/>" maxlength="60">
                                                <form:errors path="nttSj" cssClass="error" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="nttCn"><spring:message code="cop.nttCn" /></label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <textarea id="nttCn" name="nttCn" class="f_txtar w_full h_300" title="내용"></textarea>
                                                <form:errors path="nttCn" cssClass="error" />
                                            </td>
                                        </tr>
                                        <c:if test="${bdMstr.bbsAttrbCode == 'BBSA01'}">
                                        <tr>
                                            <td class="lb">
                                                <label><spring:message code="cop.noticeTerm" /></label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <div class="date_sec">
                                                    <input name="ntceBgnde" type="hidden" value="">
                                                    <input name="ntceBgndeView" id="ntceBgndeView" type="text" class="f_date" 
                                                        value="" readonly title="공지시작일자" />
                                                    <span style="margin: 0 10px;">~</span>
                                                    <input name="ntceEndde" type="hidden" value="">
                                                    <input name="ntceEnddeView" id="ntceEnddeView" type="text" class="f_date" 
                                                        value="" readonly title="공지종료일자" />
                                                </div>
                                                <form:errors path="ntceBgndeView" cssClass="error" />
                                                <form:errors path="ntceEnddeView" cssClass="error" />
                                            </td>
                                        </tr>
                                        </c:if>
                                        <c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
                                        <tr>
                                            <td class="lb">
                                                <label for="egovComFileUploader">파일첨부</label>
                                            </td>
                                            <td>
                                                <input name="file_1" id="egovComFileUploader" type="file" title="첨부파일" />
                                                <div id="egovComFileList" class="file_list"></div>
                                            </td>
                                        </tr>
                                        </c:if>
                                    </table>
                                </div>

                                <!-- 버튼 영역 -->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                    </div>
                                    <div class="right_col btn1">
                                        <c:if test="${bdMstr.authFlag == 'Y'}">
                                            <a href="#LINK" class="btn btn_blue_46" onclick="fn_egov_regist_notice();"><spring:message code="button.save" /></a>
                                        </c:if>
                                        <a href="#LINK" class="btn btn_blue_46" onclick="fn_egov_select_noticeList();"><spring:message code="button.list" /></a>
                                    </div>
                                </div>
                                <!--// 버튼 영역 -->
                            </form:form>
                            <!--// 답글 작성 폼 -->

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

<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
<script type="text/javascript">
var maxFileNum = document.board.posblAtchFileNumber.value;
if (maxFileNum==null || maxFileNum=="") {
    maxFileNum = 3;
}
var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );         
</script>    
</c:if>

</body>
</html>
