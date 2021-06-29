<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	int num = Integer.parseInt(request.getParameter("num"));
    	MemberDao dao = MemberDao.getInstance();
    	MemberDto dto = dao.getMember(num);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/updateform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<div class="container">
	<h1>회원 수정 폼</h1>
	<form action="update.jsp" method="post">
	<!-- 수정할때 번호도 필요하기때문에 hidden 으로 넘겨준다 -->
	<input type="hidden" name="num" value="<%=dto.getNum() %>" />
	<div>
		<label for="name">번호</label>
		<%-- input요소에 disabled 속성을 추가하면 수정도불가하고 전송도 되지 않는다. --%>
		<input type="text" name="num" id="num" value="<%=dto.getNum() %>" disabled />
	</div>
	<div>
		<label for="name">이름</label>
		<input type="text" name="name" id="name" value="<%=dto.getName() %>" />
	</div>
	<div>
         <label for="addr">주소</label>
         <input type="text" name="addr" id="addr" value="<%=dto.getAddr() %>" />
      </div>
      <button type="submit">수정</button>
      <button type="reset">취소</button>
	</form>
</div>
</body>
</html>