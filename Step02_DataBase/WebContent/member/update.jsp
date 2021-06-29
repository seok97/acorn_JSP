<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("utf-8");
  
    	int num = Integer.parseInt(request.getParameter("num"));
    	String name = request.getParameter("name");
    	String addr = request.getParameter("addr");
    	
      	MemberDto dto = new MemberDto();
      	dto.setName(name);
      	dto.setNum(num);
      	dto.setAddr(addr);
        
      	boolean isSuccess = MemberDao.getInstance().update(dto);
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/update.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
	<script>
		alert("<%=num%>번 회원의 정보를 수정했습니다.");
		location.href="list.jsp";
	</script>
	<%}else{ %>
	<script>
		alert("회원정보 수정 실패");
		location.href="list.jsp";
	</script>
	<%} %>
</body>
</html>