<%--
  Class Name : EgovBoardMstrUpdt.jsp
  Description : 게시판 속성정보 변경화면
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
    <script type="text/javascript" src="<c:url value="/js/EgovBBSMng.js" />" ></script>
    <script type="text/javascript" src="<c:url value='/js/EgovValidation.js'/>" ></script>
    <script type="text/javascript">
        function fn_egov_update_brdMstr(){
            if (!validateBoardMaster(document.boardMaster)){
                return;
            }
            if(confirm('<spring:message code="common.update.msg" />')){
                document.boardMaster.action = "<c:url value='/cop/bbs/UpdateBBSMasterInf.do'/>";
                document.boardMaster.submit();                  
            }
        }   
        
        function fn_egov_select_brdMstrList(){
            document.boardMaster.action = "<c:url value='/cop/bbs/SelectBBSMasterInfs.do'/>";
            document.boardMaster.submit();  
        }   
        
        function fn_egov_delete_brdMstr(){
            if(confirm('<spring:message code="common.delete.msg" />')){
                document.boardMaster.action = "<c:url value='/cop/bbs/DeleteBBSMasterInf.do'/>";
                document.boardMaster.submit();  
            }       
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

    <title>게시판 정보수정</title>
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

                            <p class="txt_1">게시판 정보를 수정합니다.</p>

                            <h2 class="tit_2">게시판생성관리</h2>

                            <form:form modelAttribute="boardMaster" name="boardMaster" action="${pageContext.request.contextPath}/cop/bbs/SelectBBSMasterInfs.do" method="post">
                                <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
                                <input name="bbsId" type="hidden" value="<c:out value='${result.bbsId}'/>" />
                                <input name="bbsTyCode" type="hidden" value="<c:out value='${result.bbsTyCode}'/>" />
                                <input name="bbsAttrbCode" type="hidden" value="<c:out value='${result.bbsAttrbCode}'/>" />
                                <input name="replyPosblAt" type="hidden" value="<c:out value='${result.replyPosblAt}'/>" />

                                <!-- 게시판 수정 폼 -->
                                <div class="board_view2">
                                    <table summary="게시판명,게시판 소개,게시판 유형,게시판 속성,답장가능여부">
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="bbsNm">게시판명</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td colspan="3">
                                                <input id="bbsNm" name="bbsNm" type="text" class="f_txt w_full" title="게시판명입력" value='<c:out value="${result.bbsNm}"/>' maxlength="60">
                                                <form:errors path="bbsNm" cssClass="error"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="bbsIntrcn">게시판 소개</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td colspan="3">
                                                <textarea id="bbsIntrcn" name="bbsIntrcn" class="f_txtar w_full h_150" title="게시판소개입력"><c:out value="${result.bbsIntrcn}" escapeXml="true" /></textarea>
                                                <form:errors path="bbsIntrcn" cssClass="error"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <span>게시판 유형</span>
                                            </td>
                                            <td>
                                                <c:out value="${result.bbsTyCodeNm}"/>
                                            </td>
                                            <td class="lb">
                                                <span>게시판 속성</span>
                                            </td>
                                            <td>
                                                <c:out value="${result.bbsAttrbCodeNm}"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <span>답장가능여부</span>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${result.replyPosblAt == 'Y'}">
                                                        <spring:message code="button.possible" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <spring:message code="button.impossible" />
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="lb">
                                                <label>파일첨부가능여부</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <span class="radio_wrap">
                                                    <label class="radio_label">
                                                        <input type="radio" name="fileAtchPosblAt" value="Y" 
                                                            onclick="document.boardMaster.posblAtchFileNumber.disabled='';"
                                                            <c:if test="${result.fileAtchPosblAt == 'Y'}"> checked="checked"</c:if>>
                                                        <spring:message code="button.possible" />
                                                    </label>
                                                    <label class="radio_label">
                                                        <input type="radio" name="fileAtchPosblAt" value="N" 
                                                            onclick="document.boardMaster.posblAtchFileNumber.disabled='disabled';"
                                                            <c:if test="${result.fileAtchPosblAt == 'N'}"> checked="checked"</c:if>>
                                                        <spring:message code="button.impossible" />
                                                    </label>
                                                </span>
                                                <form:errors path="fileAtchPosblAt" cssClass="error"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="posblAtchFileNumber">첨부가능파일 숫자</label>
                                            </td>
                                            <td colspan="3">
                                                <label class="f_select w_200" for="posblAtchFileNumber">
                                                    <select id="posblAtchFileNumber" name="posblAtchFileNumber" title="첨부가능파일 숫자선택" 
                                                        <c:if test="${result.fileAtchPosblAt == 'N'}"> disabled="disabled"</c:if>>
                                                        <option value="0">---선택하세요--</option>
                                                        <option value='1' <c:if test="${result.posblAtchFileNumber == '1'}">selected="selected"</c:if>>1개</option>
                                                        <option value='2' <c:if test="${result.posblAtchFileNumber == '2'}">selected="selected"</c:if>>2개</option>
                                                        <option value='3' <c:if test="${result.posblAtchFileNumber == '3'}">selected="selected"</c:if>>3개</option>
                                                    </select>
                                                </label>
                                                <form:errors path="posblAtchFileNumber" cssClass="error"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="tmplatNm">템플릿 정보</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td colspan="3">
                                                <span class="f_search2 w_500">
                                                    <input id="tmplatNm" name="tmplatNm" type="text" title="템플릿정보입력" value="<c:out value="${result.tmplatNm}"/>" maxlength="20" readonly>
                                                    <input id="tmplatId" name="tmplatId" type="hidden" value='<c:out value="${result.tmplatId}"/>' >
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
                                                    <select id="option" name="option" title="추가선택사항선택" 
                                                        <c:if test="${result.option != 'na'}">disabled="disabled"</c:if>>
                                                        <option value='na' <c:if test="${result.option == 'na'}">selected="selected"</c:if>>---선택하세요--</option>
                                                        <option value='' <c:if test="${result.option == ''}">selected="selected"</c:if>>미선택</option>
                                                        <option value='comment' <c:if test="${result.option == 'comment'}">selected="selected"</c:if>>댓글</option>
                                                        <option value='stsfdg' <c:if test="${result.option == 'stsfdg'}">selected="selected"</c:if>>만족도조사</option>
                                                    </select>
                                                </label>
                                                <div style="margin-top: 8px; color: #666; font-size: 14px;">
                                                    ※ 추가 선택사항은 수정 불가 (미설정된 기존 게시판의 경우 처음 설정은 가능함)
                                                </div>
                                            </td>
                                        </tr>
                                        </c:if>
                                        <!-- // 2009.06.26 : 2단계 기능 추가 -->
                                    </table>
                                </div>

                                <!-- 버튼 영역 -->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                        <a href="#LINK" class="btn btn_gray_48" onclick="fn_egov_delete_brdMstr(); return false;"><spring:message code="button.delete" /></a>
                                    </div>
                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46" onclick="javascript:fn_egov_update_brdMstr(); return false;"><spring:message code="button.save" /></a>
                                        <a href="#LINK" class="btn btn_blue_46" onclick="javascript:fn_egov_select_brdMstrList(); return false;"><spring:message code="button.list" /></a>
                                    </div>
                                </div>
                                <!--// 버튼 영역 -->
                            </form:form>
                            <!--// 게시판 수정 폼 -->

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
