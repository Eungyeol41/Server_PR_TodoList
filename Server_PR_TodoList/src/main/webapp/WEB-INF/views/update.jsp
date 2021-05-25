<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List에 내용 추가하기</title>
<link href="${rootPath}/static/css/home.css?ver2021-05-25" rel="stylesheet" />
<style>
	form.write {
		width: 80%;
		margin: 10px auto;
	}
	form.write fieldset {
		width: 80%;
		margin: 0 auto;
		border: 1px solid darkgray;
		border-radius: 10px;
		padding: 5px;
	}
	form.write label, form.write input, form.write textarea {
		display: inline-block;
		padding: 5px;
		margin: 5px;
	}
	
	form.write label {
		width: 150px;
		text-align: right;
	}
	
	form.write input, form.write textarea {
		width: 300px;
		border: 1px solid gray;
		border-radius: 5px;
	}
	
	form.write button {
		outline: 0;
		border: 0;
		width: 100px;
		color: white;
		padding: 5px;
	}
	
	form.write button:nth-child(2){
		background-color: #dbbef3;
	}
	
	form.write button:nth-child(3){
		background-color: #dbbef3;
	}
	
	form.write button:nth-child(4){
		background-color: #dbbef3;
	}
	
	form.write button:hover{
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
			alert("< 수정하기 >" + "\n" + td_todo.value + "\n" + td_place.value)
			doc.querySelector("form.write").submit();
		})
	})
</script>

</head>
<body>
	<%@ include file="/WEB-INF/views/nav.jsp" %>
	<form class="write" method="POST">
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
				<textarea name="td_todo" rows ="3"></textarea>
			</div>
			
			<div>
				<label>장소</label>
				<input type="text" name="td_place"></input>
			</div>
			
			<div>
				<label></label>
				<button class="save" type="button">수정</button>
				<button type="button">다시 작성</button>
				<button class="home">Home</button>
			</div>
		</fieldset>
	</form>	
</body>
</html>