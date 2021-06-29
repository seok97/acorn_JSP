<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%
    	request.setCharacterEncoding("utf-8");
    	
    String name = request.getParameter("name");
    String addr = request.getParameter("addr");
    System.out.println(name + addr);
    MemberDto dto = new MemberDto();
    dto.setAddr(addr);
    dto.setName(name);
    
    boolean isSuccess = MemberDao.getInstance().insertMember(dto);
    %>
    {"isSuccess":<%=isSuccess %>}
