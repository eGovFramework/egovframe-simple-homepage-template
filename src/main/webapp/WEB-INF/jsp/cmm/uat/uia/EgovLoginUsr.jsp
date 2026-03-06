<%--
  Class Name : EgovLoginUsr.jsp
  Description : Login 인증 화면
  Modification Information
 
    수정일         수정자        수정내용
    -----------  --------    ---------------------------
     2009.03.03  박지욱        최초 생성
     2011.08.31  JJY         경량환경 버전 생성
     2026.01.12  신용호        신규 디자인 적용
 
    author   : 공통서비스 개발팀 박지욱
    since    : 2009.03.03
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
    <title>로그인 - 표준프레임워크 심플 홈페이지템플릿</title>
    <link rel="stylesheet" href="<c:url value='/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/layout.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/component.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/page.css'/>">
    <script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="<c:url value='/js/ui.js'/>"></script>
<script type="text/javascript">
function actionLogin() {
    if (document.loginForm.id.value == "") {
        alert("아이디를 입력하세요");
        return false;
    } else if (document.loginForm.password.value == "") {
        alert("비밀번호를 입력하세요");
        return false;
    } else {
        // ID 저장 기능 실행
        saveid(document.loginForm);
        document.loginForm.action = "<c:url value='/uat/uia/actionLogin.do'/>";
        document.loginForm.submit();
    }
}

function setCookie(name, value, expires) {
    document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expires.toGMTString();
}

function getCookie(Name) {
    var search = Name + "=";
    if (document.cookie.length > 0) {
        offset = document.cookie.indexOf(search);
        if (offset != -1) {
            offset += search.length;
            end = document.cookie.indexOf(";", offset);
            if (end == -1)
                end = document.cookie.length;
            return unescape(document.cookie.substring(offset, end));
        }
    }
    return "";
}

function saveid(form) {
    var expdate = new Date();
    // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
    if (form.checkId.checked)
        expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
    else
        expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
    setCookie("saveid", form.id.value, expdate);
}

function getid(form) {
    var savedId = getCookie("saveid");
    if (savedId != "") {
        form.id.value = savedId;
        form.checkId.checked = true;
        // 체크박스의 부모 label에 'on' 클래스 추가
        var checkboxLabel = form.checkId.parentElement;
        if (checkboxLabel && checkboxLabel.classList) {
            checkboxLabel.classList.add('on');
        }
    } else {
        form.checkId.checked = false;
        // 체크박스의 부모 label에서 'on' 클래스 제거
        var checkboxLabel = form.checkId.parentElement;
        if (checkboxLabel && checkboxLabel.classList) {
            checkboxLabel.classList.remove('on');
        }
    }
}

function fnInit() {
    var message = document.loginForm.message.value;
    if (message != "") {
        alert(message);
    }
    
    getid(document.loginForm);
    
    // 체크박스 상태 변경 시 쿠키 저장 (ui.js가 'on' 클래스는 관리함)
    var checkbox = document.getElementById('checkId');
    if (checkbox) {
        // 초기 상태 동기화 (ui.js가 로드되기 전이므로 직접 설정)
        setTimeout(function() {
            var checkboxLabel = checkbox.parentElement;
            if (checkbox.checked) {
                if (checkboxLabel && checkboxLabel.classList) {
                    checkboxLabel.classList.add('on');
                }
            } else {
                if (checkboxLabel && checkboxLabel.classList) {
                    checkboxLabel.classList.remove('on');
                }
            }
        }, 100);
        
        // change 이벤트 리스너 추가 (쿠키 저장용)
        checkbox.addEventListener('change', function() {
            saveid(document.loginForm);
        });
    }
}
</script>
</head>
<body onLoad="fnInit();">
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<!-- Skip navigation -->
<a href="#contents" class="skip_navi">본문 바로가기</a>

<div class="wrap">
    <!-- Header -->
    <jsp:include page="/WEB-INF/jsp/main/inc/EgovIncHeader.jsp"/>
    <!--// Header -->

    <div class="container">
        <div class="p_login">
            <h1>로그인</h1>
            <p class="txt">표준프레임워크 심플 홈페이지 로그인 페이지입니다.<br>
                로그인을 하시면 모든 서비스를 제한없이 이용하실 수 있습니다.</p>
            
            <div class="loginbox">
                <form name="loginForm" action="<c:url value='/uat/uia/actionLogin.do'/>" method="post">
                    <input type="hidden" name="message" value="${message}" />
                    <input type="hidden" name="userSe" value="USR"/>
                    
                    <fieldset>
                        <legend>로그인</legend>

                        <dl>
                            <dt><label for="id">아이디</label></dt>
                            <dd><input type="text" name="id" id="id" title="아이디" maxlength="10" placeholder="아이디를 입력하세요"/></dd>
                        </dl>

                        <dl>
                            <dt><label for="password">비밀번호</label></dt>
                            <dd>
                                <input type="password" name="password" id="password" title="비밀번호" maxlength="25" placeholder="비밀번호를 입력하세요" onKeyDown="javascript:if (event.keyCode == 13) { actionLogin(); }"/>
                                <label for="checkId" class="f_chk">
                                    <input type="checkbox" name="checkId" id="checkId" title="ID 저장" />
                                    <span>ID 저장</span>
                                </label>
                            </dd>
                        </dl>

                        <div class="btn_a">
                            <a href="#" class="btn" onClick="actionLogin(); return false;">로그인</a>
                        </div>
                        
                        <div class="login_info">
                            <p>비밀번호는 6~12자의 영문 대/소문자, 숫자, 특수문자를 혼합해서 사용하실 수 있습니다.</p>
                            <p>쉬운 비밀번호나 자주 쓰는 사이트의 비밀번호가 같을 경우, 도용되기 쉬우므로 주기적으로 변경하셔서 사용하는 것이 좋습니다.</p>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="/WEB-INF/jsp/main/inc/EgovIncFooter.jsp"/>
    <!--// Footer -->
</div>

</body>
</html>
