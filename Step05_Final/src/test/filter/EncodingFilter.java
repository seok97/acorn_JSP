package test.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*")
public class EncodingFilter implements javax.servlet.Filter{
	private String encoding;

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("encodingFilter doFilter()");
		
		//1. 留뚯씪 �씤肄붾뵫 �꽕�젙�릺吏� �븡�븯�떎硫�
		if(request.getCharacterEncoding()==null) {
			// post 諛⑹떇 �쟾�넚�떆 �븳湲� 源⑥�吏� �븞�룄濡� �꽕�젙
			request.setCharacterEncoding(this.encoding);
		} // �씠�븣 �븘�꽣媛� 醫낅즺�릺�뼱�꽌 doFilter 硫붿냼�뱶瑜� �궗�슜�빐�빞 �븳�떎.
		
		// 2. �슂泥��쓽 �쓲由� 怨꾩냽 �씠�뼱媛�湲�
		chain.doFilter(request, response);
		// doFilter�뒗 filter�쓽 �쓲由꾩쓣 怨꾩냽 �씠�뼱媛�寃� �븳�떎.
		
		
	}

	// �븘�꽣媛� 理쒖큹 �궗�슜�맆�븣 1踰덈쭔 �샇異쒕맂�떎.
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		/*
		 <init-param>
	        <param-name>encoding</param-name>
	        <param-value>utf-8</param-value>
     	</init-param>
     	
     	web.xml �뿉 �쐞�� 媛숈씠 �꽕�젙�맂 珥덇린�솕 �뙆�씪誘명꽣 媛믪쓣 �씫�뼱�삤湲�
		 */
		this.encoding = filterConfig.getInitParameter("encoding");
	}
	
}
