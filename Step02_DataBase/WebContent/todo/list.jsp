<%@page import="java.util.List"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	List<TodoDto> todolist = TodoDao.getInstance().getList();
		
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/list.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
<jsp:param value="todo" name="thisPage"/>
</jsp:include>
<div class="container">
   <label>할일 목록 입니다.</label>
  	<a href="insertform.jsp"><button type="button" class="btn btn-secondary">add</button></a>
  	<br/>
   <table class="table table-sm table-striped">
      <thead class="table-dark">
         <tr>
            <th>번호</th>
            <th>할일</th>
            <th>등록일</th>
            <th>수정</th>
            <th>삭제</th>
         </tr>
      </thead>
      <tbody>
      <% for(TodoDto dto:todolist){ %>
      	<tr>
      		<td><%= dto.getNum() %></td>
      		<td><%= dto.getContent()%></td>
      		<td><%= dto.getRegdate()%></td>
      		<td>
      		<a href="">
      		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
  <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
</svg>
</a>
      		</td>
      		<td><a href="">
      		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
  <path d="M1.293 1.293a1 1 0 0 1 1.414 0L8 6.586l5.293-5.293a1 1 0 1 1 1.414 1.414L9.414 8l5.293 5.293a1 1 0 0 1-1.414 1.414L8 9.414l-5.293 5.293a1 1 0 0 1-1.414-1.414L6.586 8 1.293 2.707a1 1 0 0 1 0-1.414z"/>
</svg>
</a></td>
      	</tr>
      <%} %>
      </tbody>
   </table>
</div>
</body>
</html>