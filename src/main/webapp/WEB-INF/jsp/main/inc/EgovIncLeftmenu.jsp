<%--
  Class Name : EgovIncLeftmenu.jsp
  Description : 좌메뉴 화면(include)
  Modification Information
 
    수정일        수정자        수정내용
    ----------  --------    ---------------------------
    2011.08.31  JJY         경량환경 버전 생성
    2026.01.09  신용호        신규 디자인 적용
 
    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="java.util.HashMap" %>
<% 
    String menuNo = ((String)session.getAttribute("menuNo")!=null)?(String)session.getAttribute("menuNo"):"11";
%>

<div class="nav">
    <div class="inner">
        <% if (menuNo.indexOf("1")== 0) {%>
        <h2>사이트소개</h2>
        <ul>
            <li><a href="<c:url value='/EgovPageLink.do?menuNo=11&linkIndex=9'/>">소개</a></li>
            <li><a href="<c:url value='/EgovPageLink.do?menuNo=12&linkIndex=10'/>">연혁</a></li>
            <li><a href="<c:url value='/EgovPageLink.do?menuNo=13&linkIndex=11'/>">조직소개</a></li>
            <li><a href="<c:url value='/EgovPageLink.do?menuNo=14&linkIndex=12'/>">찾아오시는 길</a></li>
        </ul>
        <% } %>
        
        <% if (menuNo.indexOf("2")== 0) {%>
        <h2>정보마당</h2>
        <ul>
            <li><a href="<c:url value='/EgovPageLink.do?menuNo=21&linkIndex=13'/>">주요사업 소개</a></li>
            <li><a href="<c:url value='/EgovPageLink.do?menuNo=22&linkIndex=14'/>">대표서비스 소개</a></li>
        </ul>
        <% } %>
        
        <% if (menuNo.indexOf("3")== 0) {%>
        <h2>고객지원</h2>
        <ul>
            <li><a href="<c:url value='/EgovPageLink.do?menuNo=31&linkIndex=15'/>">자료실</a></li>
            <li><a href="<c:url value='/EgovPageLink.do?menuNo=32&linkIndex=16'/>">묻고답하기</a></li>
            <li><a href="<c:url value='/EgovPageLink.do?menuNo=33&linkIndex=17'/>">서비스신청</a></li>
        </ul>
        <% } %>
        
        <% if (menuNo.indexOf("4")== 0) {%>
        <h2>알림마당</h2>
        <ul>
            <li><a href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDailyList.do?menuNo=41'/>">오늘의 행사</a></li>
            <li><a href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageWeekList.do?menuNo=42'/>">금주의 행사</a></li>
            <li><a href="<c:url value='/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA&menuNo=43'/>">공지사항</a></li>
            <li><a href="<c:url value='/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_BBBBBBBBBBBB&menuNo=44'/>">사이트갤러리</a></li>
        </ul>
        <% } %>
        
        <% if (menuNo.indexOf("5")== 0) {%>
        <h2>사이트관리</h2>
        <ul>
            <li><a href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageMonthList.do?menuNo=51'/>">일정관리</a></li>
            <li><a href="<c:url value='/cop/com/selectTemplateInfs.do?menuNo=52'/>">게시판템플릿관리</a></li>
            <li><a href="<c:url value='/cop/bbs/SelectBBSMasterInfs.do?menuNo=53'/>">게시판생성관리</a></li>
            <li><a href="<c:url value='/cop/com/selectBBSUseInfs.do?menuNo=54'/>">게시판사용관리</a></li>
            <li><a href="<c:url value='/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA&menuNo=55'/>">공지사항관리</a></li>
            <li><a href="<c:url value='/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_BBBBBBBBBBBB&menuNo=56'/>">사이트갤러리관리</a></li>
        </ul>
        <% } %>
    </div>
</div>
<!-- //메뉴 끝 -->
