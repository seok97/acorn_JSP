<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int num = Integer.parseInt(request.getParameter("num"));
    	int amount = Integer.parseInt(request.getParameter("amount"));
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/private/buy.jsp</title>
</head>
<body>
   <h1>상품 구매 결과 페이지</h1>
   <strong><%=num %></strong> 번 상품 <strong><%=amount %></strong>개 주문
</body>
</html>