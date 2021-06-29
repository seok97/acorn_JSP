<%@page import="my.blog.dao.MyDao"%>
<%@page import="my.blog.dto.MyDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String id = (String)session.getAttribute("id");
    	
    	String title = request.getParameter("title");
    	String content = request.getParameter("content");
    	// 이미지 나중에 작업
    	String sumnail = null;
    	if(sumnail == null) System.out.println("sumnail is null");
    	
    	MyDto dto = new MyDto();
    	dto.setB_title(title);
    	dto.setB_content(content);
    	dto.setB_sumnail(sumnail);
    	dto.setB_writer(id);
    	
    	boolean isSuccess = MyDao.getInstance().insert(dto);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/myblog/private/insert.jsp</title>
</head>
<body>
<%if(isSuccess){ %>
	<script>
		location.href = "${pageContext.request.contextPath}/myBlog/mylist.jsp";
	</script>
<%}else{ %>
	<script>
		alert("추가 실패");
		location.href = "insertform.jsp";
	</script>
<%} %>
</body>
</html>