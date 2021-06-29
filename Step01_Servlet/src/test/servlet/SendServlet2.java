package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/send2")
public class SendServlet2 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// post 방식은 한글이 깨지므로 인코딩 해야 한다.
		req.setCharacterEncoding("utf-8");
		
		String str = req.getParameter("msg");
		System.out.println("전송된 문자열 : " + str);
		
		PrintWriter pw = resp.getWriter();
		
		pw.println(str);
		pw.println("ok");
		pw.close();
	}

}
