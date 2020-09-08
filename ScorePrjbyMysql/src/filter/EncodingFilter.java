package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter{
	private String encodeName;
	public void init(FilterConfig filterConfig) throws ServletException {
		this.encodeName = filterConfig.getServletContext().getInitParameter("encodeName");
		System.out.println("编码是:"+this.encodeName);
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding(this.encodeName);
		chain.doFilter(request, response);
	}
	
	public void destroy() {
		// TODO Auto-generated method stub
		
	}


}
