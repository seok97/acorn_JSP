<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%
    	request.setCharacterEncoding("utf-8");
    int num = Integer.parseInt(request.getParameter("num"));
    String name = request.getParameter("name");
    String addr = request.getParameter("addr");
    
    MemberDto dto = new MemberDto(num,name,addr);
    boolean isSuccess = MemberDao.getInstance().update(dto);
    %>
    {"isSuccess":<%=isSuccess %>}