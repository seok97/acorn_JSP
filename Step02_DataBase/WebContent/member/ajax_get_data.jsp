<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.json.JSONObject"%>
<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 수정할 회원의 번호를 가져오기
int num = Integer.parseInt(request.getParameter("num"));
// 수정할 회원의 정보를 가져오기
MemberDto dto = MemberDao.getInstance().getMember(num);

// dto 객체를 jsonobject로 생성, toString으로 json String으로 변환하여 출력
JSONObject jobj = new JSONObject(dto);
String json = jobj.toString();
%>
<%=json%>