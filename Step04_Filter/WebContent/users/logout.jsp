<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String id = (String)session.getAttribute("id");
    	session.removeAttribute("id");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <p> 
      <strong><%=id %></strong> 님 로그아웃 되었습니다. 
      <a href="<%=request.getContextPath() %>/index.jsp">확인</a>
   </p>
</body>
</html>