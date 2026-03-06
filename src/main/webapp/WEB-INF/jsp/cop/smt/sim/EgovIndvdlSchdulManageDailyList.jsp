<%--
  Class Name : EgovIndvdlSchdulManageDailyList.jsp
  Description : 일정관리 일별 조회
  Modification Information
 
    수정일        수정자        수정내용
    ----------  --------    ---------------------------
    2008.03.09  장동한        최초 생성
    2011.08.31  JJY         경량환경 버전 생성
    2026.01.12  신용호        신규 디자인 적용
 
    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09
   
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="org.egovframe.rte.psl.dataaccess.util.EgovMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%!
    public String DateTypeIntForString(int iInput){
        String sOutput = "";
        if(Integer.toString(iInput).length() == 1){
            sOutput = "0" + Integer.toString(iInput);
        }else{
            sOutput = Integer.toString(iInput);
        }
        
       return sOutput;
    }
%>

<%
int iNowYear = (Integer)request.getAttribute("year");
int iNowMonth = (Integer)request.getAttribute("month");
int iNowDay = (Integer)request.getAttribute("day");

java.util.Calendar cal = java.util.Calendar.getInstance();
//년도/월 셋팅
cal.set(iNowYear, iNowMonth, 1);

int iEndDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
%> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일정 일별 목록 - 표준프레임워크 심플 홈페이지템플릿</title>
    <link rel="stylesheet" href="<c:url value='/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/layout.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/component.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/page.css'/>">
    <script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="<c:url value='/js/ui.js'/>"></script>
    <script type="text/javascript">
    function fn_egov_regist_DeptSchdulManage(sDate) {
        var gOpener = parent.document.all ? parent.document.IndvdlSchdulManageVO : parent.document.getElementById("IndvdlSchdulManageVO");
        if (gOpener) {
            gOpener.schdulBgnde.value = sDate;
            gOpener.schdulEndde.value = sDate;
            gOpener.action = "<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageRegist.do'/>";
            gOpener.submit();
        }
    }

    function fn_egov_detail_DeptSchdulManage(schdulId) {
        location.href = "<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDetail.do'/>?schdulId=" + schdulId;
    }

    function fnEgovSchdulSe(setValue) {
        location.href = "<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDailyList.do'/>?year=<%=iNowYear%>&month=<%=iNowMonth%>&day=<%=iNowDay%>&searchCondition=SCHDUL_SE&searchKeyword=" + setValue;
    }

    function fnSchduleSearch(year, month, day) {
        var schdulSeElement = document.getElementById('schdulSe');
        var setValue = '';
        if (schdulSeElement && schdulSeElement.options && schdulSeElement.selectedIndex >= 0) {
            setValue = schdulSeElement.options[schdulSeElement.selectedIndex].value;
        }
        location.href = "<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDailyList.do'/>?year=" + year + "&month=" + month + "&day=" + day + "&searchCondition=SCHDUL_SE&searchKeyword=" + setValue;
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
                                    <li><a href="#">알림마당</a></li>
                                    <li>오늘의 행사</li>
                                </ul>
                            </div>
                            <!--// Location -->

                            <h1 class="tit_1">알림마당</h1>
                            <p class="txt_1">오늘의 일정을 확인하실 수 있습니다.</p>
                            <h2 class="tit_2">일정관리 일별 목록조회</h2>

                            <!-- Schedule Filter & Navigation -->
                            <form name="deptSchdulManageVO" id="deptSchdulManageVO" action="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDailyList.do'/>" method="post">
                                <div class="schedule_filter_section">
                                    <div class="filter_row">
                                        <div class="filter_item">
                                            <label for="schdulSe">일정 구분</label>
                                            <select name="schdulSe" id="schdulSe" class="select_box" onChange="fnEgovSchdulSe(this.value);">
                                                <option value="">-- 전체 --</option>
                                                <c:forEach var="result" items="${schdulSe}" varStatus="status">
                                                    <option value='${result.code}' <c:if test="${searchKeyword == result.code}">selected</c:if>>${result.codeNm}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="schedule_navigation">
                                        <div class="nav_group">
                                            <span class="nav_label">년도</span>
                                            <%if(iNowYear > 2000){ %>
                                            <a href="#" onclick="fnSchduleSearch('<%=iNowYear-1%>','<%=iNowMonth%>','<%=iNowDay%>'); return false;" class="btn_nav" title="이전 년도">◀</a>
                                            <%}%>
                                            <span class="nav_value"><%=iNowYear%>년</span>
                                            <a href="#" onclick="fnSchduleSearch('<%=iNowYear+1%>','<%=iNowMonth%>','<%=iNowDay%>'); return false;" class="btn_nav" title="다음 년도">▶</a>
                                        </div>
                                        
                                        <div class="nav_group">
                                            <span class="nav_label">월</span>
                                            <%if(iNowMonth > 0){ %>
                                            <a href="#" onclick="fnSchduleSearch('<%=iNowYear%>','<%=iNowMonth-1%>','<%=iNowDay%>'); return false;" class="btn_nav" title="이전 월">◀</a>
                                            <%}%>
                                            <span class="nav_value"><%=iNowMonth+1%>월</span>
                                            <%if(iNowMonth < 11){ %>
                                            <a href="#" onclick="fnSchduleSearch('<%=iNowYear%>','<%=iNowMonth+1%>','<%=iNowDay%>'); return false;" class="btn_nav" title="다음 월">▶</a>
                                            <%}%>
                                        </div>
                                        
                                        <div class="nav_group">
                                            <span class="nav_label">일</span>
                                            <%if(iNowDay > 0){ %>
                                            <a href="#" onclick="fnSchduleSearch('<%=iNowYear%>','<%=iNowMonth%>','<%=iNowDay-1%>'); return false;" class="btn_nav" title="이전 일">◀</a>
                                            <%}%>
                                            <span class="nav_value"><%=iNowDay%>일</span>
                                            <%if(iNowDay < iEndDay-1){ %>
                                            <a href="#" onclick="fnSchduleSearch('<%=iNowYear%>','<%=iNowMonth%>','<%=iNowDay+1%>'); return false;" class="btn_nav" title="다음 일">▶</a>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                                <!-- Schedule Table -->
                                <div class="schedule_table_wrap">
                                    <table class="schedule_table daily_schedule">
                                        <colgroup>
                                            <col style="width: 20%;">
                                            <col style="width: 65%;">
                                            <col style="width: 15%;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th scope="col">시간</th>
                                                <th scope="col">제목</th>
                                                <th scope="col">담당자</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                            List listResult = (List)request.getAttribute("resultList");
                                            EgovMap egovMap = new EgovMap();
                                            if(listResult != null && !listResult.isEmpty()){
                                                for(int i=0; i < listResult.size(); i++){
                                                    egovMap = (EgovMap)listResult.get(i);
                                            %>
                                            <tr>
                                                <td class="time_cell">
                                                    <%
                                                    out.print("<a href=\"JavaScript:fn_egov_detail_DeptSchdulManage('" + (String)egovMap.get("schdulId") + "')\" class=\"time_link\">");
                                                    out.print(((String)egovMap.get("schdulBgnde")).substring(8,10) + ":" + ((String)egovMap.get("schdulBgnde")).substring(10,12));
                                                    out.print(" ~ ");
                                                    out.print(((String)egovMap.get("schdulEndde")).substring(8,10) + ":" + ((String)egovMap.get("schdulEndde")).substring(10,12));
                                                    out.println("</a>");
                                                    %>
                                                </td>
                                                <td class="title_cell">
                                                    <%
                                                    out.print("<a href=\"JavaScript:fn_egov_detail_DeptSchdulManage('" + (String)egovMap.get("schdulId") + "')\" class=\"title_link\">");
                                                    out.print((String)egovMap.get("schdulNm"));
                                                    out.println("</a>");
                                                    %>
                                                </td>
                                                <td class="user_cell">
                                                    <%
                                                    out.print("<a href=\"JavaScript:fn_egov_detail_DeptSchdulManage('" + (String)egovMap.get("schdulId") + "')\" class=\"user_link\">");
                                                    out.print((String)egovMap.get("userNm"));
                                                    out.println("</a>");
                                                    %>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                            } else {
                                            %>
                                            <tr>
                                                <td colspan="3" class="no_data">
                                                    <span class="no_data_icon">📅</span>
                                                    <p>검색된 일정이 없습니다.</p>
                                                </td>
                                            </tr>
                                            <%
                                            }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                                <!--// Schedule Table -->
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