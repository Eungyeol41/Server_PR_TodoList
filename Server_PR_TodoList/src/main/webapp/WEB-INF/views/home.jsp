<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TO DO LIST</title>
<link href="${rootPath}/static/css/home.css?ver2021-05-25" rel="stylesheet" />
<script>
	document.addEventListener("DOMContentLoaded",function(){ 
		document.querySelector("table#tdlist").addEventListener("click",function(ev){
			
			let tag_name = ev.target.tagName;
			if(tag_name == "TD") {
				let td_seq = ev.target.closest("TR").dataset.seq
				document.location.href = "${rootPath}/todo/view?td_seq=" + td_seq;
			}
		})

	}) // 전체

</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/nav.jsp" %>
	<table id="tdlist">
		<tr>
			<th>No.</th>
			<th>할 일</th>
			<th>작성일자</th>
			<th>장소</th>
		</tr>
		<c:forEach items="${TDLIST}" var="TD" varStatus="index">
			<tr data-seq="${TD.td_seq}">
				<td>${index.count}</td>
				<td>${TD.td_todo}</td>
				<td>${TD.td_date}</td>
				<td>${TD.td_place}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>