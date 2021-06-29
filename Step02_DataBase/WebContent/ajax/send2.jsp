<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("utf-8");
    String msg=request.getParameter("msg");
    System.out.println(msg);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/ajax/send2.jsp</title>
</head>
<body>
	<p>메세지 완료 </p>
</body>
</html>