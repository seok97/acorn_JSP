<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%
    	String inputId = request.getParameter("inputId");
    	boolean isExist = UsersDao.getInstance().isExist(inputId);
    %>
{"isExist" : <%= isExist%>}