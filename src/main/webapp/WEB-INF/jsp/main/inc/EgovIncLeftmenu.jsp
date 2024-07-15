<%--
  Class Name : EgovIncLeftmenu.jsp
  Description :  좌메뉴 화면(include)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
--%><%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.HashMap" %>
<%
String menuNo = ((String)session.getAttribute("menuNo")!=null)?(String)session.getAttribute("menuNo"):"11";
%>

<div id="nav">	
	<div class="top"></div>             
	<div class="nav_style">
	<ul>
	    <% if (menuNo.indexOf("1")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="/sht_webapp/EgovPageLink.do?menuNo=11&linkIndex=9">사이트소개</a>
			<ul>
				<li class="dept02"><a href="/sht_webapp/EgovPageLink.do?menuNo=11&linkIndex=9">소개</a></li>	
				<li class="dept02"><a href="/sht_webapp/EgovPageLink.do?menuNo=12&linkIndex=10">연혁</a></li>
				<li class="dept02"><a href="/sht_webapp/EgovPageLink.do?menuNo=13&linkIndex=11">조직소개</a></li>
				<li class="dept02"><a href="/sht_webapp/EgovPageLink.do?menuNo=14&linkIndex=12">찾아오시는 길</a></li>
			</ul> 
		</li>
		<% } %>
		<% if (menuNo.indexOf("2")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="/sht_webapp/EgovPageLink.do?menuNo=21&linkIndex=13">정보마당</a>
			<ul>	
				<li class="dept02"><a href="/sht_webapp/EgovPageLink.do?menuNo=21&linkIndex=13">주요사업 소개</a></li>
				<li class="dept02"><a href="/sht_webapp/EgovPageLink.do?menuNo=22&linkIndex=14">대표서비스 소개</a></li>
			</ul> 
		</li>
		<% } %>
        <% if (menuNo.indexOf("3")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="/sht_webapp/EgovPageLink.do?menuNo=31&linkIndex=15">고객지원</a>
			<ul>
				<li class="dept02"><a href="/sht_webapp/EgovPageLink.do?menuNo=31&linkIndex=15">자료실</a></li>
				<li class="dept02"><a href="/sht_webapp/EgovPageLink.do?menuNo=32&linkIndex=16">묻고답하기</a></li>
				<li class="dept02"><a href="/sht_webapp/EgovPageLink.do?menuNo=33&linkIndex=17">서비스신청</a></li>
			</ul>
		</li>
		<% } %>
        <% if (menuNo.indexOf("4")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="/sht_webapp/cop/smt/sim/EgovIndvdlSchdulManageWeekList.do?menuNo=41">알림마당</a>
			<ul>
				<li class="dept02"><a href="/sht_webapp/cop/smt/sim/EgovIndvdlSchdulManageDailyList.do?menuNo=41">오늘의 행사</a></li>	
				<li class="dept02"><a href="/sht_webapp/cop/smt/sim/EgovIndvdlSchdulManageWeekList.do?menuNo=42">금주의 행사</a></li>
				<li class="dept02"><a href="/sht_webapp/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA&menuNo=43">공지사항</a></li>
				<li class="dept02"><a href="/sht_webapp/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_BBBBBBBBBBBB&menuNo=44">사이트갤러리</a></li>
			</ul> 
		</li>
		<% } %>
        <% if (menuNo.indexOf("5")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="/sht_webapp/cop/smt/sim/EgovIndvdlSchdulManageMonthList.do?menuNo=51">사이트관리</a>
			<ul>
				<li class="dept02"><a href="/sht_webapp/cop/smt/sim/EgovIndvdlSchdulManageMonthList.do?menuNo=51">일정관리</a></li>
				<li class="dept02"><a href="/sht_webapp/cop/com/selectTemplateInfs.do?menuNo=52">게시판템플릿관리</a></li>
				<li class="dept02"><a href="/sht_webapp/cop/bbs/SelectBBSMasterInfs.do?menuNo=53">게시판생성관리</a></li>
				<li class="dept02"><a href="/sht_webapp/cop/com/selectBBSUseInfs.do?menuNo=54">게시판사용관리</a></li> 
				<li class="dept02"><a href="/sht_webapp/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA&menuNo=55">공지사항관리</a></li>
                <li class="dept02"><a href="/sht_webapp/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_BBBBBBBBBBBB&menuNo=56">사이트갤러리관리</a></li>
			</ul> 
		</li>
		<% } %>
	</ul>
	</div>
	<div class="bottom"></div>		
</div>
<!-- //메뉴 끝 -->	
