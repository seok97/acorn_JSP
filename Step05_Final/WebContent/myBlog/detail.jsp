<%@page import="my.blog.dao.MyDao"%>
<%@page import="my.blog.dto.MyDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int num = Integer.parseInt(request.getParameter("num"));
    	MyDto dto = MyDao.getInstance().select(num);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/detail.jsp</title>
<style>
#likeheart{
	background: none;
	color: inherit;
	border: none;
	padding: 0;
	font: inherit;
	cursor: pointer;
	outline: inherit;
}
</style>
</head>
<body>
<jsp:include page="/include/resource.jsp"></jsp:include>
<div class="container">
	<table>
		<tr>
			<th>글번호</th>
			<td><%=dto.getB_idx() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=dto.getB_writer() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=dto.getB_title() %></td>
		</tr>
		<tr>
			<th>등록일</th>
			<td><%=dto.getB_regedate() %></td>
		</tr>
		<tr>
			<td colspan="2"><textarea disabled><%=dto.getB_content() %></textarea></td>
		</tr>
		<tr>
			<td>
					<div class="col">
				     	<div id="likecheck">
			     		<input type="hidden" value="<%=dto.getB_idx() %>" />
			     		<button id="likeheart" class="<%=dto.getB_idx() %>">
				     		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
							  <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
							</svg>
			     		</button>
						<%=dto.getB_like() %>
			     		</div>
					</div>
			</td>
		</tr>
	</table>
	<ul>
		<li><a href="mylist.jsp">목록보기</a></li>
		<%
			String id = (String)session.getAttribute("id");
			if(dto.getB_writer().equals(id)){%>
			<li><a href="private/updateform.jsp?num=<%=dto.getB_idx()%>">수정</a></li>		
			<li><a href="private/delete.jsp?num=<%=dto.getB_idx()%>">삭제</a></li>
			<%} %>
	</ul>
</div>
<script>
	document.querySelector("#likeheart").addEventListener("click",()=>{
		let idcheck = "<%=(String)session.getAttribute("id")%>";
		if(idcheck == "null") {
			if(confirm("로그인해주세요")){
				location.href="${pageContext.request.contextPath}/users/loginform.jsp?url=<%=request.getContextPath()%>/myBlog/detail.jsp&num=<%=dto.getB_idx()%>";
			}
		}
		fetch("private/likecheck.jsp")
		.then((res)=>{
			return res.json();
		}).then((data)=>{
			console.log(data);
		})
		
	})
</script>
</body>
</html>