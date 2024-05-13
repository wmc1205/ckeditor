<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/html/egovframework/com/cmm/utl/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-1.4.2.min.js'/>"></script>
</head>
<style>
.info{
/* 	display:flex; */
}
</style>
<script>

</script>
<body>
<div id="container">
	<h1>writeView</h1>
	<form action="/saveNotice.do" method="post" enctype="multipart/form-data">
		<div id="noticeInfo" style="display:inline-grid" >
			<div class="info">
				<label>title</label>
				<input type="text" name="title" id="title">
			</div>
			<div class="info">
				<label>name</label>
				<input type="text" name="name" id="name">
			</div>
		</div>
	<textarea name="content" id="content" cols="95" rows="28"></textarea>
	<input type="submit" value="저장">
	</form>
	<input type="file" name="file" id="file" >
	<button type="button" id="btnJoin">체크</button>
	<button id="returnBtn" type="button">돌아가기</button>
</div>
<%-- <ckeditor:replace replace="content" basePath="${pageContext.request.contextPath}/html/egovframework/com/cmm/utl/ckeditor"/> --%>

<script>
$(document).ready(function(){
	var ckeditor_config = {
			//filebrowserImageUploadUrl: '${pageContext.request.contextPath}/utl/wed/insertImageCk.do', // 파일 업로드를 처리 할 경로 설정.
			filebrowserImageUploadUrl: '${pageContext.request.contextPath}/ckUploadImage.do', // 파일 업로드를 처리 할 경로 설정(CK필터).
		};
	CKEDITOR.replace('content',ckeditor_config);
	CKEDITOR.on('dialogDefinition', function (ev) {
        var dialogName = ev.data.name;
        var dialog = ev.data.definition.dialog;
        var dialogDefinition = ev.data.definition;
        if (dialogName == 'image') { // 이미지 속성
        	dialog.on('show', function (obj) {
        		this.selectPage('Upload'); //업로드텝으로 시작
        		});
            dialogDefinition.removeContents('advanced'); // 자세히탭 제거
            dialogDefinition.removeContents('Link'); // 링크탭 제거
            
            var infoTab = dialogDefinition.getContents( 'info' );  //info탭을 제거하면 이미지 업로드가 안된다.
            // Remove unnecessary widgets/elements from the 'Image Info' tab.
            infoTab.remove( 'txtHSpace'); //info 탭 내에 불필요한 엘레멘트들 제거
            infoTab.remove( 'txtVSpace');
            infoTab.remove( 'txtBorder');
            infoTab.remove( 'txtWidth');
            infoTab.remove( 'txtHeight');
            infoTab.remove( 'ratioLock');
        }
        if (dialogName == 'link') { // 링크 속성
            dialogDefinition.removeContents('target'); // 타겟 제거
            dialogDefinition.removeContents('upload'); // 업로드 제거
            dialogDefinition.removeContents('advanced'); // 고급 제거
        }
    });
	
	$('#returnBtn').click(function(){
		location.href='<c:url value="${pageContext.request.contextPath}/main.do" />';
	})
	
	$('#file').change(function(){
	    var maxSize = 10 * 1024 * 1024; // 10MB
	    var fileSize = $("#file")[0].files[0].size;
	    
	    console.log("====File Size=====");
	    console.log("fileSize : " + fileSize);
	    console.log("=================")
	    if(fileSize > maxSize){
	    alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다.");
	    $("#file").val("");
	    return;
	    }
	})
});


function uploadFile() {
    var maxSize = 10 * 1024 * 1024; // 10MB
    var fileSize = $("#file")[0].files[0].size;
    
    console.log("====File Size=====");
    console.log("fileSize : " + fileSize);
    console.log("=================")
    if(fileSize > maxSize){
    alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다.");
    $("#file").val("");
    return;
    }
 }
</script>
</body>
</html>