<%--
  Class Name : EgovNoticeInqire.jsp
  Description : 게시물 조회 화면
  Modification Information
 
    수정일        수정자        수정내용
    ----------  --------    ---------------------------
    2009.03.23  이삼섭        최초 생성
    2009.06.26  한성곤        2단계 기능 추가 (댓글관리, 만족도조사)
    2011.08.31  JJY         경량환경 버전 생성
    2026.01.12  신용호        신규 디자인 적용
 
    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.03.23 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="egovc" uri="/WEB-INF/tlds/egovc.tld" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value='${result.bbsNm}'/> - 글조회</title>
    <link rel="stylesheet" href="<c:url value='/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/layout.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/component.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/page.css'/>">
    <link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="<c:url value='/js/ui.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<script type="text/javascript">
    function onloading() {
        if ("<c:out value='${msg}'/>" != "") {
            alert("<c:out value='${msg}'/>");
        }
    }
    
    function fn_egov_select_noticeList() {
        event.preventDefault(); 
        document.frm.action = "<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>";
        document.frm.submit();  
    }
    
    function fn_egov_delete_notice() {
        event.preventDefault();
        if ("<c:out value='${anonymous}'/>" == "true" && document.frm.password.value == '') {
            alert('등록시 사용한 패스워드를 입력해 주세요.');
            document.frm.password.focus();
            return;
        }
        
        if (confirm('<spring:message code="common.delete.msg" />')) {
            document.frm.action = "<c:url value='/cop/bbs${prefix}/deleteBoardArticle.do'/>";
            document.frm.method = 'post';
            document.frm.submit();
        }   
    }
    
    function fn_egov_moveUpdt_notice() {
        event.preventDefault();
        if ("<c:out value='${anonymous}'/>" == "true" && document.frm.password.value == '') {
            alert('등록시 사용한 패스워드를 입력해 주세요.');
            document.frm.password.focus();
            return;
        }

        document.frm.action = "<c:url value='/cop/bbs${prefix}/forUpdateBoardArticle.do'/>";
        document.frm.submit();          
    }
    
    function fn_egov_addReply() {
        event.preventDefault();
        document.frm.action = "<c:url value='/cop/bbs${prefix}/addReplyBoardArticle.do'/>";
        document.frm.submit();          
    }   
</script>
<!-- 2009.06.29 : 2단계 기능 추가  -->
<c:if test="${useComment == 'true'}">
<c:import url="/cop/bbs/selectCommentList.do" charEncoding="utf-8">
    <c:param name="type" value="head" />
</c:import>
</c:if>
<c:if test="${useSatisfaction == 'true'}">
<c:import url="/cop/bbs/selectSatisfactionList.do" charEncoding="utf-8">
    <c:param name="type" value="head" />
</c:import>
</c:if>
<c:if test="${useScrap == 'true'}">
<script type="text/javascript">
    function fn_egov_addScrap() {
        document.frm.action = "<c:url value='/cop/bbs/addScrap.do'/>";
        document.frm.submit();          
    }
</script>
</c:if>
<!-- 2009.06.29 : 2단계 기능 추가  -->
</head>
<body onload="onloading();">
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
                                    <li><c:out value='${result.bbsNm}'/></li>
                                </ul>
                            </div>
                            <!--// Location -->

                            <h1 class="tit_1">알림마당</h1>

                            <p class="txt_1">표준프레임워크센터에서 회원여러분들께 알려드리는 모든 소식을 모았습니다.</p>

                            <h2 class="tit_2"><c:out value='${result.bbsNm}'/></h2>

                            <form name="frm" method="get" action="<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>">
                                <input type="hidden" name="searchCnd" value="<c:out value="${searchVO.searchCnd}" />">
                                <input type="hidden" name="searchWrd" value="<c:out value="${searchVO.searchWrd}" />">
                                <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
                                <input name="menuNo" type="hidden" value="<c:out value="${searchVO.menuNo}" />">
                                <input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" >
                                <input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" >
                                <input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" >
                                <input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" >
                                <input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" >
                                <input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" >

                                <!-- 게시판 상세보기 -->
                                <div class="board_view">
                                    <!-- 게시글 헤더 -->
                                    <div class="board_view_top">
                                        <div class="tit"><c:out value="${result.nttSj}" /></div>
                                        <div class="info">
                                            <dl>
                                                <dt>작성자</dt>
                                                <dd><c:out value="${result.frstRegisterNm}" /></dd>
                                            </dl>
                                            <dl>
                                                <dt>작성일</dt>
                                                <dd><c:out value="${result.frstRegisterPnttm}" /></dd>
                                            </dl>
                                            <dl>
                                                <dt>조회수</dt>
                                                <dd><c:out value="${result.inqireCo}" /></dd>
                                            </dl>
                                        </div>
                                    </div>

                                    <!-- 게시글 내용 -->
                                    <div class="board_article">
                                        <textarea id="nttCn" name="nttCn" class="textarea" cols="30" rows="20" readonly="readonly" title="글내용"><c:out value="${result.nttCn}" escapeXml="true" /></textarea>
                                    </div>

                                    <!-- 첨부파일 -->
                                    <c:if test="${not empty result.atchFileId}">
                                    <div class="board_attach">
                                        <c:if test="${result.bbsAttrbCode == 'BBSA02'}">
                                        <dl>
                                            <dt>첨부이미지</dt>
                                            <dd>
                                                <c:import url="/cmm/fms/selectImageFileInfs.do" charEncoding="utf-8">
                                                    <c:param name="atchFileId" value="${egovc:encryptSession(result.atchFileId, pageContext.session.id)}" />
                                                </c:import>
                                            </dd>
                                        </dl>
                                        </c:if>
                                        <dl>
                                            <dt>첨부파일</dt>
                                            <dd>
                                                <c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
                                                    <c:param name="param_atchFileId" value="${egovc:encrypt(result.atchFileId)}" />
                                                </c:import>
                                            </dd>
                                        </dl>
                                    </div>
                                    </c:if>
                                    <!--// 첨부파일 -->

                                    <!-- 익명 게시판 패스워드 -->
                                    <c:if test="${anonymous == 'true'}">
                                    <div class="board_attach">
                                        <dl>
                                            <dt><label for="password"><spring:message code="cop.password" /></label></dt>
                                            <dd>
                                                <input name="password" id="password" title="암호" type="password" class="f_txt w_200" value="" maxlength="20">
                                            </dd>
                                        </dl>
                                    </div>
                                    </c:if>
                                    <!--// 익명 게시판 패스워드 -->

                                    <!-- 버튼 영역 -->
                                    <div class="board_view_bot">
                                        <div class="left_col btn3">
                                            <% if(null != session.getAttribute("LoginVO")){ %>
                                            <c:if test="${result.frstRegisterId == sessionUniqId}">
                                                <a href="#LINK" class="btn btn_gray_48" onclick="fn_egov_moveUpdt_notice();">수정</a>
                                                <a href="#LINK" class="btn btn_gray_48" onclick="fn_egov_delete_notice();">삭제</a>
                                            </c:if>
                                            <c:if test="${result.replyPosblAt == 'Y'}">
                                                <a href="#LINK" class="btn btn_gray_48" onclick="fn_egov_addReply();">답글작성</a>
                                            </c:if>
                                            <% } %>
                                        </div>

                                        <div class="right_col btn1">
                                            <a href="#LINK" class="btn btn_blue_46" onclick="fn_egov_select_noticeList();">목록</a>
                                        </div>
                                    </div>
                                    <!--// 버튼 영역 -->
                                </div>
                                <!--// 게시판 상세보기 -->
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
