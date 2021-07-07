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
<img id="myImage" src="" alt="" />
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
		// 한개만 드롭했다는 가정하에 drop된 파일이 이미지 파일인지 여부 알아내기
		const reg = /image.*/;
		const file = files[0];
		//drop 된 파일의 mime type 확인
		console.log(file.type);
		
		if(file.type.match(reg)){
			console.log("이미지 파일")
			readImageFile(file)
		}else{
			console.log("not image")
		}
	})
	
	const readImageFile = (file) =>{
		const reader = new FileReader();
		// 파일을 url 형식으로 읽기
		reader.readAsDataURL(file)
		
		// 파일을 다 읽었을때 실행할 함수 등록
		reader.onload = (e)=>{
			// 읽은 이미지 데이터 
			console.log(e.target.result)
			document.querySelector("#myImage").setAttribute("src",e.target.result)
		}
	}
	
</script>
</body>
</html>