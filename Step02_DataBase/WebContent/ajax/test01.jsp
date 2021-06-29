<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/ajax/test01.jsp</title>
</head>
<body>

<button id="requestBtn">요청하기</button>
<button id="requestBtn2">요청하기2</button>
<button id="requestBtn3">요청하기3</button>
<button id="requestBtn4">요청하기4</button>
<button id="requestBtn5">요청하기5</button>
<div id="result">
   
</div>
<script>
   document.querySelector("#requestBtn").addEventListener("click", function(){
      fetch("get_data.jsp")
      .then(function(response){
         //response 는 응답객체이다 
         console.log(response);
         //응답객체의 text() 함수를 호출해서 리턴되는 Promise 객체를 리턴해준다.
         return response.text();
      })
      .then(function(data){
         //data 는 서버가 응답한 문자열이다. 
         console.log(data);
      });
   });
   document.querySelector("#requestBtn2").addEventListener("click", function(){
      fetch("get_data2.jsp")
      .then(function(response){
         //response 는 응답객체이다 
         console.log(response);
         //응답객체의 text() 함수를 호출해서 리턴되는 Promise 객체를 리턴해준다.
         return response.text();
      })
      .then(function(data){
         //data는 html 형식의 문자열이다.  
         document.querySelector("#result").innerHTML=data;
      });
   });   
   
   document.querySelector("#requestBtn3").addEventListener("click", function(){
      fetch("get_data3.jsp")
      .then(function(response){
         return response.text();
      })
      .then(function(data){
         //data 는 서버가 응답한 JSON 형식의 문자열이다
         console.log(data);
         //object 로 바꾸기
         let obj=JSON.parse(data);
         let p1=document.createElement("p");
         p1.innerText="번호:"+obj.num+" 이름:"+obj.name+" 남자여부:"+obj.isMan;
         document.querySelector("#result").append(p1);
            
      });
   });   
   document.querySelector("#requestBtn4").addEventListener("click", function(){
      fetch("get_data3.jsp")
      .then(function(response){
         //서버가 JSON 형식의 문자열을 응답할때는 .json() 함수를 호출해서 리턴한다. 
         return response.json();
      })
      .then(function(data){
         //data 는 object 이다. 
         console.log(data);
         let p1=document.createElement("p");
         p1.innerText="번호:"+data.num+" 이름:"+data.name+" 남자여부:"+data.isMan;
         document.querySelector("#result").append(p1);
      });
   });   
   document.querySelector("#requestBtn5").addEventListener("click", function(){
      fetch("animal.jsp")
      .then(function(response){
         //서버가 JSON 형식의 문자열을 응답할때는 .json() 함수를 호출해서 리턴한다. 
         return response.json();
      })
      .then(function(data){
         //data 는 object 이다. 
         console.log(data);
         let ul = document.createElement("ul");
         for(let i = 0 ; i< data.length; i++){
        	 let tmp = document.createElement("li");
        	 tmp.innerText = data[i];
        	 ul.append(tmp);
         }
         document.querySelector("#result").append(ul);
      });
   });   
</script>   
</body>
</html>



