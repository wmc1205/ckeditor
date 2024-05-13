<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.2.min.js"></script>
</head>

<body>
<div id="container">
	<h1>게시판(CKEDITOR 적용)</h1>
	<table id="selectTable">
		<thead>
			<tr>
				<th>순번</th>
				<th>제목</th>
				<th>작성자</th>
			</tr>
		</thead>
		<tbody>
			
			<c:forEach var="list" items="${resultList }" varStatus="status">
			<tr>
				<td>${list.testid }</td>
				<td><a class="move" href="${pageContext.request.contextPath }/selectNotice.do?testid=${list.testid }">${list.title }</a></td>
				<td>${list.name }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<form id="moveForm" method="get">    
    </form>
	<button type="button" id="goWriteViewBtn">글쓰기</button>
</div>
<script>
	$(document).ready(function(){
		
		$('#goWriteViewBtn').click(function(){
			location.href="<c:url value='${pageContext.request.contextPath }/writeView.do'/>";
		})
		
		
	})
	
	
</script>
</body>
</html>