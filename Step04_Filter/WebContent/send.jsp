<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //한글깨짐 방지
    request.setCharacterEncoding("utf-8");
    	//폼전송되는 파라미터 읽어오기
    	String msg = request.getParameter("msg");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>send.jsp</title>
</head>
<body>

<p><%=msg %></p>
</body>
</html>