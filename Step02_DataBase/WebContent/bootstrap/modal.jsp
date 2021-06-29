<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<h1>모달 테스트</h1>
	<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <input id="inputmsg" type="text" class="form-control"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button id="saveBtn" type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</div>
<%
	String myn = "석우현";
	
%>
<script>
	let myn = "<%= myn%>";
	
	//저장버튼을 눌렀을때 실행할 함수 등록
	document.querySelector("#saveBtn").addEventListener("click",()=>{
		let msg = document.querySelector("#inputmsg").value;
		console.log(msg+"를 저장함.");
		let m = document.getElementById('exampleModal');
		let modal = bootstrap.Modal.getInstance(m);
		modal.hide();
	});
</script>
</body>
</html>