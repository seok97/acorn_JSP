<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
</head>
<body>
<%
   // GET 방식 파라미터 url 이라는 이름으로 전달되는 값이 있는지 읽어와 본다.
   String url=request.getParameter("url");
   //만일 넘어오는 값이 없다면
   if(url==null){
      //로그인 후에 index.jsp 페이지로 갈수 있도록 절대 경로를 구성한다.
      String cPath=request.getContextPath();
      url=cPath+"/index.jsp";
   }
%>
<h1>로그인이 필요 합니다.</h1>
<form action="login.jsp" method="post">
   <%-- 로그인 후에 이동할 목적지 정보를 url 이라는 파라미터 명으로 전송될수 있도록 한다. --%>
   <input type="hidden" name="url" value="<%=url %>"/>
   <input type="text" name="id" placeholder="아이디 입력..."/>
   <button type="submit">로그인</button>
</form>
</body>
</html>



