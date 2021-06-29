<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //한글 깨지지 않도록 요청 인코딩 설정 
   request.setCharacterEncoding("utf-8");
   //폼 전송되는 내용을 읽어와서
   int num=Integer.parseInt(request.getParameter("num"));
   String content=request.getParameter("content");
   //TodoDto 에 담아서 
   TodoDto dto=new TodoDto();
   dto.setNum(num);
   dto.setContent(content);
   //DB 에 수정 반영하기
   boolean isSuccess=TodoDao.getInstance().update(dto);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/update.jsp</title>
</head>
<body>
<div class="container">
   <%if(isSuccess){ %>
      <p>
         할일을 수정 했습니다. <a href="list.jsp">확인</a>
      </p>
   <%}else{ %>
      <p>
         할일 수정 실패 <a href="updateform.jsp?num=<%=num %>">다시 시도</a>
      </p>
   <%} %>
</div>
</body>
</html>



