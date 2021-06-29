<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<String> arr = (ArrayList)request.getAttribute("names");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>친구 목록</h1>
<% for(String list: arr){%>
	<%= list%> <br>
<% } %>

</body>
</html>