<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String userid = (String)session.getAttribute("id");
    	String path = request.getServletContext().getRealPath("/upload");
    	System.out.println("저장 경로 : "+path);
    	
    	File file = new File(path);
    	if(!file.exists()) file.mkdir();
    	
    	MultipartRequest mr = new MultipartRequest(request, path,1024*1024*100, "utf-8", new DefaultFileRenamePolicy());
    	
    	String title = mr.getParameter("title");
    	
    	File myFile = mr.getFile("myFile");
    	
    	Long fileSize = myFile.length();
    	
    	String orgFileName = mr.getOriginalFileName("myFile");
    	String saveFileName = mr.getFilesystemName("myFile");
    	
    	//  insert file
    	FileDto dto = new FileDto();
    	dto.setWriter(userid);
    	dto.setTitle(title);
    	dto.setOrgFileName(orgFileName);
    	dto.setSaveFileName(saveFileName);
    	dto.setFileSize(fileSize);
    	
    	boolean isSuccess = FileDao.getInstance().insert(dto);
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload.jsp</title>
</head>
<body>
<%if(isSuccess){ %>
<script>
	location.href="../list.jsp";
</script>
<p>success</p>
	<p> fileSize : <strong><%= fileSize %></strong></p>
	<p> orgFileName : <strong><%=orgFileName %></strong></p>
	<p> saveFileName : <strong><%= saveFileName %></strong></p>
	<p> 서버의 파일시스템에서 저장된 실제 경로 : <strong><%=path %></strong></p>
<%}else{ %>
	<p>upload fail</p>
<%} %>
</body>
</html>