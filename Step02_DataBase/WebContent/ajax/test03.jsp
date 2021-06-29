<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>/ajax/test03.jsp</title>
  </head>
  <body>
    <input type="text" id="inputName" placeholder="이름 입력.." />
    <input type="text" id="inputAddr" placeholder="주소 입력.." />
    <button id="sendBtn">전송</button>
    <script>
      /* 전송버튼을 누르면 입력한 이름과 주소를 읽어와서
		add.jsp 페이지에 ajax 전송
		add.jsp 페이지에서는 전송된 내용을 콘솔에 출력
		added! 라는 문자열을 add.jsp 페이지에서 응답하는 프로그램. */

      document.getElementById("sendBtn").addEventListener("click", () => {
        let name = document.getElementById("inputName").value
        let addr = document.getElementById("inputAddr").value
        let info = { name: name, addr: addr }
        fetch("add.jsp?name=" + name + "&addr=" + addr).then((res) => {
          return res.text();
        }).then((data)=>{
        	console.log("받은 응답 : " + data)
        })
      })
    </script>
  </body>
</html>
