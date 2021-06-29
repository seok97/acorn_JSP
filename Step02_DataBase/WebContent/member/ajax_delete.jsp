<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	boolean isSuccess = MemberDao.getInstance().deleteMember(num);
	%>
{"isSuccess":<%=isSuccess %>}
	