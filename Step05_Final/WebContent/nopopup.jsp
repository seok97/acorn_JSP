<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// 넘어오는 값이 있는지 읽는다.
    	String isPopup = request.getParameter("isPopup");
    	// 해당 값이 존재하면 팝업을 띄우지 않겠다고 체크한 것이므로
    	if(isPopup != null){
    		// 팝업을 일정시간 띄우지 않겠다는 정보를 쿠키에 저장한다.
    		Cookie cook = new Cookie("isPopup",isPopup);
    		cook.setMaxAge(60); // 초단위
    		response.addCookie(cook);
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/nopopup.jsp</title>
</head>
<body>
<script>
	self.close();
</script>
</body>
</html>