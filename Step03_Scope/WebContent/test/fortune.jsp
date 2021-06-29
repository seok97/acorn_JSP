<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String str = (String)request.getAttribute("fortuneToday");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/fortune.jsp</title>
</head>
<body>
	오늘의 운세 : <strong><%=str %></strong>
</body>
</html>