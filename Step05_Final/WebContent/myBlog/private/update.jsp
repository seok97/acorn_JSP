<%@page import="my.blog.dao.MyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="my.blog.dto.MyDto"></jsp:useBean>   
<jsp:setProperty property="*" name="dto"/> 
<%
   /*
   <jsp:useBean id="dto" class="test.cafe.dto.CafeDto"></jsp:useBean>   
   <jsp:setProperty property="" name="dto"/> 
   
   위의 2줄은 아래의 코드를 대체 할수 있다.
   
   int num=Integer.parseInt(request.getParameter("num"));
   String title=request.getParameter("title");
   String content=request.getParameter("content");
   
   CafeDto dto=new CafeDto();
   dto.setNum(num);
   dto.setTitle(title);
   dto.setContent(content);
   
   */
   
   //3. DB 에 수정반영하고 
   boolean isSuccess= MyDao.getInstance().update(dto);
   //4. 응답한다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/update.jsp</title>
</head>
<body>
   <%if(isSuccess){ %>
      <script>
         alert("수정했습니다.");
         location.href="../detail.jsp?num=<%=dto.getB_idx()%>";
      </script>
   <%}else{ %>
      <h1>알림</h1>
      <p>
         글 수정 실패!
         <a href="updateform.jsp?num=<%=dto.getB_idx()%>">다시 시도</a>
      </p>
   <%} %>
</body>
</html>