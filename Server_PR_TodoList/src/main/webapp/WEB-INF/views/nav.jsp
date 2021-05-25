<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
nav #main {
	padding: 5px;
}

nav#main ul {
	margin: 0px;
	background-color: gainsboro;
	width:90%;
	margin:0 auto;
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
			} else if(text == "날짜로 조회하기") {
				url += "/todo/search"
			}
			document.location.href = url;
			
		});
	})
	
	function startTime() {
        var today = new Date();
        var h = today.getHours();
        var m = today.getMinutes();
        var s = today.getSeconds();
        m = checkTime(m);
        s = checkTime(s);
        document.getElementById("clock").innerHTML = h + ":" + m + ":" + s;
        var t = setTimeout(startTime, 500);
      }
      function checkTime(i) {
        if (i < 10) {
          i = "0" + i;
        } // 숫자가 10보다 작을 경우 앞에 0을 붙여줌
        return i;
      }
	
</script>
<body onload="startTime()">
	<h1>TO DO LIST</h1>
	<nav id="main">
		<ul>
			<li><a href="${rootPath}" />Home</a></li>
			<li><a href="${rootPath}/todo/insert">리스트 추가하기</a></li>
			<li><a href="${rootPath}/todo/search">날짜로 조회하기</a></li>
			<li style="float:right;"><h2 id="clock"></h2></li>
		</ul>
	</nav>
</body>	