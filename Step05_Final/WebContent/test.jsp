<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html{
		background-color: darkgray;
	}
	
	nav{
	width: 500px;	
}


</style>
</head>
<body>
<jsp:include page="/include/resource.jsp"></jsp:include>
<h1>테스트 페이지 입니다.</h1>

<div class="alert alert-danger" role="alert">
  삭제 했습니다
</div>

<button type="button" class="btn btn-outline-success">전송</button>


<nav aria-label="breadcrumb">
  <ol class="breadcrumb bg-light bg-gradient rounded">
    <li class="breadcrumb-item"><a href="#">home</a></li>
    <li class="breadcrumb-item"><a href="#">game</a></li>
    <li class="breadcrumb-item active" aria-current="page">study</li>
  </ol>
</nav>

<form>
<div class="mb-3">
    <label for="" class="form-label">email</label>
    <input type="email" class="form-control" id="" aria-describedby="emailHelp">
    <div id="" class="invalid-feedback">
      Please provide a valid zip.
    </div>
  </div>
</form>

<form>
<label for="" class="form-label">email</label>
  <input type="email" class="form-control is-invalid" id="">
  <div id="" class="invalid-feedback">
     형식이 달라요
    </div>
</form>

<script>

</script>
</body>
</html>