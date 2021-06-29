<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
new new Promise(function(a) {
	console.log("실행")
	// 함수의 첫번째 인자로 전달된 함수를 호출해야 then 이 실행 된다.
	a();
}).then(function(){
	console.log("then 호출");
})
</script>
</body>
</html>