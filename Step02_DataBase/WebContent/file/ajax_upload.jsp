<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
   //파일을 업로드할 절대 경로를 메소드를 통해서 얻어오기 (WebContent 하위의 upload 폴더)
   String path=request.getServletContext().getRealPath("/upload");
   //경로 확인!   
   System.out.println(path);
   //만일 폴더가 만들어져 있지 않다면 폴더를 만든다.
   File file=new File(path);
   if(!file.exists()){
      file.mkdir();
   }
   // cos.jar 에서 제공해주는 MultiPartRequest 객체 생성하기
   MultipartRequest mr=new MultipartRequest(request, //HttpServletRequest
         path, //파일을 저장할 경로 
         1024*1024*100, //최대 업로드 사이즈 제한
         "utf-8", //한글 파일명 깨지지 않도록 인코딩 설정 
         new DefaultFileRenamePolicy()); //동일한 파일명이 있으면 자동으로 파일명 바꿔서 저장하도록
         
   //MultipartRequest 객체가 성공적으로 생성되면 파일 업로드가 성공된 것이다.
   //전송된 문자열과 파일의 정보는 mr 객체의 메소드를 통해서 얻어낼수 있다. 
   
   // <input type="text" name="comment" /> 에 입력한 문자열 얻어오기
   String comment=mr.getParameter("comment");
   // <input type="file" name="myFile" /> 을 통해서 업로드된 파일을 access 할수 있는 File 객체
   File myFile=mr.getFile("myFile");
   //파일의 크기 (byte)
   long fileSize=myFile.length();   
   //원본 파일명 
   String orgFileName=mr.getOriginalFileName("myFile");
   /*
      파일 시스템에 저장된 파일명
      - upload 폴더안에 동일한 이름의 파일이 없으면 원본 파일명과 동일하게 저장된다.
      - upload 폴더안에 동일한 이름의 파일이 있으면 파일명 뒤에 1, 2, 3 ... 숫자를 자동으로 부여해서 저장한다.
        ex)  image.jpg  image1.jpg  image2.jpg ...
   */
   String saveFileName=mr.getFilesystemName("myFile");
%>    
{"isSuccess": true}