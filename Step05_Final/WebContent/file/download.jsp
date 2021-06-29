<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="application/octet-stream; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

// get 방식으로 파일의 번호를 읽어오기
int num = Integer.parseInt(request.getParameter("num"));
FileDto dto = FileDao.getInstance().getData(num);


 // file download
 long filesize = 0;
String orgfilename = null;
String savefilename = null;

savefilename = dto.getSaveFileName();
orgfilename = dto.getOrgFileName();
filesize = dto.getFileSize();

// 실제 파일이 저장되어있는 server 경로
String rpath = request.getServletContext().getRealPath("/upload") + File.separator + savefilename;
System.out.println("파일 경로 : " + rpath);
FileInputStream fis = new FileInputStream(rpath);

// download
String encodedName = null;
// 파일명 인코딩 처리 / 벤더사
if(request.getHeader("User-Agent").contains("Firefox")){
	 //벤더사가 파이어 폭스인경우 
    encodedName=new String
       (orgfilename.getBytes("utf-8"),"ISO-8859-1");
}else{ //그외 다른 벤더사 
    encodedName=URLEncoder.encode(orgfilename, "utf-8");
    //파일명에 공백이있는 경우 처리 
    encodedName=encodedName.replaceAll("\\+"," ");
 }

//응답 헤더 정보 설정
response.setHeader("Content-Disposition","attachment;filename="+encodedName);
response.setHeader("Content-Transfer-Encoding", "binary");

//다운로드할 파일의 크기 읽어와서 다운로드할 파일의 크기 설정
response.setContentLengthLong(filesize);

//클라이언트에게 출력할수 있는 스트림 객체 얻어오기
BufferedOutputStream bos=
   new BufferedOutputStream(response.getOutputStream());
//한번에 최대 1M byte 씩 읽어올수 있는 버퍼
byte[] buffer=new byte[1024*1024*100];
int readedByte=0;
//반복문 돌면서 출력해주기
while(true){
   //byte[] 객체를 이용해서 파일에서 byte 알갱이 읽어오기
   readedByte = fis.read(buffer);
   if(readedByte == -1)break; //더이상 읽을 데이터가 없다면 반복문 빠져 나오기
   //읽은 만큼 출력하기
   bos.write(buffer, 0, readedByte);
   bos.flush(); //출력
}
//FileInputStream 닫아주기 
fis.close();   


%>