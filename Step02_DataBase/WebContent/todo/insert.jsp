<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String cPath = request.getContextPath();

   //1. 폼전송되는 할일을 읽어와서
   request.setCharacterEncoding("utf-8");
   String content=request.getParameter("content");
   TodoDto dto=new TodoDto();
   dto.setContent(content);
   //2. DB 에 저장하고
   boolean isSuccess=TodoDao.getInstance().insert(dto);
   //3. 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insert.jsp</title>
</head>
<body>
<div class="container">
   <%if(isSuccess){ %>
      <p>
         할일을 추가 했습니다. <a href="list.jsp">확인</a>
      </p>
      <% response.sendRedirect(cPath+"/todo/list.jsp"); %>
   <%}else{ %>
      <p>
         할일 추가 실패! <a href="insertform.jsp">다시작성</a>
      </p>
   <%} %>
</div>
</body>
</html>


