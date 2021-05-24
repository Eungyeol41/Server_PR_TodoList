<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List에 내용 추가하기</title>
<style>
	form.i {
		width: 80%;
		margin: 10px auto;
	}
	form.i fieldset {
		width: 80%;
		margin: 0 auto;
		border: 1px solid green;
		border-radius: 10px;
		padding: 5px;
	}
	form.i label, form.i input, form.i textarea {
		display: inline-block;
		padding: 5px;
		margin: 5px;
	}
	
	form.i label {
		width: 150px;
		text-align: right;
	}
	
	form.i input, form.i textarea {
		width: 300px;
		border: 1px solid gray;
		border-radius: 5px;
	}
	
	form.i button {
		outline: 0;
		border: 0;
		width: 100px;
		color: white;
		padding: 5px;
	}
	
	form.i button:nth-child(1){
		background-color: orange;
	}
	
	form.i button:nth-child(2){
		background-color: orange;
	}
	
	form.i button:nth-child(3){
		background-color: orange;
	}
	
	form.i button:hover{
		box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.3);
	}
	
</style>

<script>
	document.addEventListener("DOMContentLoaded", function() {
		document.querySelector("button.save").addEventListener("click", function(ev) {
			
			let doc = document;
			let td_todo = doc.querySelector("textarea");
			let td_place = doc.querySelector("input[name='td_place']");
			if(td_todo.value == "") {
				alert("해야할 일은 반드시 입력해야합니다.");
				td_todo.focus();
				return false;
			}
			alert("< 추가하기 >" + "\n" + td_todo.value + "\n" + td_place.value)
			doc.querySelector("form.i").submit();
		})
	})
</script>

</head>
<body>
	<%@ include file="/WEB-INF/views/nav.jsp" %>
	<form class="i" method="POST">
		<fieldset>
			<legend>할 일 작성하기</legend>
			<div>
				<label>작성일자</label> 
				<input type="date" name="td_date" value="${TD.td_date}">
			</div>
			
			<div>
				<label>작성시각</label> 
				<input type="time" name="td_time" value="${TD.td_time}">
			</div>
			
			<div>
				<label>할 일</label>
				<textarea name="td_todo" rows ="3">${TD.td_todo}</textarea>
			</div>
			
			<div>
				<label>장소</label>
				<input type="text" name="td_place">${TD.td_place}</input>
			</div>
			
			<div>
				<button class="save" type="button">추가</button>
				<button type="button">다시 작성</button>
				<button class="home">Home</button>
			</div>
		</fieldset>
	</form>	
</body>
</html>