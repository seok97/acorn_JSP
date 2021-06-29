<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/uploadform.jsp</title>
</head>
<body>
   <h1>파일 업로드 테스트</h1>
   <form action="upload.jsp" method="post" enctype="multipart/form-data">
      <input type="text" name="comment" placeholder="설명..."/>
      <br>
      <input type="file" name="myFile"/>
      <br>
      <button type="submit">업로드</button>
   </form>
   <h2>이미지 업로드 테스트</h2>
   <form action="upload_image.jsp" method="post" enctype="multipart/form-data">
      <input type="text" name="comment" placeholder="설명..."/>
      <br>
      <label for="image">이미지 선택</label>
      <input type="file" id="image" name="image" accept=".jpg, .JPG, .JPEG, .png, .gif"/>
      <br>
      <button type="submit">업로드</button>
   </form>
   <h2>파일 업로드 테스트 Ajax</h2>
   <form action="ajax_upload.jsp" id="myForm" method="post" enctype="multipart/form-data">
      <input type="text" id="comment" name="comment" placeholder="설명..."/>
      <br>
      <input type="file" id="myFile" name="myFile"/>
      <br>
      <button type="submit">업로드</button>
   </form>
   
   <h2>이미지 업로드 테스트 Ajax</h2>
   <form id="imageForm" action="ajax_upload_image.jsp" method="post" enctype="multipart/form-data">
      <input type="text" name="comment" placeholder="설명..."/>
      <br>
      <label for="image">이미지 선택</label>
      <input type="file" id="image" name="image" accept=".jpg, .JPG, .JPEG, .png, .gif"/>
      <br>
      <button type="submit">업로드</button>
   </form>
   <h3>업로드 된 이미지</h3>
   <img id="resultImage" />
   <script>
      document.querySelector("#imageForm").addEventListener("submit", function(e){
         e.preventDefault();
         //폼에 입력한 내용 
         let data=new FormData(this);
         //폼을 제출할 url 
         let url=this.getAttribute("action");
         fetch(url, {
            method:"post",
            body:data
         })
         .then(function(response){
            return response.json();
         })
         .then(function(data){
            // data 는 {saveFileName:"xxx"} 형식의 object 이다.
            console.log(data);
            let imagePath="<%=request.getContextPath() %>/upload/"+data.saveFileName;
            document.querySelector("#resultImage").setAttribute("src", imagePath);
         });
      });
   
   
      document.querySelector("#myForm").addEventListener("submit", function(e){
         //폼이 제출되지 않도록 기본 동작을 막아준다. 
         e.preventDefault();
         //new FormData( 폼의 참조값 ) 해서 객체를 생성하면 폼에 입력한 내용, 선택한 내용이 
         //FormData 객체에 저장이 된다. 
         let data=new FormData(this);
         
         //fetch 함수를 이용해서 ajax 선송하기 
         fetch("ajax_upload.jsp",{
            method:"post",
            body:data // FormData 객체를 요청의 body 에 넣어주면 된다 
         })
         .then(function(response){
            return response.json();
         })
         .then(function(data){
            console.log(data);
         });
      });
      
   </script>
</body>
</html>





