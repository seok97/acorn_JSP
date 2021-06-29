<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/info2.jsp</title>
<style>
   #profileImage{
      width: 100px;
      height: 100px;
      border: 1px solid red;
      border-radius: 50%;
   }
   #image{
      display: none;
   }
</style>
</head>
<body>
<div class="container">
   <h1>개인 정보 입니다.</h1>
   <table>
      <tr>
         <th>이름</th>
         <td>김구라</td>
      </tr>
      <tr>
         <th>프로필 이미지</th>
         <td>
            <a href="javascript:" id="profileLink">
               <img id="profileImage" src="../images/1.jpg"/>
            </a>
         </td>
      </tr>
   </table>
   <form id="imageForm" action="ajax_profile_upload.jsp" method="post" 
                                 enctype="multipart/form-data">
      <input type="file" id="image" name="image" accept=".jpg, .JPG, .JPEG, .png, .gif"/>
   </form>
</div>
<script>
   document.querySelector("#profileLink").addEventListener("click", function(){
      //웹브라우저야 id 가 image 인 요소를 클릭해줘~
      document.querySelector("#image").click();
   });
   
   //이미지를 선택했을때 실행할 함수 등록 
   document.querySelector("#image").addEventListener("change", function(){
      
      let form=document.querySelector("#imageForm");
      // new FormData() 하면서 form 의 참조값을 넣어주어도 된다. 
      let data=new FormData(form);
      
      fetch("ajax_profile_upload.jsp",{
         method:"post",
         body:data
      })
      .then(function(response){
         return response.json();
      })
      .then(function(data){
         console.log(data);
         let imagePath="<%=request.getContextPath()%>/upload/"+data.saveFileName;
         document.querySelector("#profileImage").setAttribute("src", imagePath);
      });
   });
</script>   
</body>
</html>


