package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookiesLoginFilter implements Filter{

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		/*Ҫ�ڲ�ͬ�����ж�ȡCookie,�����ڱ���ʱ��setPath("/"),��ʾ��Cookie�ڴ���վͨ��
		 * ��ȡʱ��ҲҪsetPath("/")*/
		System.out.println("CookiesdoFilter:");
		HttpServletRequest request = (HttpServletRequest) req; 
		HttpServletResponse response = (HttpServletResponse) resp; 
		Cookie[] cookies = request.getCookies();
		if(cookies==null){
			cookies = new Cookie[1];
			cookies[0]= new Cookie("neoScoreSystemAccount","");
		}
		String cookieaccount = null;
		String cookiepassword = null;
		String cookieidentity = null;
		for(int i=0;i<cookies.length;i++){
		 			Cookie c = cookies[i];
		 			c.setPath("/");
		 			if(c.getName().equals("neoScoreSystemAccount")){
		 				cookieaccount = c.getValue();
		 			}
		 			else if(c.getName().equals("neoScoreSystemPassword")){
		 				 cookiepassword = c.getValue();
		 			}
		 			else if(c.getName().equals("neoScoreSystemIdentity")){
		 				 cookieidentity = c.getValue();
		 			}
	   	 		}
		if(cookieaccount != null && cookiepassword != null && cookieidentity!=null){
			response.sendRedirect("/ScorePrj/servlet/LoginServlet?account="+ cookieaccount +"&password="+cookiepassword +"&identity="+cookieidentity);
			}
		chain.doFilter(request, response);
	}

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
