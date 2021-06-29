<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// 세션불러오기
    	String id = (String)session.getAttribute("id");
    
    	// 폼데이터
    	String title = request.getParameter("title");
    	String content = request.getParameter("content");
    	CafeDto dto = new CafeDto();
    	dto.setContent(content);
    	dto.setTitle(title);
    	dto.setWriter(id);
    	// db 저장
    	boolean isSuccess = CafeDao.getInstance().insert(dto);
    	
    	// 응답
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/insert.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
	<script>
		alert("새글 추가 완료");
		location.href= "${pageContext.request.contextPath}/cafe/list.jsp";
	</script>
	<%}else{ %>
		alert("추가 실패");
		location.href = "insertform.jsp";
	<%} %>
</body>
</html>