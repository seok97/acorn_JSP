<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/scroll.jsp</title>
<style>
body{
margin: 0;}
	.spacer{
		height: 500px;
		background-color: gray;
		border: 1px solid red;
	}
</style>
</head>

<body>
	<div class="spacer"></div>
	<div class="spacer"></div>
	<div class="spacer"></div>
	
<script>
/* 
	window.scrollY => 위쪽으로 스크롤된 높이 
	window.innerHeight => 웹브라우저의 창의 높이
	document.body.offsetHeight => bocy 의 높이 ( 문서객체가 차지하는 높이 )
*/
 window.addEventListener("scroll",()=>{
	 const isBottom = (window.scrollY+window.innerHeight) >= document.body.offsetHeight;
	 
	 if(isBottom){
		
		 console.log("this is scroll end!!!!");
	 }
 })
 
</script>
</body>
</html>