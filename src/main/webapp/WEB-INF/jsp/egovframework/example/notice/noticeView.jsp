<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/html/egovframework/com/cmm/utl/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.2.min.js"></script>
<style type="text/css">
.input_wrap{
	padding: 5px 20px;
}
label{
    display: block;
    margin: 10px 0;
    font-size: 20px;	
}
input{
	padding: 5px;
    font-size: 17px;
}
textarea{
	width: 800px;
    height: 200px;
    font-size: 15px;
    padding: 10px;
}
.btn{
  	display: inline-block;
    font-size: 22px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
    width: 140px;
    height: 41px;
    line-height: 39px;
    text-align : center;
    margin-left : 30px;
    cursor : pointer;
}
.btn_wrap{
	padding-left : 80px;
	margin-top : 50px;
}
</style>
</head>
<body>
<h1>조회 페이지</h1>
	<div class="input_wrap">
		<label>게시판 번호</label>
		<input name="bno" readonly="readonly" value='<c:out value="${noticeVO.testId}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 제목</label>
		<input name="title" readonly="readonly" value='<c:out value="${noticeVO.title}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 내용</label>
		<textarea rows="3" name="content" readonly="readonly"><c:out value="${noticeVO.content}"/></textarea>
	</div>
	<div class="input_wrap">
		<label>게시판 작성자</label>
		<input name="writer" readonly="readonly" value='<c:out value="${noticeVO.name}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 등록일</label>
		<input name="regdater" readonly="readonly" value='<c:out value="${noticeVO.reg_dt}"/>' >
	</div>
	<div class="btn_wrap">
		<a class="btn" id="list_btn">목록 페이지</a> 
		<a class="btn" id="modify_btn">수정 하기</a>
	</div>
	<form id="infoForm" action="/board/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${noticeVO.testId}"/>'>
	</form>
<script>
var ckeditor_config = {
		//filebrowserImageUploadUrl: '${pageContext.request.contextPath}/utl/wed/insertImageCk.do', // 파일 업로드를 처리 할 경로 설정.
		filebrowserImageUploadUrl: '${pageContext.request.contextPath}/ckUploadImage.do', // 파일 업로드를 처리 할 경로 설정(CK필터).
		toolbarGroups:[ 
			{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
			{ name: 'forms', groups: [ 'forms' ] },
			{ name: 'tools', groups: [ 'tools' ] },
			{ name: 'insert', groups: [ 'insert' ] },
			{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
			{ name: 'basicstyles',groups:['basicstyles','cleanup']},
			{ name: 'stlyes',groups:['styles']},
			{ name: 'paragraph',groups:['list','indent','blocks','align','bidi','paragraph']}
			]
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
	let form = $("#infoForm");
	
	$("#list_btn").click( function(e){
		location.href='<c:url value="${pageContext.request.contextPath}/main.do" />';
	});
	
	$("#modify_btn").click( function(e){
		form.attr("action", "/board/modify");
		form.submit();
	});	
</script>	
</body>
</html>