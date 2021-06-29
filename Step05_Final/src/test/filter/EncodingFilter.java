package test.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

// 이프로젝트의 모든 페이지에서 동작하도록 한다.
@WebFilter("/*")
public class EncodingFilter implements javax.servlet.Filter{
	private String encoding;

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	// 필터가 동작할때 마다 호출된다.
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("encodingFilter doFilter()");
		
		//1. 만일 인코딩 설정되지 않았다면
		if(request.getCharacterEncoding()==null) {
			// post 방식 전송시 한글 깨지지 안도록 설정
			request.setCharacterEncoding(this.encoding);
		} // 이때 필터가 종료되어서 doFilter 메소드를 사용해야 한다.
		
		// 2. 요청의 흐름 계속 이어가기
		chain.doFilter(request, response);
		// doFilter는 filter의 흐름을 계속 이어가게 한다.
		
		
	}

	// 필터가 최초 사용될때 1번만 호출된다.
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		/*
		 <init-param>
	        <param-name>encoding</param-name>
	        <param-value>utf-8</param-value>
     	</init-param>
     	
     	web.xml 에 위와 같이 설정된 초기화 파라미터 값을 읽어오기
		 */
		this.encoding = filterConfig.getInitParameter("encoding");
	}
	
}
