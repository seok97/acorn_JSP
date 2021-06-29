<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/event_test.jsp</title>
</head>
<body>
<button id="activeBtn">이벤트 활성화 하기</button>
<button id="mybtn">눌러</button>
<script>
document.querySelector("#activeBtn").addEventListener("click",function(){
	document.querySelector("#mybtn").addEventListener("click",()=>{
		alert("버튼을 눌렀군요?");
	},{once:true})
})
</script>
</body>
</html>