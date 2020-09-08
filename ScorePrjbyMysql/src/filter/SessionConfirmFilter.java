package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.User;

public class SessionConfirmFilter implements Filter{

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req; 
		HttpServletResponse response = (HttpServletResponse) resp; 
		HttpSession session = request.getSession();
		vo.User user = (User)session.getAttribute("userinfo");
		
		if(user==null){
			System.out.println("SessionConfirmFilter is running, doFilter .SESSION user== null........");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/error/loginOverTime.jsp"); 
			dispatcher.forward(request, response); 
		}else{
			System.out.println("SESSION user is not null");
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig arg0) throws ServletException {

	}

}
