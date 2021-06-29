package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 오늘의 운세 얻어오기
		String fortuneToday = "문열어!";
		
		// 클라이언트에게 html로 응답을 해야한다.
		// 하지만 이러한 서블렛은 html 문자열을 응답하기에는 매우 비효율적이다.
		// jsp 페이지가 대신 html 형식의 문자열을 대신 응답하도록 할 수 있다.
		
		// HttpServletRequest.getRequestDispatcher( ) 메소드를 사용한다.
		// 응답을 위임할 jsp 페이지의 위치를 전달하면서 RequestDispatcher 객체의 참조값을 얻어온다.
		RequestDispatcher rd = req.getRequestDispatcher("/test/fortune.jsp");
		
		// request객체에 변수 담기
		req.setAttribute("fortuneToday", fortuneToday);
		
		// .forward(요청객체, 응답객체) 를 호출해 대신 응답하라고 한다.
		rd.forward(req, resp);
		
	}
}
