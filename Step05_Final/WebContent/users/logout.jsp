<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	session.removeAttribute("id");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/logout.jsp</title>
</head>
<body>
<script>
	alert("로그 아웃 되었습니다.");
	// js 로 index.jsp 페이지로 redirect 시키기
	location.href = "<%= request.getContextPath()%>/index.jsp";
</script>
</body>
</html>