<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //1. 폼전송되는 아이디와 비밀번호를 읽어온다.
   String id=request.getParameter("id");
   String pwd=request.getParameter("pwd");
   //2. DB 에 저장된 아이디 비밀번호와 일치하는지 확인해서
   boolean isValid=false;
   if(id.equals("gura") && pwd.equals("1234")){//가상으로 비밀번호를 확인한다.
      //아이디 비밀번호가 모두 일치하면 유효한 정보라고 가정한다.  
      isValid=true;
   }
   //3. 일치하면 로그인 처리후 응답, 틀리면 아이디 혹은 비밀번호가 틀려요! 라고 응답
   
   // isSave 라는 파라미터명으로 넘어오는 값이 있는지 확인해서
   String isSave=request.getParameter("isSave");
   if(isSave != null){//만일 넘어오는 값이 있다면
      //쿠키에 id 와 pwd 를 특정 키값으로 담아서 쿠키도 응답 되도록 한다.
      Cookie idCook=new Cookie("savedId", id);
      idCook.setMaxAge(60*60*24); //쿠키 유지시간 (초단위)
      response.addCookie(idCook);
      
      Cookie pwdCook=new Cookie("savedPwd", pwd);
      pwdCook.setMaxAge(60*60*24);
      response.addCookie(pwdCook);
   }else{
	   		//만일 넘어오는 값이 있다면
	      //쿠키에 id 와 pwd 를 특정 키값으로 담아서 쿠키도 응답 되도록 한다.
	      Cookie idCook=new Cookie("savedId", id);
	      idCook.setMaxAge(0); //쿠키 유지시간 (초단위)
	      response.addCookie(idCook);
	      
	      Cookie pwdCook=new Cookie("savedPwd", pwd);
	      pwdCook.setMaxAge(0);
	      response.addCookie(pwdCook);
	   }
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container pt-5">
   <%if(isValid){ %>
      <div class="alert alert-success">
         <strong><%=id %></strong>님 로그인 되었습니다.
         <a href="<%=request.getContextPath()%>/" class="alert-link">확인</a>
      </div>
   <%}else{ %>
      <div class="alert alert-danger">
         아이디 혹은 비밀번호가 틀려요!
         <a href="<%=request.getContextPath()%>/users/loginform.jsp" class="alert-link">다시 시도</a>
      </div>
   <%} %>
</div>
</body>
</html>





