<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<div class="container">
   <h1>회원 가입 폼 입니다.</h1>
   <form action="signup.jsp" method="post">
      <div class="form-group">
         <label class="form-label" for="nick">닉네임</label>
         <input class="form-control" type="text" name="nick" id="nick"/>
      </div>
      <fieldset>
         <legend>이메일 수신여부</legend>
         <div class="form-check-inline">
            <input class="form-check-input" type="radio" name="email" id="email1" value="yes" checked/>
            <label class="form-check-label" for="email1">네</label>
         </div>
         <div class="form-check-inline">
            <input class="form-check-input" type="radio" name="email" id="email2" value="no"/>
            <label class="form-check-label" for="email2">아니요</label>
         </div>
      </fieldset>
      <div class="form-group">
         <label class="form-label" for="concern">관심사</label>
         <select class="form-select" name="concern">
            <option value="">선택</option>
            <option value="game">게임</option>
            <option value="movie">영화</option>
            <option value="etc">기타</option>
         </select>
      </div>
      <fieldset>
         <legend>배우고 싶은 언어 체크</legend>
         <div class="form-check-inline">
            <input class="form-check-input" type="checkbox" name="language" id="lan1" value="Java"/>
            <label class="form-check-label" for="lan1">자바</label>
         </div>
         <div class="form-check-inline">
            <input class="form-check-input" type="checkbox" name="language" id="lan2" value="Python"/>
            <label class="form-check-label" for="lan2">파이썬</label>
         </div>
         <div class="form-check-inline">
            <input class="form-check-input" type="checkbox" name="language" id="lan3" value="C++"/>
            <label class="form-check-label" for="lan3">C++</label>
         </div>
      </fieldset>
      <div class="form-group">
         <label class="form-label" for="comment">남기고 싶은 말</label>
         <textarea class="form-control" name="comment" id="comment" cols="30" rows="10"></textarea>
      </div>
      <button class="btn btn-primary" type="submit">가입</button>
   </form>   
</div>
</body>
</html>









