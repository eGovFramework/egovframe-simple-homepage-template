<%--
  Class Name : EgovIncFooter.jsp
  Description : 화면하단 Footer(include)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성
     2025.01.06   System    모던 디자인 개선

    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- footer -->
<div class="footer">
    <div class="inner">
        <h1><a href="<c:url value='/cmm/main/mainPage.do'/>"><img src="<c:url value='/images/logo_footer.png'/>" alt="표준프레임워크 포털 eGovFrame"></a></h1>

        <div class="mid">
            <address>
                대표문의메일 : egovframesupport@gmail.com  |  대표전화 : 0000-0000 (000-0000-0000)<br>
                호환성확인 : 000-0000-0000  |  교육문의 : 000-0000-0000
            </address>
            <p class="copy">Copyright © 2025 Ministry Of The Interior And Safety. All Rights Reserved.</p>
        </div>

        <div class="right_col">
            <a href="#LINK"><img src="<c:url value='/images/banner01.png'/>" alt="행정안전부"></a>
            <a href="#LINK"><img src="<c:url value='/images/banner02.png'/>" alt="NIA 한국지능정보사회진흥원"></a>
        </div>
    </div>
</div>
<!--// footer -->
