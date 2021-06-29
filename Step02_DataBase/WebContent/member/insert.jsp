<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("utf-8");
    	MemberDao dao = MemberDao.getInstance();
    	MemberDto dto = new MemberDto();
    	dto.setAddr( request.getParameter("addr"));
    	dto.setName(request.getParameter("name"));
    	boolean isOk = dao.insertMember(dto);
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert.jsp</title>
</head>
<body>
<div class="container">

</div>
	<% if(isOk){ %>
	<p>
		<strong><%=dto.getName() %></strong>의 정보를 추가했습니다.
		<a href="list.jsp">확인</a>
	</p>
	<% } else{ %>
	<p>
	정보추가실패!
	<a href="insertform.jsp">다시작성</a>
	</p>
	<%} %>
</body>
</html>