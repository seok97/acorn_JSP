<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	MemberDto dto = (MemberDto)request.getAttribute("dto");
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/detail.jsp</title>
</head>
<body>
<h2>회원 정보</h2>
<table>

	번호 : <%=dto.getNum() %>
	이릅 : <%=dto.getName() %>
	주소 : <%=dto.getAddr() %>
	

</body>
</html>