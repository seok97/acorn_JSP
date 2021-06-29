<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("utf-8");
    	String str = request.getParameter("msg");
    	System.out.println(str);
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>send2.jsp</title>
</head>
<body>
<h1><%= str %></h1>
</body>
</html>