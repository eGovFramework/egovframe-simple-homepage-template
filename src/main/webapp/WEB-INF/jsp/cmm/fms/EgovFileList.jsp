<%--
  Class Name : EgovFileList.jsp
  Description : 파일목록화면(include)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.26  이삼섭          최초 생성
     2011.08.31  JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.03.26  
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="egovc" uri="/WEB-INF/tlds/egovc.tld" %>
<script type="text/javascript">
	function fn_egov_downFile(atchFileId, fileSn){
		var downloadUrl = "<c:url value='/cmm/fms/FileDown.do'/>";
		window.open(downloadUrl + "?atchFileId=" + encodeURIComponent(atchFileId) + "&fileSn=" + encodeURIComponent(fileSn));
	}

	function fn_egov_deleteFile(atchFileId, fileSn) {
		// 동적으로 form 생성
		var form = document.createElement("form");
		form.method = "POST";
		form.action = "<c:url value='/cmm/fms/deleteFileInfs.do'/>";

		// hidden 필드 추가
		var fields = {
			"atchFileId": atchFileId,
			"fileSn": fileSn,
			"returnUrl": window.location.pathname + window.location.search
		};

		for (var key in fields) {
			var input = document.createElement("input");
			input.type = "hidden";
			input.name = key;
			input.value = fields[key];
			form.appendChild(input);
		}

		document.body.appendChild(form);
		form.submit();
	}

	function fn_egov_check_file(flag) {
		if (flag=="Y") {
			document.getElementById('file_upload_posbl').style.display = "block";
			document.getElementById('file_upload_imposbl').style.display = "none";
		} else {
			document.getElementById('file_upload_posbl').style.display = "none";
			document.getElementById('file_upload_imposbl').style.display = "block";
		}
	}
</script>


<div>
	<c:forEach var="fileVO" items="${fileList}" varStatus="status">
	       <c:choose>
		       <c:when test="${updateFlag=='Y'}">
			       <c:out value="${fileVO.orignlFileNm}"/>&nbsp;[<c:out value="${fileVO.fileMg}"/>&nbsp;byte]
			       <img alt="파일 삭제" src="<c:url value='/images/btn/bu5_close.gif'/>" 
			       		width="19" height="18" onClick="fn_egov_deleteFile('<c:out value="${atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>');" />
		       </c:when>
		       <c:otherwise>
			       <a href="#LINK" onclick="javascript:fn_egov_downFile('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>')">
			       <c:out value="${fileVO.orignlFileNm}"/>&nbsp;[<c:out value="${fileVO.fileMg}"/>&nbsp;byte]
			       </a>
		       </c:otherwise>
	       </c:choose>
        </c:forEach>
        <c:if test="${fn:length(fileList) == 0}">
	    </c:if>
</div>

<script type="text/javascript">
// 파일 목록 로드 후 첨부 버튼 상태 업데이트
(function() {
    // DOM이 완전히 준비될 때까지 약간의 지연
    setTimeout(function() {
        var updateFlag = "<c:out value='${updateFlag}'/>";
        var fileListCntValue = "<c:out value='${fileListCnt}'/>";

        if (!fileListCntValue || fileListCntValue === "") {
            fileListCntValue = "0";
        }

        // 부모 form 찾기
        var parentForm = document.querySelector("form[name='board']");
        if (!parentForm) {
            return;
        }

        // fileListCnt input 업데이트 또는 생성
        var fileListCntInput = parentForm.querySelector("input[name='fileListCnt']");
        if (!fileListCntInput) {
            fileListCntInput = document.createElement("input");
            fileListCntInput.type = "hidden";
            fileListCntInput.name = "fileListCnt";
            fileListCntInput.value = fileListCntValue;
            parentForm.appendChild(fileListCntInput);
        } else {
            fileListCntInput.value = fileListCntValue;
        }

        // 파일 업로드 가능 여부 계산 (updateFlag가 'Y'일 때만)
        if (updateFlag === 'Y') {
            var maxFileNumInput = parentForm.querySelector("input[name='posblAtchFileNumber']");
            var uploader = document.getElementById("egovComFileUploader");
            var listContainer = document.getElementById("egovComFileList");

            if (maxFileNumInput && uploader && listContainer) {
                var existFileNum = parseInt(fileListCntValue, 10);
                var maxFileNum = parseInt(maxFileNumInput.value, 10);

                if (isNaN(existFileNum)) existFileNum = 0;
                if (isNaN(maxFileNum)) maxFileNum = 0;

                var uploadableFileNum = maxFileNum - existFileNum;

                if (uploadableFileNum < 0) {
                    uploadableFileNum = 0;
                }
				
                if (uploadableFileNum > 0) {
                    // 첨부 버튼 표시
                    fn_egov_check_file("Y");
					
                    if (typeof MultiSelector !== "undefined") {
                        var multiSelector = new MultiSelector(listContainer, maxFileNum);
                        multiSelector.addElement(uploader);
                    }
                } else {
                    // 첨부 버튼 숨김
                    fn_egov_check_file("N");
                }
            }
        }
    }, 50);
})();
</script>