<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	nav #main {
		padding: 5px;
	}		
	nav#main ul {
		margin: 0px;
		background-color: gainsboro;
	}
	
	nav#main li {
		display: inline-block;
		list-style: none;
		margin: 0px;
		padding: 10px;
		color: white;
	}
	
	nav#main li:hover {
		background-color: gold;
		color: black;
		cursor: pointer;
	}
	
	nav#main a {
		display: inline-block;
		color: inherit;
		text-decoration: none;
	}
</style>
    
<script>
	document.addEventListener("DOMContentLoaded",function(){
	
		document.querySelector("nav#main").addEventListener("click",function(ev) {
			
			let text = ev.target.textContent;
			
			alert(text + "로 이동!")
			
			let url = "${rootPath}"
			
			if(text == "Home") {
				url += "/" 
			} else if(text == "리스트 추가하기") {
				url += "/todo/insert"
			}
			document.location.href = url;
			
		});
	})
</script>    

    
<h1>TO DO LIST</h1>
<h1 class="clock"></h1>
<nav id="main">
	<ul>
		<li><a href="${rootPath}"/>Home</a></li>
		<li><a href="${rootPath}/todo/insert">리스트 추가하기</a></li>
	</ul>
</nav>