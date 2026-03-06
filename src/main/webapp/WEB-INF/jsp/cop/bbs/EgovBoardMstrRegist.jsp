<%--
  Class Name : EgovBoardMstrRegist.jsp
  Description : 게시판 생성 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.12   이삼섭          최초 생성
     2009.06.26   한성곤          2단계 기능 추가 (댓글관리, 만족도조사)
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.03.12  
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
    <script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
    <script type="text/javascript" src="<c:url value='/js/EgovValidation.js'/>" ></script>
    <script type="text/javascript">
        function fn_egov_regist_brdMstr(){
            if (!validateBoardMaster(document.boardMaster)){
                return;
            }
            if (confirm('<spring:message code="common.regist.msg" />')) {
                form = document.boardMaster;
                form.action = "<c:url value='/cop/bbs/insertBBSMasterInf.do'/>";
                form.submit();
            }
        }
        
        function fn_egov_select_brdMstrList(){
            form = document.boardMaster;
            form.action = "<c:url value='/cop/bbs/SelectBBSMasterInfs.do'/>";
            form.submit();  
        }
        
        function fn_egov_inqire_tmplatInqire(){
            var $dialog = $('<div id="modalPan"></div>')
            .html('<iframe style="border: 0px; " src="' + "<c:url value='/cop/com/selectTemplateInfsPop.do'/>" +'" width="100%" height="100%"></iframe>')
            .dialog({
                autoOpen: false,
                modal: true,
                width: 1300,
                height: 700
            });
            $(".ui-dialog-titlebar").hide();
            $dialog.dialog('open');
        }
        
        function fn_egov_returnValue(retVal) {
            if(retVal != null){
                var tmp = retVal.split("|");
                document.getElementById("tmplatId").value = tmp[0];
                document.getElementById("tmplatNm").value = tmp[1];
            }
            fn_egov_modal_remove();
        }
        
        function fn_egov_modal_remove() {
            $('#modalPan').remove();
        }
    </script>

    <title>게시판 생성관리</title>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

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
                                    <li>게시판생성관리</li>
                                </ul>
                            </div>
                            <!--// Location -->

                            <h1 class="tit_1">사이트관리</h1>

                            <p class="txt_1">게시판 템플릿을 등록합니다.</p>

                            <h2 class="tit_2">게시판생성관리</h2>

                            <form:form modelAttribute="boardMaster" name="boardMaster" method="post" action="${pageContext.request.contextPath}/cop/bbs/SelectBBSMasterInfs.do">
                                <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>

                                <!-- 게시판 등록 폼 -->
                                <div class="board_view2">
                                    <table summary="게시판명,게시판소개,게시판 유형,게시판 속성,답장가능여부,파일첨부가능여부">
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="bbsNm"><spring:message code="cop.bbsNm" /></label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td colspan="3">
                                                <form:input id="bbsNm" path="bbsNm" class="f_txt w_full" title="게시판명입력" />
                                                <form:errors path="bbsNm" cssClass="error"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="bbsIntrcn"><spring:message code="cop.bbsIntrcn" /></label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td colspan="3">
                                                <form:textarea id="bbsIntrcn" path="bbsIntrcn" class="f_txtar w_full h_150" title="게시판소개입력" />
                                                <form:errors path="bbsIntrcn" cssClass="error"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="bbsTyCode"><spring:message code="cop.bbsTyCode" /></label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select w_200" for="bbsTyCode">
                                                    <form:select id="bbsTyCode" path="bbsTyCode" title="게시판유형선택">
                                                        <form:option value='' label="--선택하세요--" />
                                                        <form:options items="${typeList}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                                <form:errors path="bbsTyCode" cssClass="error"/>
                                            </td>
                                            <td class="lb">
                                                <label for="bbsAttrbCode"><spring:message code="cop.bbsAttrbCode" /></label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select w_200" for="bbsAttrbCode">
                                                    <form:select id="bbsAttrbCode" path="bbsAttrbCode" title="게시판속성선택">
                                                        <form:option value='' label="--선택하세요--" />
                                                        <form:options items="${attrbList}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                                <form:errors path="bbsAttrbCode" cssClass="error"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label><spring:message code="cop.replyPosblAt" /></label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <span class="radio_wrap">
                                                    <label class="radio_label">
                                                        <form:radiobutton path="replyPosblAt" value="Y" />
                                                        <spring:message code="button.possible" />
                                                    </label>
                                                    <label class="radio_label">
                                                        <form:radiobutton path="replyPosblAt" value="N" />
                                                        <spring:message code="button.impossible" />
                                                    </label>
                                                </span>
                                                <form:errors path="replyPosblAt" cssClass="error"/>
                                            </td>
                                            <td class="lb">
                                                <label><spring:message code="cop.fileAtchPosblAt" /></label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <span class="radio_wrap">
                                                    <label class="radio_label">
                                                        <form:radiobutton path="fileAtchPosblAt" value="Y" 
                                                            onclick="document.boardMaster.posblAtchFileNumber.disabled='';" />
                                                        <spring:message code="button.possible" />
                                                    </label>
                                                    <label class="radio_label">
                                                        <form:radiobutton path="fileAtchPosblAt" value="N" 
                                                            onclick="document.boardMaster.posblAtchFileNumber.disabled='disabled';" />
                                                        <spring:message code="button.impossible" />
                                                    </label>
                                                </span>
                                                <form:errors path="fileAtchPosblAt" cssClass="error"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="posblAtchFileNumber"><spring:message code="cop.posblAtchFileNumber" /></label>
                                            </td>
                                            <td colspan="3">
                                                <label class="f_select w_200" for="posblAtchFileNumber">
                                                    <form:select id="posblAtchFileNumber" path="posblAtchFileNumber" title="첨부가능파일 숫자선택">
                                                        <form:option value="0" label="---선택하세요--" />
                                                        <form:option value='1'>1개</form:option>
                                                        <form:option value='2'>2개</form:option>
                                                        <form:option value='3'>3개</form:option>
                                                    </form:select>
                                                </label>
                                                <form:errors path="posblAtchFileNumber" cssClass="error"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="tmplatNm"><spring:message code="cop.tmplatId" /></label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td colspan="3">
                                                <span class="f_search2 w_500">
                                                    <form:input id="tmplatNm" path="tmplatNm" readonly="true" title="템플릿정보입력" value="게시판 기본템플릿" />
                                                    <form:hidden id="tmplatId" path="tmplatId" value="TMPLAT_BOARD_DEFAULT" />
                                                    <button type="button" class="btn" onclick="fn_egov_inqire_tmplatInqire(); return false;">검색</button>
                                                </span>
                                                <form:errors path="tmplatId" cssClass="error"/>
                                            </td>
                                        </tr>

                                        <!-- 2009.06.26 : 2단계 기능 추가 -->
                                        <c:if test="${addedOptions == 'true'}">
                                        <tr>
                                            <td class="lb">
                                                <label for="option">추가 선택사항</label>
                                            </td>
                                            <td colspan="3">
                                                <label class="f_select w_200" for="option">
                                                    <form:select path="option" title="추가선택사항선택">
                                                        <form:option value="" label="미선택" />
                                                        <form:option value='comment'>댓글</form:option>
                                                        <form:option value='stsfdg'>만족도조사</form:option>
                                                    </form:select>
                                                </label>
                                            </td>
                                        </tr>
                                        </c:if>
                                        <!-- // 2009.06.26 : 2단계 기능 추가 -->
                                    </table>
                                </div>

                                <!-- 버튼 영역 -->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                    </div>
                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46" onclick="javascript:fn_egov_regist_brdMstr(); return false;"><spring:message code="button.save" /></a>
                                        <a href="#LINK" class="btn btn_blue_46" onclick="javascript:fn_egov_select_brdMstrList(); return false;"><spring:message code="button.list" /></a>
                                    </div>
                                </div>
                                <!--// 버튼 영역 -->
                            </form:form>
                            <!--// 게시판 등록 폼 -->

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
