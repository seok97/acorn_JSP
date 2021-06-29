<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //세션 영역에 id 라는 키값으로 저장된 문자열 읽어와보기 ( null 이 아니면 로그인 된 것이다 )
   String id=(String)request.getSession().getAttribute("id");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<jsp:include page="/include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/include/navbar.jsp"></jsp:include>
<div class="container">
   <%if(id != null){ %>
      <p>
         <a href="users/private/info.jsp"><%=id %></a> 님 로그인중...
         <a href="users/logout.jsp">로그아웃</a>
      </p>
   <%} %>
   <h1>인덱스 페이지 입니다.</h1>
   <ul>
      <li><a href="users/signup_form.jsp">회원 가입</a></li>
      <li><a href="users/loginform.jsp">로그인</a></li>
      <li><a href="cafe/list.jsp">카페글 목록 보기</a></li>
      <li><a href="file/list.jsp">자료실 목록보기</a></li>
      <li><a href="myBlog/mylist.jsp">좋아요게시판</a></li>
   </ul>
</div>


<%
	// 쿠키 읽어오기
	Cookie[] cookies = request.getCookies();
	// 팝업을 띄울지 여부
	// 팝업 쿠키가 존재하면 팝업을 띄우지 않는다.
	boolean isPopup = true;
	if(cookies != null){
		for(Cookie tmp: cookies){
			if(tmp.getName().equals("isPopup")){
				isPopup = false;
			}
		}
	}
%>
<script>
<%if(isPopup){%>
 	window.open("sale.jsp","창의 제목","width=800,height=500,top=100,left=100"); 
<%}%>
</script>
</body>
</html>