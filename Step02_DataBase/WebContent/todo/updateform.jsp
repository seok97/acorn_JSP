<%@page import="test.todo.dao.TodoDao"%> <%@page
import="test.todo.dto.TodoDto"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>/todo/updateform.jsp</title>
  </head>
  <body>
    <div class="container">
      <h1>할일 수정 폼 입니다.</h1>
      <% //GET 방식 파라미터로 전달되는 수정할 할일의 번호를 읽어온다.
      int num=Integer.parseInt(request.getParameter("num")); 
      //TodoDao 객체를 이용해서 할일 정보를 얻어온다. 
	TodoDto dto=TodoDao.getInstance().getData(num); %>
      <form action="<%=request.getContextPath() %>/todo/update.jsp" method="post">
        <input type="hidden" name="num" value="<%=dto.getNum() %>" />
        <div>
          <label for="num">번호</label>
          <input type="text" id="num" value="<%=dto.getNum() %>" disabled />
        </div>
        <div>
          <label for="content">할일</label>
          <input
            type="text"
            name="content"
            id="content"
            value="<%=dto.getContent() %>"
          />
        </div>
        <button type="submit">수정확인</button>
        <button type="reset">취소</button>
      </form>
    </div>
  </body>
</html>
