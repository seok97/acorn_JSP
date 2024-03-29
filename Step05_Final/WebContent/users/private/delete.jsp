<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //1. session 영역에서 로그인된 아이디를 읽어온다.
   String id = (String)session.getAttribute("id");
   //2. 해당 아이디를 DB 에서 삭제 한다.
   UsersDao.getInstance().delete(id);
   //3. 로그 아웃 처리를 한다.
   session.removeAttribute("id");
   //4. 응답한다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/delete.jsp</title>
</head>
<body>
<div class="container">
   <h1>알림</h1>
   <p>
      <strong><%=id %></strong> 님 탈퇴 처리 되었습니다.
      <a href="<%=request.getContextPath()%>/index.jsp">인덱스로 가기</a>
   </p>
</div>
</body>
</html>



