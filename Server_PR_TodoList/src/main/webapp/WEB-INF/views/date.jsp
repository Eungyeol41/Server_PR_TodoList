<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜로 검색하기</title>
<link href="${rootPath}/static/css/home.css?ver2021-05-25" rel="stylesheet" />
<style>

	form {
		width:80%;
		margin:0 auto;
	}
	
	input {
		width: 40%;
		border : 1px solid green;
		border-radius : 5px ;
		margin:8px;
		padding:5px;
	}
</style>
<script>
	
	document.addEventListener("DOMContentLoaded", function() {
		document.querySelector("button.btn_select").addEventListener("click", function(ev) {
			let doc = document;
			let t_date = doc.querySelector("input[name='t_date']");
			if(t_date.value == "") {
				alert("날짜는 반드시 입력해야합니다");
				t_date.focus();
				return false;
			}
			alert("날짜 검색하기" + "\n" + t_date.value);
			doc.querySelector("form.select").submit();
		})
	})
	
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/nav.jsp" %>
	<form class="select" method="POST">
		<label>날짜 검색하기</label>
		<input type="date" name="t_date">
		<button type="button" class="btn_select">조회</button>
	</form>
	<div>
		<c:choose>
			<c:when test="${not empty TDLIST}">
				<table>
					<tr>
						<th>No.</th>
						<th>할 일</th>
						<th>작성일자</th>
						<th>장소</th>
					</tr>
					<c:forEach items="${TDLIST}" var="TD">
					<tr>
						<td>${TD.td_seq}</td>
						<td>${TD.td_todo}</td>
						<td>${TD.td_date}</td>
						<td>${TD.td_place}</td>
					</tr>
					</c:forEach>
				</table>
			</c:when>
		</c:choose>
	</div>

</body>
</html>