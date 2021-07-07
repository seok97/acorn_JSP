<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/private/ajax_form.jsp</title>
</head>
<body>
<div class="container">
   <form action="insert.jsp" method="post" id="insertForm">
      <input type="hidden" name="imagePath" id="imagePath"/>
      <div>
         <label for="caption">설명</label>
         <input type="text" name="caption" id="caption"/>
      </div>
   </form>
   <form action="ajax_upload.jsp" method="post" id="ajaxForm" enctype="multipart/form-data">
      <div>
         <label for="image">이미지</label>
         <input type="file" name="image" id="image" 
            accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
      </div>
   </form>
   <button id="submitBtn">등록</button>
   <div class="img-wrapper">
      <img />
   </div>
</div>
<script src="${pageContext.request.contextPath}/js/gura_util.js"></script>
<script>
   //이미지를 선택했을때 실행할 함수 등록
   document.querySelector("#image").addEventListener("change", function(){
      //id 가 ajaxForm 인 form 을 ajax 전송 시킨다.
      const form=document.querySelector("#ajaxForm");
      //util 함수를 이용해서 ajax 전송
      ajaxFormPromise(form)
      .then(function(response){
         return response.json();
      })
      .then(function(data){
         // { imagePath: src }
    	  console.log(data);
         const path = "${pageContext.request.contextPath}"+data.imagePath;
         document.querySelector(".img-wrapper img").setAttribute("src",path);
          
         // input type="hidden"
         document.querySelector("#imagePath").value = data.imagePath;
      });
   });
   
   document.querySelector("#submitBtn").addEventListner("click",function(){
	   document.querySelector("#insertForm").submit();
   })
</script>
</body>
</html>

