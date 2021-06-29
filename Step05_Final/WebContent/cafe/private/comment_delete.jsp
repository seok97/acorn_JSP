<%@page import="test.cafe.dao.CafeCommentDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%
    	// 삭제할 댓글의 번호
    	int num = Integer.parseInt(request.getParameter("num"));
    	boolean isSuccess = CafeCommentDao.getInstance().delete(num);
    %>
{"isSuccess":<%=isSuccess%>}