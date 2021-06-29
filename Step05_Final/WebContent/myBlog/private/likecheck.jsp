<%@page import="my.liketable.dto.MyLikeDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%
    	String userid = (String)session.getAttribute("id");
    	String b_idx = request.getParameter("bidx");
    	
    	MyLikeDto dto = new MyLikeDto();
    %>
    
    {"isSuccess": false}
