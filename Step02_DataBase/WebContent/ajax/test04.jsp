<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test04.jsp</title>
</head>
<body>
   <h1>폼 테스트</h1>
   <p>form 에 submit 이벤트가 일어 났을때 폼 전송을 막고 폼에 입력한 문자열을 읽어와서 ajax 전송해보기</p>
   <form action="add.jsp" method="get" id="myForm">
      <input type="text" name="name" placeholder="이름 입력..."/>
      <input type="text" name="addr" placeholder="주소 입력..."/>
      <button type="submit">전송</button>
   </form>
   <script>
      document.querySelector("#myForm").addEventListener("submit", function(e){
         //기본동작을 막는다 => 폼이 제출 안되게 막는다. 
         //왜 막지? 페이지 전환 없이 ajax 요청으로 입력한 내용을 전송하려고 
         e.preventDefault();
         // this 는 "submit" 이벤트가 일어난 바로 그 문서 객체임으로 form 이다. 
         console.log(this);
         // 폼에 입력한 내용을 query string 형식으로 얻어내기 
         const formData=new FormData(this);
         const params=new URLSearchParams(formData);
         const queryString=params.toString();
         
         //위의 세줄을 한줄로 줄이면 
         //const queryString=new URLSearchParams(new FormData(this)).toString();
         
         console.log(queryString);
         //얻어낸 query string 을 fetch() 함수에서 사용하기
         fetch("add.jsp?"+queryString)
         .then(function(response){
            return response.text();
         })
         .then(function(data){
            console.log(data);
         });
      });
   </script>
</body>
</html>





