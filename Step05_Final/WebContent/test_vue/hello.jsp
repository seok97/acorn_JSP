<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_vue/hello.jsp</title>
</head>
<body>
<div id="one">
	<input type="text" id="inputMsg" placeholder="메세지 입력..." />
	<p id="result"></p>
</div>

<div id="two">
	<input v-model="msg" type="text" placeholder="메세지 입력..." />
	<p>{{msg}}</p>
	<h1>친구목록</h1>
	<ul>
		<li v-for="tmp in friends">{{tmp}}</li>
	</ul>
</div>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script>
	document.querySelector("#inputMsg").addEventListener("input",function(){
		const msg = this.value;
		document.querySelector("#result").innerText = msg;
	})
	
	let app = new Vue({
		el: "#two",
		data:{
			msg:"",
			friends:["석우현","청포도","아이유"]
		}
	});
</script>
</body>
</html>