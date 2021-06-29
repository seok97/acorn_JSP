<%@page import="java.net.URLEncoder"%>
<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String id = request.getParameter("id");
    	String pwd = request.getParameter("pwd");
    	String num = request.getParameter("num");

    	// 로그인후 이동해야 되는 목적지
    	String url = request.getParameter("url");
    	// 인코딩된 목적지 ( 로그인 실패시에 필요 )
    	String encodeUrl = URLEncoder.encode(url);

    	
    	UsersDto dto = new UsersDto();
    	dto.setId(id);
    	dto.setPwd(pwd);
    	
    	boolean isValid = UsersDao.getInstance().isValid(dto);
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
</head>
<body>
<div class="container">
   <h1>알림</h1>
   <%if(isValid){ 
      //로그인 했다는 의미에서 session 영역에 "id" 라는 키값으로 로그인된 아이디를 담는다.
      session.setAttribute("id", id); 
      // 아무런 동작을 하지 않았을때(아무런 요청을 하지 않았을때) 초 단위로 세션 유지시간을 설정할 수 있다.(초 단위)
      session.setMaxInactiveInterval(60*20);
      %>
      <p>
         <strong><%=id %></strong>님 로그인 되었습니다.
         <%if(url!=null){ %>
         	<a href="<%=url%>">확인</a>
         <%}else{ %>
         	<a href="../index.jsp">확인</a>
         <%} %>
         
      </p>
   <%}else{ %>
      <p>
         아이디 혹은 비밀 번호가 틀려요
         <a href="loginform.jsp?url=<%=encodeUrl%>">다시 시도</a>
      </p>
   <%} %>
</div>   

</body>
</html>