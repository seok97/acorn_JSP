<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<jsp:include page="include/resource.jsp"></jsp:include>
<style>
	.card{
		display: inline-block;
	}
</style>
</head>
<body>
   <jsp:include page="include/navbar.jsp"></jsp:include>
   
   <div class="container">
   <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="images/top01.jpg" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item">
	      <img src="images/top02.jpg" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item">
	      <img src="images/top03.jpg" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item">
	      <img src="images/top04.jpg" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item">
	      <img src="images/top05.jpg" class="d-block w-100" alt="...">
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>

   <h1>여름 맞이 신상품 <span class="badge bg-primary">30% SALE</span></h1>
	<div class="row align-items-center">
		<div class="col-3">
			<jsp:include page="/include/card.jsp">
				<jsp:param value="test01" name="title"/>
				<jsp:param value="/images/top01.jpg" name="src"/>
			</jsp:include>
		</div>
		<div class="col-3">
			<jsp:include page="/include/card.jsp">
				<jsp:param value="test02" name="title"/>
				<jsp:param value="/images/top02.jpg" name="src"/>
			</jsp:include>
		</div>
		<div class="col-3">
			<jsp:include page="/include/card.jsp">
				<jsp:param value="test03" name="title"/>
				<jsp:param value="/images/top03.jpg" name="src"/>
			</jsp:include>
		</div>
		<div class="col-3">
			<jsp:include page="/include/card.jsp">
				<jsp:param value="test04" name="title"/>
				<jsp:param value="/images/top04.jpg" name="src"/>
			</jsp:include>
		</div>
	</div>
	
	
   
      <h1>인덱스 페이지 입니다.</h1>
      <ul>
         <li><a href="member/list.jsp">회원 목록 보기</a></li>
         <li><a href="todo/list.jsp">할일 목록 보기</a></li>
         <li><a href="bootstrap/hello.html">bootstrap hello 테스트</a></li>
      </ul>
   </div>
</body>
</html>






