<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VIEW</title>
<style>
	table {
		border-collapse: collapse;
		width: 80%;
		margin: 5px auto;
	}
	
	td, th {
		border: 1px solid gainsboro;
		padding: 5px;
		text-align: center;
	}
	
	div.view_btn {
		width: 80%;
		margin: 10px auto;
		text-align: right;
	}
	
	div.view_btn button {
		margin: 5px;
		padding: 8px;
		outline: none;
		border: none;
		color: white;
	}
	
	div.view_btn button:nth-child(1) {
		background-color: gainsboro;
	}
	
	div.view_btn button:nth-child(2) {
		background-color: gainsboro;
	}
	
	div.view_btn button:nth-child(3) {
		background-color: gainsboro;
	}
	
	div.view_btn button:hover {
		box-shadow: 2px 2px 2px 2px rgba(0, 0, 0, 0.3);
	}
</style>
<script>
		document.addEventListener("DOMContentLoaded", function(ev) {
			document.querySelector("div.view_btn").addEventListener("click", function(ev) {
				
				let className = ev.target.className
				
				if(className == "btn_home") {
				
				} else if(className == "btn_update") {
				
					document.location.href = "${rootPath}/todo/update?td_seq=" + ${TD.td_seq};
				
				} else if(className == "btn_delete") {
				
					if(confirm("해야할 일을 삭제합니다!!")) {
						document.location.replace("${rootPath}/todo/delete?td_seq=" + ${TD.td_seq})
					}
				
				}
			})
		})
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/nav.jsp"%>
	<table>
		<tr>
			<th>작성일자</th>
			<td>${TD.td_date}</td>
			<th>장소</th>
			<td>${TD.td_place}</td>
		</tr>
		<tr>
			<th>해야할 일</th>
			<td colspan="3">${TD.td_todo}</td>
		</tr>
	</table>

	<div class="view_btn">
		<button class="btn_home">Home</button>
		<button class="btn_update">수정</button>
		<button class="btn_delete">삭제</button>
	</div>
</body>
</html>