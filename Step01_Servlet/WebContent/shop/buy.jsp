<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8");
    	String[] goodsinfo = new String[2];
    	goodsinfo[0] = request.getParameter("num");
    	goodsinfo[1] = request.getParameter("type");
    	System.out.println(goodsinfo[0] + "  " + goodsinfo[1]);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buy.jsp</title>
</head>
<body>

<strong><%=goodsinfo[0] %></strong>번 상품의 
<strong><%=goodsinfo[1] %></strong>타입을 구매 하셨습니다.

</body>
</html>