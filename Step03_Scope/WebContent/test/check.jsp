<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Object result = application.getAttribute("count");
    	// 만일 첫번째 출석이라면
    	if(result == null){
    		//application영역에 count라는 키값으로 1 을 담는다.
    		application.setAttribute("count", 1);
    	}else{
    		//원래 type 으로 casting
    		int count = (int)result;
    		//카운트를 1증가 시키고
    		count++;
    		//application 영역에 count 라는 키값으로 담는다.
    		application.setAttribute("count", count);
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/check.jsp</title>
</head>
<body>
	<p><strong><%=(int)application.getAttribute("count") %></strong>번쨰 방문</p>
</body>
</html>