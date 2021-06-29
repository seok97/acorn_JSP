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
   <h1>인덱스 페이지 입니다.</h1>
   <form action="send.jsp" method="post">
      <input type="text" name="msg" placeholder="메세지 입력..."/>
      <button type="submit">전송</button>
   </form>
   <%
   	String id = (String)session.getAttribute("id");
   if(id == null){%>
	<form action="users/login.jsp" method="post">
		<input type="hidden" name="url" value="<%= request.getContextPath()%>/"/>
		<input type="text" name="id" />
		<button type="submit">로그인</button>
	</form>
	<%}else{ %>
		<p>
			<strong><%=id %></strong> 로그인 중...
			<a href="users/logout.jsp">로그아웃</a>
		</p>
	<%} %>
	<ul>
		<li><a href="private/play.jsp">놀러가기</a></li>
		<li><a href="private/study.jsp">공부하기</a></li>
		<li><a href="private/buy.jsp?num=1&amount=5">1번상품 5개 구매</a></li>
		<li><a href="private/buy.jsp?num=2&amount=3">1번상품 3개 구매</a></li>
	</ul>
</div>
</body>
</html>