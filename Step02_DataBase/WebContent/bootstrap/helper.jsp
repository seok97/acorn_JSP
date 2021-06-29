<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/bootstrap/helper.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>

</head>
<body>
<div class="container">
   <h1>helper 클래스 테스트</h1>
   <div class="bg-info clearfix">
      <button class="btn btn-secondary float-start">왼쪽 버튼</button>
      <button class="btn btn-secondary float-end">오른쪽 버튼</button>
   </div>
   <p class="bg-warning">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio illum veritatis eos perferendis adipisci sunt ullam maxime saepe non? Nam similique architecto corporis eveniet deleniti recusandae provident accusamus praesentium temporibus.</p>

   <h2>color link</h2>
   <a href="#" class="link-primary">Primary link</a>
   <a href="#" class="link-secondary">Secondary link</a>
   <a href="#" class="link-success">Success link</a>
   <a href="#" class="link-danger">Danger link</a>
   <a href="#" class="link-warning">Warning link</a>
   <a href="#" class="link-info">Info link</a>
   <a href="#" class="link-light">Light link</a>
   <a href="#" class="link-dark">Dark link</a>
   <br/>
   <h2>ratio / 유튜브영상은 iframe 태그로 진행하면 됨 ! </h2>
   <div class="ratio ratio-16x9">
        <iframe src="https://www.youtube.com/embed/zpOULjyy-n8?rel=0" title="YouTube video" allowfullscreen></iframe>
   </div>
   
   <div class="fixed-top bg-dark p-3 text-white">fixed-top</div>
   <div class="fixed-bottom bg-dark p-3 text-white">fixed-bottom</div>
   <img class="sticky-top" src="../image/bengal.jpg" />
   <div class="bg-secondary" style="height: 1000px;"></div>
</div>
</body>
</html>




