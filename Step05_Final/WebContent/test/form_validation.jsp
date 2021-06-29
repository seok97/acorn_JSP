<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/form_validation.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<form action="">
		<div>
			<label for="form-label">아이디</label>
			<input type="text" class="form-control is-valid" />
			<div class="valid-feedback">
				well done ~
			</div>
		</div>
		<div>
			<label for="" class="form-label">password</label>
			<input type="text" class="form-control is-invalid" />
			<div class="invalid-feedback">wrong word !</div>
		</div>
	</form>
</div>
</body>
</html>