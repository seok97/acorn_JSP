<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int num = Integer.parseInt(request.getParameter("num"));
    
    	String userid = (String)session.getAttribute("id");
    	
    	String writer = CafeDao.getInstance().getData(num).getWriter();
    	
    	// 만일 글 작성자
    	if(!writer.equals(userid)){
    		// 에러 코드값을 리턴해 준다.
    		response.sendError(HttpServletResponse.SC_FORBIDDEN,"남의 글을 지우면 안돼여");
			return; // 서블렛이 여기서 종료되어 아래 코드(html 포함)를 수행(응답)하지 않는다.
    	}// if 문 작성시 else를 안쓰는것이 좋다.
    	
    	boolean isSuccess = CafeDao.getInstance().delete(num);    		
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/delete.jsp</title>
</head>
<body>
   <%if(isSuccess){%>
      <script>
         alert("삭제 했습니다.");
         location.href="${pageContext.request.contextPath }/cafe/list.jsp";
      </script>
   <%}else{%>
      <script>
         alert("삭제 실패!");
         location.href="detail.jsp?num=<%=num%>";
      </script>
   <%} %>

</body>
</html>