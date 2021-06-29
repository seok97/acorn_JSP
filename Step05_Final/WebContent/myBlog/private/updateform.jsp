<%@page import="my.blog.dao.MyDao"%>
<%@page import="my.blog.dto.MyDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   int num=Integer.parseInt(request.getParameter("num"));
  MyDto dto = MyDao.getInstance().select(num);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/updateform.jsp</title>
</head>
<body>
<div class="container">
   <h1>글 수정 폼 입니다.</h1>
   <form action="update.jsp" method="post">
      <input type="hidden" name="b_idx" value="<%=num %>" />
      <div>
         <label for="writer">작성자</label>
         <input type="text" id="writer" value="<%=dto.getB_writer() %>" disabled/>
      </div>
      <div>
         <label for="title">제목</label>
         <input type="text" name="b_title" id="title" value="<%=dto.getB_title()%>"/>
      </div>
      <div>
         <label for="content">내용</label>
         <textarea name="b_content" id="content"><%=dto.getB_content() %></textarea>
      </div>
      <button type="submit">수정확인</button>
      <button type="reset">취소</button>
   </form>
</div>
</body>
</html>




