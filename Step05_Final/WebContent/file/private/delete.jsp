<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int num = Integer.parseInt(request.getParameter("num"));
    String id = (String)session.getAttribute("id"); 
    FileDto dto = FileDao.getInstance().getData(num);
    if(!id.equals(dto.getWriter())){
    	//금지된 요청이라고 응답하기.
    	response.sendError(HttpServletResponse.SC_FORBIDDEN, "다른사람의 파일은 지울수 없습니다.");
    	//메소드 종료
    	return;
    }
    // 삭제할 파일이 저장되어 있는 서버의 경로
    String path = request.getServletContext().getRealPath("/upload")+ File.separator + dto.getSaveFileName();
    // 파일 시스템에서 실제 파일 삭제
    File f = new File(path);
    f.delete();
    //db에서도 파일의 경로를 삭제
    FileDao.getInstance().delete(num);
    
    // 응답
    String cPath = request.getContextPath();
    response.sendRedirect(cPath+"/file/list.jsp");
    
    %>
