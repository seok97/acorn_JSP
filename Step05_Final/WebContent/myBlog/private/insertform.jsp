<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/myBlog/private/insertform.jsp</title>
</head>
<body>
<jsp:include page="/include/resource.jsp"></jsp:include>
<div class="container">
	<h1>새글 작성 폼</h1>
	<form action="insert.jsp">
		<div>
			<label for="title">제목</label>
			<input type="text" name="title" id="title" />
		</div>
		<div>
			<label for="sumnail">섬네일이미지</label>
			<input type="file" name="sumnail" id="sumnail" accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif"/>
		</div>
		<div>
			<label for="content">내용</label>
			<textarea name="content" id="content"></textarea>
		</div>
		<button type="submit">저장</button>
	</form>
</div>

</body>
</html>