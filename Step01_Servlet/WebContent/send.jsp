<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("utf-8");
    // msg 라는 파라미터 명으로 전송된 문자열 추출
    String str = request.getParameter("msg");
    // 콘솔에 출력
    System.out.println("this is send.jsp");
    System.out.println(str);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/send.jsp</title>
</head>
<body>
	this is send.jsp
	
	<%=str %> 
</body>
</html>