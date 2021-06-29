<%@page import="my.blog.dao.MyDao"%>
<%@page import="java.util.List"%>
<%@page import="my.blog.dto.MyDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	
	//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=16;
	//하단 페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT=5;
	
	//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	int pageNum=1;
	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	String strPageNum=request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어 온다면
	if(strPageNum != null){
	   //숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
	   pageNum=Integer.parseInt(strPageNum);
	}
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*PAGE_ROW_COUNT;

	MyDto dto = new MyDto();
	dto.setStartRownNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
   //CafeDao 객체의 참조값 얻어와서 

   //회원목록 얻어오기 
   List<MyDto> list= MyDao.getInstance().getList(dto);
   
   //하단 시작 페이지 번호 
   int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
   //하단 끝 페이지 번호
   int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
   
   // 전체 row의 갯수
   int totalRow= MyDao.getInstance().getCount();
   int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
   
   // 끝 페이지번호가 전체 페이지 갯수보다 크다면 잘못된 값이다.
   if(endPageNum > totalPageCount){
	   endPageNum = totalPageCount;
   }
   
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/myBlog/mylist.jsp</title>
<style>
.page-ui{
	display: flex;
    justify-content: center;
}
   .page-ui a{
      text-decoration: none;
      color: #000;
   }
   
   .page-ui a:hover{
      text-decoration: underline;
   }
   
   .page-ui a.active{
      color: red;
      font-weight: bold;
      text-decoration: underline;
   }
   .page-ui ul{
      list-style-type: none;
      padding: 0;
   }
   
   .page-ui ul > li{
      float: left;
      padding: 5px;
   }
   
   div.row{
   	justify-content: center;
   }
   div.card{
   	margin : 10px;
   }
   
   img#sumnail{
   	object-fit: cover;
    border-radius: 50%;
    width: 1.5rem;
    height: 1.5rem;
   }
   a#list_card{
   	text-decoration: none;
   	color: #212529;
   }
   
   a#list_card:hover{
   	text-decoration: none;
   	color: #212529;
   }
   #likecheck {
	display: flex;
	justify-content: space-around;
}

#likeheart{
	background: none;
	color: inherit;
	border: none;
	padding: 0;
	font: inherit;
	cursor: pointer;
	outline: inherit;
}
	
</style>

</head>
<body>
<jsp:include page="../include/resource.jsp"></jsp:include>
<div class="container">
	<div class="row">
		<div class="col">
		<span>Myinstagram</span>
		<a href="private/insertform.jsp">새글 작성하기</a>
		<a href="../index.jsp">인덱스로..</a>
		</div>
	</div>
	
	<div class="row">
	<%for(MyDto tmp:list){ %>
		<div class="card" style="width: 18rem;">
			<a id="list_card" href="detail.jsp?num=<%=tmp.getB_idx() %>">
				<img src="..." class="card-img-top" alt="...">
				<div class="card-body">
				    <h5 class="card-title"><%=tmp.getB_title() %></h5>
				    <p class="card-text"><%=tmp.getB_content() %></p>
				    <p class="card-text"><small class="text-muted"><%=tmp.getB_regedate() %></small></p>
		  		</div>
			</a>	
			<div class="card-footer">
		     	<small class="text-muted row">
				<div class="col">
		     		<img src="" class="card-img-top" id="sumnail"/>
				</div>
				<div class="col-6">
		     		by <%=tmp.getB_writer() %>
		     	</div>
		     	<div class="col">
				     	<div id="likecheck">
			     		<input type="hidden" value="<%=tmp.getB_idx() %>" />
			     		<button id="likeheart" class="<%=tmp.getB_idx() %>">
				     		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
							  <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
							</svg>
			     		</button>
						<%=tmp.getB_like() %>
			     		</div>
					</div>
		     	</small>
		     	
		   	</div>
		</div>
		
	<%} %>
	</div>
	
	<div class="row">
	<div class="col">
		<div class="page-ui clearfix">
	      <ul>
	         <%if(startPageNum != 1){ %>
	            <li>
	               <a href="mylist.jsp?pageNum=<%=startPageNum-1 %>">Prev</a>
	            </li>   
	         <%} %>
	         
	         <%for(int i=startPageNum; i<=endPageNum ; i++){ %>
	            <li>
	               <%if(pageNum == i){ %>
	                  <a class="active" href="mylist.jsp?pageNum=<%=i %>"><%=i %></a>
	               <%}else{ %>
	                  <a href="mylist.jsp?pageNum=<%=i %>"><%=i %></a>
	               <%} %>
	            </li>   
	         <%} %>
	         <%if(endPageNum < totalPageCount){ %>
	            <li>
	               <a href="mylist.jsp?pageNum=<%=endPageNum+1 %>">Next</a>
	            </li>
	         <%} %>
	      </ul>
	   </div>   
	</div>
	</div>

</div>
<script>
	document.querySelector("#likeheart").addEventListener("click",()=>{
		console.log(this.getAttribute("class"))
		
		let logincheck = <%= (String)session.getAttribute("id")%>;
		if(logincheck== null) {
			alert("로그인해주세요");
		} 
	})
</script>
</body>
</html>