<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/private/play.jsp</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");

/* //만일 로그인 되어있지 않다면
if(id==null){
	// 로그인 할 수 있는 페이지로 리다이렉트
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/users/loginform.jsp");
} */
%>
<h1>로그인된 회원의 전용 공간</h1>
<p>
	<strong><%=id %>님 로그인 중...</strong>
</p>
</body>
</html>