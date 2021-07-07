<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/drag_test.jsp</title>
<style>
	.drag-area{
		width: 500px;
		height:300px;
		border: 2px dashed gray;
		border-radius: 20px;
	}
</style>
</head>
<body>
<h1>drag 테스트</h1>
<div class="drag-area">
</div>
<input type="file" id="myFile" />
<script>
	document.querySelector(".drag-area").addEventListener("dragenter",function(e){
		console.log("dragenter")
		// drop 이벤트 까지 진행될수 있도록 기본 동작을 막는다.
		e.preventDefault();
	})
	
	document.querySelector(".drag-area").addEventListener("dragover",function(e){
		console.log("drageover")
		e.preventDefault();
	})
	document.querySelector(".drag-area").addEventListener("drop",function(e){
		console.log("drop")
		e.preventDefault();
		
		// drop 된 파일의 정보
		const data = e.dataTransfer;
		const files = data.files;
		console.log(files)
		document.querySelector("#myFile").files = files;
	})
	
	
</script>
</body>
</html>