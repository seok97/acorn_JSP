<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/ajax/test06.jsp</title>
<script src="../js/gura_util.js"></script>
</head>
<body>
   <h1>ajax 타이레놀 테스트</h1>
   <input type="text" id="inputMsg" placeholder="전송할 문자열 입력..."/>
   <button id="sendBtn">전송</button>
   
   <form action="send2.jsp" method="post" id="myForm">
      <input type="text" name="msg" placeholder="전송할 문자열 입력..."/>
      <button type="submit">폼전송</button>
   </form>
   
   <script>
      document.querySelector("#sendBtn").addEventListener("click", function(){
         let msg=document.querySelector("#inputMsg").value;
         
         ajaxPromise("send2.jsp","post", {msg:msg})
         .then(function(response){
            return response.text();
         })
         .then(function(data){
            console.log(data);
         });
         
      });
      
      document.querySelector("#myForm").addEventListener("submit", function(e){
         //폼이 제출되지 않도록 막기
         e.preventDefault();
         
         ajaxFormPromise(this)
         .then(function(response){
            return response.text();
         })
         .then(function(data){
            console.log(data);
         })
      });
   </script>
</body>
</html>









