package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sub/fortune")
public class FortuneServlet extends HttpServlet{//1.
   //2.
   @Override
   protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      //한글 깨지지 않도록
      resp.setCharacterEncoding("utf-8");
      //클라이언트에게 내가 뭘 응답할지 미리 알리는 역활
      resp.setContentType("text/html;charset=utf-8");
      
      //클라이언트에게 문자열을 출력할수 있는 객체의 참조값 얻어오기
      PrintWriter pw=resp.getWriter();
      pw.println("<!doctype html>");
      pw.println("<html>");
      pw.println("<head>");
      pw.println("<meta charset='utf-8'/>");
      pw.println("<title>오늘의 운세페이지</title>");
      pw.println("</head>");
      pw.println("<body>");
      pw.println("<h1>오늘의 운세</h1>");
      
      String[] fortunes = {
            "동쪽으로 가면 귀인을 만나요",
            "복권을 사면 당첨될 거에요",
            "코인을 사면 폭락할지도 몰라요",
            "열심히 공부하면 좋은 결과가 있어요",
            "오늘의 행운숫자는 4"
      };
      
      
      String[] name = new String[5];
      String[] friends = name;
      for(int i = 0; i < friends.length ; i++){
    	 	friends[i] = null;
    	  }

      
      
      //Random 객체를 생성해서 
      Random ran=new Random();
      // 0~4 사이의 렌덤한 정수를 얻어낸다.
      int ranNum=ran.nextInt(5);
      //오늘의 운수를 랜덤하게 출력해준다. 
      pw.println("<p>"+fortunes[ranNum]+"</p>");
      pw.println("<a href=\"../index.html\">인덱스로 가기</a>");
      pw.println("<a href='/Step01_Servlet/index.html'>인덱스로 가기</a>");
      pw.println("</body>");
      pw.println("</html>");
      pw.close();
   }
}







