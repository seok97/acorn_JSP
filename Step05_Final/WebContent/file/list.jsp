<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--
   [ 자료실 기능 구현하기 ]
   
   1. Step02_DB 프로젝트에 /file/uploadform.jsp , /file/upload.jsp 를 참고하세요.  
   2. 파일 삭제 링크는 파일을 업로드한 사람과 로그인된 아이디와 같을때만 만들면 됩니다.
   3. 페이징 처리도 해보세요.
   4. 검색기능도 만들어 보세요. 
         검색조건은  제목검색(title), 작성자검색(writer), 제목+파일명(title,filename) 검색  
   5. 다운로드 기능도 만들어 보세요. 
      Step02_DB 프로젝트에 /file/download.jsp 참고
      (파일명을 클릭하면 해당 파일이 자동 다운로드 되도록)
 --%>    
<%
//한 페이지에 몇개씩 표시할 것인지
final int PAGE_ROW_COUNT=5;
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

String userid = (String)session.getAttribute("id");


/*
[ 검색 키워드에 관련된 처리 ]
-검색 키워드가 파라미터로 넘어올수도 있고 안넘어 올수도 있다.      
*/
String keyword=request.getParameter("keyword");
String condition=request.getParameter("condition");
//만일 키워드가 넘어오지 않는다면 
if(keyword==null){
//키워드와 검색 조건에 빈 문자열을 넣어준다. 
//클라이언트 웹브라우저에 출력할때 "null" 을 출력되지 않게 하기 위해서  
keyword="";
condition=""; 
}

//특수기호를 인코딩한 키워드를 미리 준비한다. 
String encodedK=URLEncoder.encode(keyword);


FileDto dto=new FileDto();
dto.setStartRowNum(startRowNum);
dto.setEndRowNum(endRowNum);

//ArrayList 객체의 참조값을 담을 지역변수를 미리 만든다.
List<FileDto> list=null;
//전체 row 의 갯수를 담을 지역변수를 미리 만든다.
int totalRow=0;
//만일 검색 키워드가 넘어온다면 
if(!keyword.equals("")){
//검색 조건이 무엇이냐에 따라 분기 하기
if(condition.equals("title_orgFileName")){//제목 + 내용 검색인 경우
   //검색 키워드를 FileDto 에 담아서 전달한다.
   dto.setTitle(keyword);
   dto.setOrgFileName(keyword);
   //제목+내용 검색일때 호출하는 메소드를 이용해서 목록 얻어오기 
   list=FileDao.getInstance().getListTN(dto);
   //제목+내용 검색일때 호출하는 메소드를 이용해서 row  의 갯수 얻어오기
   totalRow=FileDao.getInstance().getCountTN(dto);
}else if(condition.equals("title")){ //제목 검색인 경우
   dto.setTitle(keyword);
   list=FileDao.getInstance().getListT(dto);
   totalRow=FileDao.getInstance().getCountT(dto);
}else if(condition.equals("writer")){ //작성자 검색인 경우
   dto.setWriter(keyword);
   list=FileDao.getInstance().getListW(dto);
   totalRow=FileDao.getInstance().getCountW(dto);
} // 다른 검색 조건을 추가 하고 싶다면 아래에 else if() 를 계속 추가 하면 된다.
}else{//검색 키워드가 넘어오지 않는다면
//키워드가 없을때 호출하는 메소드를 이용해서 파일 목록을 얻어온다. 
list=FileDao.getInstance().getList(dto);
//키워드가 없을때 호출하는 메소드를 이용해서 전제 row 의 갯수를 얻어온다.
totalRow=FileDao.getInstance().getCount();
}



//하단 시작 페이지 번호 
int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
//하단 끝 페이지 번호
int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;


//전체 페이지의 갯수
int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
//끝 페이지 번호가 전체 페이지 갯수보다 크다면 잘못된 값이다.
if(endPageNum > totalPageCount){
   endPageNum=totalPageCount; //보정해 준다.
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
<style>
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
</style>
</head>
<body>
<jsp:include page="/include/resource.jsp"></jsp:include>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="file" name="thisPage"/>
</jsp:include>
<div class="container">
	<a href="<%=request.getContextPath() %>/index.jsp">메인으로</a>
   <a href="private/uploadform.jsp">업로드 하러가기</a>
   <h1>자료실 목록입니다.</h1>
   <table>
      <thead>
         <tr>
            <th>번호</th>
            <th>작성자(업로더)</th>
            <th>제목(설명)</th>
            <th>파일명(원본파일명)</th>
            <th>파일크기</th>
            <th>등록일</th>
            <th>삭제</th>
         </tr>
      </thead>
      <tbody>
      	<%for(FileDto tmp:list){ %>
      		<tr>
      			<td><%=tmp.getNum() %></td>
      			<td><%=tmp.getWriter() %></td>
      			<td><%=tmp.getTitle() %></td>
      			<td><a href="download.jsp?num="<%=tmp.getNum() %>><%=tmp.getOrgFileName() %></a></td>
      			<td><%=tmp.getFileSize() %></td>
      			<td><%=tmp.getRegdate() %></td>
      			<td>
      			
      			<%if(tmp.getWriter().equals(userid)){ %>
      				<a href="javascript:deleteConfirm(<%=tmp.getNum()%>)">
	      				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
						  <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
						</svg>
					</a>
					<%}else{ %>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
						  <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
						</svg>
					<%} %>
				</td>
      		</tr>
      	<%} %>
      </tbody>
   </table>

   <!-- 페이징 -->
  <div class="page-ui">
  	<ul>
         <%if(startPageNum != 1){ %>
            <li>
               <a href="list.jsp?pageNum=<%=startPageNum-1 %>">Prev</a>
            </li>   
         <%} %>
         
         <%for(int i=startPageNum; i<=endPageNum ; i++){ %>
            <li>
               <%if(pageNum == i){ %>
                  <a class="active" href="list.jsp?pageNum=<%=i %>"><%=i %></a>
               <%}else{ %>
                  <a href="list.jsp?pageNum=<%=i %>"><%=i %></a>
               <%} %>
            </li>   
         <%} %>
         <%if(endPageNum < totalPageCount){ %>
            <li>
               <a href="list.jsp?pageNum=<%=endPageNum+1 %>">Next</a>
            </li>
         <%} %>
      </ul>
  </div>
  
  <!-- search -->
     <div style="clear:both;"></div>
   
   <form action="list.jsp" method="get"> 
      <label for="condition">검색조건</label>
      <select name="condition" id="condition">
         <option value="title_orgFileName" <%=condition.equals("title_orgFileName") ? "selected" : ""%>>제목+내용</option>
         <option value="title" <%=condition.equals("title") ? "selected" : ""%>>제목</option>
         <option value="writer" <%=condition.equals("writer") ? "selected" : ""%>>작성자</option>
      </select>
      <input type="text" id="keyword" name="keyword" placeholder="검색어..." value="<%=keyword%>"/>
      <button type="submit">검색</button>
   </form>   
   
   <%if(!condition.equals("")){ %>
      <p>
         <strong><%=totalRow %></strong> 개의 글이 검색 되었습니다.
      </p>
   <%} %>
   
</div>
<script>
	const deleteConfirm = (num) =>{
		const isDelete = confirm(num + " 번 자료를 삭제?");
		if(isDelete){
			location.href = "private/delete.jsp?num="+num;
		}
	}
</script>
</body>
</html>
