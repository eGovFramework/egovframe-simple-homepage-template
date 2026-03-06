<%--
  Class Name : EgovIndvdlSchdulManageMonthList.jsp
  Description : 일정관리 월별 조회
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.egovframe.rte.psl.dataaccess.util.EgovMap"%>
<%
java.util.Calendar cal = java.util.Calendar.getInstance();

String strYear = request.getParameter("year");
String strMonth = request.getParameter("month");

int year = cal.get(java.util.Calendar.YEAR);
int month = cal.get(java.util.Calendar.MONTH);
int date = cal.get(java.util.Calendar.DATE);

if(strYear != null)
{
  year = Integer.parseInt(strYear);
  month = Integer.parseInt(strMonth);
}else{
    
}
//년도/월 셋팅
cal.set(year, month, 1);

int startDay = cal.getMinimum(java.util.Calendar.DATE);
int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
int newLine = 0;
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일정 월별 목록 - 표준프레임워크 심플 홈페이지템플릿</title>
    <link rel="stylesheet" href="<c:url value='/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/layout.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/component.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/page.css'/>">
    <script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="<c:url value='/js/ui.js'/>"></script>

    <script type="text/javascript">
    function fn_egov_regist_IndvdlSchdulManage(sDate) {
        var gOpener = parent.document.all ? parent.document.IndvdlSchdulManageVO : parent.document.getElementById("IndvdlSchdulManageVO");
        if (gOpener) {
            gOpener.schdulBgnde.value = sDate;
            gOpener.schdulEndde.value = sDate;
            gOpener.action = "<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageRegist.do'/>";
            gOpener.submit();
        }
    }

    function fn_egov_detail_IndvdlSchdulManage(schdulId) {
        location.href = "<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDetail.do'/>?schdulId=" + schdulId;
    }

    function fnEgovSchdulSe(setValue) {
        location.href = "<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageMonthList.do'/>?year=<%=year%>&month=<%=month%>&searchCondition=SCHDUL_SE&searchKeyword=" + setValue;
    }

    function fnSchduleSearch(year, month) {
        var schdulSeElement = document.getElementById('schdulSe');
        var setValue = '';
        if (schdulSeElement && schdulSeElement.options && schdulSeElement.selectedIndex >= 0) {
            setValue = schdulSeElement.options[schdulSeElement.selectedIndex].value;
        }
        location.href = "<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageMonthList.do'/>?year=" + year + "&month=" + month + "&searchCondition=SCHDUL_SE&searchKeyword=" + setValue;
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
                                    <li>일정관리</li>
                                </ul>
                            </div>
                            <!--// Location -->

                            <h1 class="tit_1">사이트관리</h1>
                            <p class="txt_1">월별 일정을 확인하실 수 있습니다.</p>
                            <h2 class="tit_2">일정관리 월별 목록조회</h2>

                            <!-- Schedule Filter & Navigation -->
                            <form name="IndvdlSchdulManageVO" id="IndvdlSchdulManageVO" action="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageMonthList.do'/>" method="post">
                                <input type="hidden" name="deptSchdulManageVO" />
                                
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
                                            <%if(year > 2000){ %>
                                            <a href="#" onclick="fnSchduleSearch('<%=year-1%>', '<%=month%>'); return false;" class="btn_nav" title="이전 년도">◀</a>
                                            <%}%>
                                            <span class="nav_value"><%=year%>년</span>
                                            <a href="#" onclick="fnSchduleSearch('<%=year+1%>', '<%=month%>'); return false;" class="btn_nav" title="다음 년도">▶</a>
                                        </div>
                                        
                                        <div class="nav_group">
                                            <span class="nav_label">월</span>
                                            <%if(month > 0){ %>
                                            <a href="#" onclick="fnSchduleSearch('<%=year%>', '<%=month-1%>'); return false;" class="btn_nav" title="이전 월">◀</a>
                                            <%}%>
                                            <span class="nav_value"><%=month+1%>월</span>
                                            <%if(month < 11){ %>
                                            <a href="#" onclick="fnSchduleSearch('<%=year%>', '<%=month+1%>'); return false;" class="btn_nav" title="다음 월">▶</a>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>					
                                <!-- Calendar -->
                                <div class="calendar_wrap">
                                    <table class="calendar_table">
                                        <thead>
                                            <tr>
                                                <th class="sun">일</th>
                                                <th>월</th>
                                                <th>화</th>
                                                <th>수</th>
                                                <th>목</th>
                                                <th>금</th>
                                                <th class="sat">토</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                            <%
                                            List listResult = (List)request.getAttribute("resultList");
                                            EgovMap egovMap = new EgovMap();
                                            
                                            // 처음 빈공란 표시
                                            for(int index = 1; index < start; index++) {
                                                out.println("<td class=\"empty\"></td>");
                                                newLine++;
                                            }
                                            
                                            for(int index = 1; index <= endDay; index++) {
                                                String cellClass = "";
                                                String dateClass = "";
                                                
                                                if(newLine == 0) {
                                                    cellClass = "sun";
                                                    dateClass = "date_sun";
                                                } else if(newLine == 6) {
                                                    cellClass = "sat";
                                                    dateClass = "date_sat";
                                                } else {
                                                    dateClass = "date_default";
                                                }
                                                
                                                String sUseDate = Integer.toString(year);
                                                sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);
                                                sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);
                                                
                                                int iUseDate = Integer.parseInt(sUseDate);
                                                
                                                out.println("<td class=\"" + cellClass + "\">");
                                                out.println("<div class=\"date_cell\">");
                                                out.println("<a href=\"EgovIndvdlSchdulManageRegist.do?schdulBgnde=" + iUseDate + "&schdulEndde=" + iUseDate + "\" class=\"" + dateClass + "\">" + index + "</a>");
                                                
                                                if(listResult != null) {
                                                    out.println("<div class=\"schedule_list\">");
                                                    for(int i = 0; i < listResult.size(); i++) {
                                                        egovMap = (EgovMap)listResult.get(i);
                                                        
                                                        int iBeginDate = Integer.parseInt(((String)egovMap.get("schdulBgnde")).substring(0, 8));
                                                        int iBeginEnd = Integer.parseInt(((String)egovMap.get("schdulEndde")).substring(0, 8));
                                                        
                                                        if(iUseDate >= iBeginDate && iUseDate <= iBeginEnd) {
                                                            out.println("<a href=\"EgovIndvdlSchdulManageDetail.do?schdulId=" + (String)egovMap.get("schdulId") + "\" class=\"schedule_item\">");
                                                            out.print((String)egovMap.get("schdulNm"));
                                                            out.println("</a>");
                                                        }
                                                    }
                                                    out.println("</div>");
                                                }
                                                
                                                out.println("</div>");
                                                out.println("</td>");
                                                newLine++;
                                                
                                                if(newLine == 7) {
                                                    out.println("</tr>");
                                                    if(index < endDay) {
                                                        out.println("<tr>");
                                                    }
                                                    newLine = 0;
                                                }
                                            }
                                            
                                            // 마지막 공란 LOOP
                                            while(newLine > 0 && newLine < 7) {
                                                out.println("<td class=\"empty\"></td>");
                                                newLine++;
                                            }
                                            %>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!--// Calendar -->
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