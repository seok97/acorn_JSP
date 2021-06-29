<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("utf-8");
    	String title = request.getParameter("title");
    	String src = request.getParameter("src");
    	
    %>
<div class="card">
  <img src="<%=request.getContextPath() +src %>" class="card-img-top img-fluid" alt="...">
  <div class="card-body">
    <h5 class="card-title"><%=title %></h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>