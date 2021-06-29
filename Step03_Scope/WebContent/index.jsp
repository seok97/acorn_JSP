<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
<div class="container">
	<h1>인덱스 페이지</h1>
	<ul>
		<li><a href="fortune">오늘의 운세보기</a></li>
		<li><a href="friends">친구 목록보기</a></li>
		<li><a href="detail">회원정보</a></li>
		<li><a href="test/check.jsp">출석체크하기</a></li>
	</ul>
	<%
		//세션 영역에 id 라는 키값으로 저장된 String type 이 있는지 읽어와 본다.
		String id = (String)session.getAttribute("id");
		if(id==null){%>	
	<form action="users/login" method="post">
		<input type="text" name="id" placeholder="아이디..." />
		<button type="submit">로그인</button>
	</form>
	<br>
	<form action="users/login.jsp" method="post">
		<input type="text" name="id" placeholder="아이디..." />
		<button type="submit">로그인2</button>
	</form>
	
	<%}else{ %>
		<p> 
			<strong><%=id %></strong> 님 로그인 중...
			<a href="users/logout"> 로그아웃 </a>
		</p>
		<p> 
			<strong><%=id %></strong> 님 로그인 중...
			<a href="users/logout.jsp"> 로그아웃2 </a>
		</p>
		
	<%} %>
</div>
</body>
</html>