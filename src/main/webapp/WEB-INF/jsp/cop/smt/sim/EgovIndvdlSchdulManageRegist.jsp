<%--
  Class Name : EgovIndvdlSchdulManageRegist.jsp
  Description : 일정관리 등록 페이지
  Modification Information
 
    수정일        수정자        수정내용
    ----------  --------    ---------------------------
    2008.03.09  장동한        최초 생성
    2011.08.31  JJY         경량환경 버전 생성
    2026.01.12  신용호        신규 디자인 적용
 
    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09
   
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ImgUrl" value="/images/egovframework/cop/smt/sim/"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일정 등록 - 표준프레임워크 심플 홈페이지템플릿</title>
    <link rel="stylesheet" href="<c:url value='/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/layout.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/component.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/page.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/jqueryui.css'/>">
    <script src="<c:url value='/js/jquery-1.11.2.min.js'/>"></script>
    <script src="<c:url value='/js/ui.js'/>"></script>
    <script src="<c:url value='/js/jqueryui.js'/>"></script>

<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/EgovValidation.js'/>" ></script>
<script type="text/javaScript" language="javascript">


/* ********************************************************
 * 초기화
 ******************************************************** */
 function fn_egov_init_IndvdlSchdulManage(){

     var maxFileNum = document.getElementById('posblAtchFileNumber').value;
     
     if(maxFileNum==null || maxFileNum==""){
          maxFileNum = 3;
      }
          
     var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
     
     multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );


     document.getElementsByName('reptitSeCode')[0].checked = true;


     if("${indvdlSchdulManageVO.schdulBgnde}".length > 0){
         var schdulBgnde = "${indvdlSchdulManageVO.schdulBgnde}";
         document.getElementById("schdulBgndeYYYMMDD").value = schdulBgnde.substring(0,4) + "-" + schdulBgnde.substring(4,6) + "-" + schdulBgnde.substring(6,8);
     } else {
         var now = new Date();
         var year = now.getFullYear();
         var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
         var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
         document.getElementById("schdulBgndeYYYMMDD").value = year + "-" + mon + "-" + day;
     }

     if("${indvdlSchdulManageVO.schdulEndde}".length > 0){
         var schdulEndde = "${indvdlSchdulManageVO.schdulEndde}";
         document.getElementById("schdulEnddeYYYMMDD").value = schdulEndde.substring(0,4) + "-" + schdulEndde.substring(4,6) + "-" + schdulEndde.substring(6,8);
     } else {
         var now = new Date();
         var year = now.getFullYear();
         var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
         var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
         document.getElementById("schdulEnddeYYYMMDD").value = year + "-" + mon + "-" + day;
     }
}
/* ********************************************************
| * 달력 초기화 (jQuery UI Datepicker)
| ******************************************************** */
function fn_egov_init_datepicker(){
    
    $("#schdulBgndeYYYMMDD").datepicker(
        {dateFormat:'yy-mm-dd'
         , showOn: 'button'
         , buttonImage: '<c:url value='/images/ico_calendar.png'/>'
         , buttonImageOnly: true
         
         , showMonthAfterYear: true
         , showOtherMonths: true
         , selectOtherMonths: true
         , monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
            
         , changeMonth: true // 월선택 select box 표시 (기본은 false)
         , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
         , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
    });

    $("#schdulEnddeYYYMMDD").datepicker( 
        {dateFormat:'yy-mm-dd'
         , showOn: 'button'
         , buttonImage: '<c:url value='/images/ico_calendar.png'/>'
         , buttonImageOnly: true
         
         , showMonthAfterYear: true
         , showOtherMonths: true
         , selectOtherMonths: true
         , monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
            
         , changeMonth: true // 월선택 select box 표시 (기본은 false)
         , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
         , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
    });
}
/* ********************************************************
* 목록 으로 가기
******************************************************** */
function fn_egov_list_IndvdlSchdulManage(){
  location.href = "${pageContext.request.contextPath}/cop/smt/sim/EgovIndvdlSchdulManageMonthList.do";
}
/* ********************************************************
* 저장처리화면
******************************************************** */
function fn_egov_save_IndvdlSchdulManage(){
  //form.submit();return;
  var form = document.getElementById("indvdlSchdulManageVO");
  if(confirm("<spring:message code="common.save.msg" />")){
	  if(!validateIndvdlSchdulManageVO(document.indvdlSchdulManageVO)){  
          return;
      }else{
          var schdulBgndeYYYMMDD = document.getElementById('schdulBgndeYYYMMDD').value;
          var schdulEnddeYYYMMDD = document.getElementById('schdulEnddeYYYMMDD').value;
          schdulBgndeYYYMMDD = schdulBgndeYYYMMDD.replaceAll('-','');
          schdulEnddeYYYMMDD = schdulEnddeYYYMMDD.replaceAll('-','');
          if(schdulBgndeYYYMMDD > schdulEnddeYYYMMDD) { alert("일정종료일자가  일정시작일자보다 작을수 없습니다"); return false; }
          form.schdulBgnde.value = schdulBgndeYYYMMDD.replaceAll('-','') + fn_egov_SelectBoxValue('schdulBgndeHH') +  fn_egov_SelectBoxValue('schdulBgndeMM') + '00';
          form.schdulEndde.value = schdulEnddeYYYMMDD.replaceAll('-','') + fn_egov_SelectBoxValue('schdulEnddeHH') +  fn_egov_SelectBoxValue('schdulEnddeMM') + '00';
          form.submit();
      }
  }
}

/* ********************************************************
* RADIO BOX VALUE FUNCTION
******************************************************** */
function fn_egov_RadioBoxValue(sbName)
{
  var FLength = document.getElementsByName(sbName).length;
  var FValue = "";
  for(var i=0; i < FLength; i++)
  {
      if(document.getElementsByName(sbName)[i].checked == true){
          FValue = document.getElementsByName(sbName)[i].value;
      }
  }
  return FValue;
}
/* ********************************************************
* SELECT BOX VALUE FUNCTION
******************************************************** */
function fn_egov_SelectBoxValue(sbName)
{
  var FValue = "";
  for(var i=0; i < document.getElementById(sbName).length; i++)
  {
      if(document.getElementById(sbName).options[i].selected == true){
          
          FValue=document.getElementById(sbName).options[i].value;
      }
  }
  
  return  FValue;
}
/* ********************************************************
* PROTOTYPE JS FUNCTION
******************************************************** */
String.prototype.trim = function(){
  return this.replace(/^\s+|\s+$/g, "");
}

String.prototype.replaceAll = function(src, repl){
   var str = this;
   if(src == repl){return str;}
   while(str.indexOf(src) != -1) {
      str = str.replace(src, repl);
   }
   return str;
}
</script>


<style type="text/css">
.ui-datepicker-trigger {
    margin-left: 5px;
    vertical-align: middle;
    cursor: pointer;
}
</style>

</head>
<body onLoad="fn_egov_init_IndvdlSchdulManage(); fn_egov_init_datepicker();">
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
                                    <li>일정관리 등록</li>
                                </ul>
                            </div>
                            <!--// Location -->

                            <h1 class="tit_1">알림마당</h1>
                            <p class="txt_1">일정을 등록합니다.</p>
                            <h2 class="tit_2">일정관리</h2>
                            <h3 class="tit_3">일정 등록</h3>

                            <!-- 등록 폼 -->
                            <form:form modelAttribute="indvdlSchdulManageVO" action="${pageContext.request.contextPath}/cop/smt/sim/EgovIndvdlSchdulManageRegistActor.do" name="indvdlSchdulManageVO" method="post" enctype="multipart/form-data">
                                <div class="board_view2">
                                    <table>
                                        <caption>일정 등록 정보</caption>
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="schdulSe">일정구분</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select" for="schdulSe">
                                                    <form:select path="schdulSe">
                                                        <form:option value="" label="선택"/>
                                                        <form:options items="${schdulSe}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                                <form:errors path="schdulSe" cssClass="error"/>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="lb">
                                                <label for="schdulIpcrCode">중요도</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select" for="schdulIpcrCode">
                                                    <form:select path="schdulIpcrCode">
                                                        <form:option value="" label="선택"/>
                                                        <form:options items="${schdulIpcrCode}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                                <form:errors path="schdulIpcrCode" cssClass="error"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="schdulDeptName">부서</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input path="schdulDeptName" cssClass="f_txt w_full" readonly="true" maxlength="1000" title="부서명" />
                                                <form:hidden path="schdulDeptId" />
                                                <form:errors path="schdulDeptName" cssClass="error"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="schdulNm">일정명</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input path="schdulNm" cssClass="f_txt w_full" maxlength="200" title="일정명" />
                                                <form:errors path="schdulNm" cssClass="error"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="schdulCn">일정 내용</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:textarea path="schdulCn" cssClass="f_txtar w_full h_200" rows="5" title="일정 내용" />
                                                <form:errors path="schdulCn" cssClass="error"/>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="lb">
                                                <label>반복구분</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <span class="radio_wrap">
                                                    <label for="reptit1"><form:radiobutton path="reptitSeCode" value="1" id="reptit1" /> 당일</label>
                                                    <label for="reptit2"><form:radiobutton path="reptitSeCode" value="2" id="reptit2" /> 반복</label>
                                                    <label for="reptit3"><form:radiobutton path="reptitSeCode" value="3" id="reptit3" /> 연속</label>
                                                </span>
                                                <form:errors path="reptitSeCode" cssClass="error"/>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="lb">
                                                <label>날짜/시간</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <div class="date_sec">
                                                    <form:input path="schdulBgndeYYYMMDD" cssClass="f_date" maxlength="10" title="일정 시작일" />
                                                    <label class="f_select" for="schdulBgndeHH">
                                                        <form:select path="schdulBgndeHH">
                                                            <form:options items="${schdulBgndeHH}" itemValue="code" itemLabel="codeNm"/>
                                                        </form:select>
                                                    </label>
                                                    <span class="txt">시</span>
                                                    <label class="f_select" for="schdulBgndeMM">
                                                        <form:select path="schdulBgndeMM">
                                                            <form:options items="${schdulBgndeMM}" itemValue="code" itemLabel="codeNm"/>
                                                        </form:select>
                                                    </label>
                                                    <span class="txt">분</span>
                                                    <span class="txt bar">~</span>
                                                    <form:input path="schdulEnddeYYYMMDD" cssClass="f_date" maxlength="10" title="일정 종료일" />
                                                    <label class="f_select" for="schdulEnddeHH">
                                                        <form:select path="schdulEnddeHH">
                                                            <form:options items="${schdulEnddeHH}" itemValue="code" itemLabel="codeNm"/>
                                                        </form:select>
                                                    </label>
                                                    <span class="txt">시</span>
                                                    <label class="f_select" for="schdulEnddeMM">
                                                        <form:select path="schdulEnddeMM">
                                                            <form:options items="${schdulEnddeMM}" itemValue="code" itemLabel="codeNm"/>
                                                        </form:select>
                                                    </label>
                                                    <span class="txt">분</span>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="lb">
                                                <label for="schdulChargerName">담당자</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input path="schdulChargerName" cssClass="f_txt w_full" readonly="true" maxlength="10" title="담당자명" />
                                                <form:errors path="schdulChargerName" cssClass="error"/>
                                                <form:hidden path="schdulChargerId" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="egovComFileUploader">파일첨부</label>
                                            </td>
                                            <td>
                                                <input name="file_1" id="egovComFileUploader" title="파일첨부" type="file" class="w_full" />
                                                <div id="egovComFileList" class="file_list"></div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>

                                <!-- 버튼 영역 -->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                    </div>
                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46" onclick="JavaScript:fn_egov_save_IndvdlSchdulManage();">저장</a>
                                        <a href="${pageContext.request.contextPath}/cop/smt/sim/EgovIndvdlSchdulManageMonthList.do" class="btn btn_blue_46" onclick="JavaScript:fn_egov_list_IndvdlSchdulManage(); return false;">목록</a>
                                    </div>
                                </div>
                                <!--// 버튼 영역 -->

                                <!-- Hidden Fields -->
                                <input name="cmd" id="cmd" type="hidden" value="<c:out value='save'/>"/>
                                <input type="hidden" name="schdulKindCode" id="schdulKindCode" value="2" />
                                <input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cmm/EgovselectNormalCalendar.do'/>" />
                                <input type="hidden" name="schdulBgnde" id="schdulBgnde" value="" />
                                <input type="hidden" name="schdulEndde" id="schdulEndde" value="" />
                                <input type="hidden" name="posblAtchFileNumber" id="posblAtchFileNumber" value="3" />
                            </form:form>
                            <!--// 등록 폼 -->

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

