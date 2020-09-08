package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.User;
import dao.FunctionDao;

public class LoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("LoginServlet doGet() is Running ...");
		
		request.setCharacterEncoding("gb2312");
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String identity = request.getParameter("identity");
		
		if (account != null && password != null && account != ""
				&& password != "") {

			FunctionDao fDao = new FunctionDao();

			System.out.println(" name: " + account + ", pwd:" + password
					+ ", identity:" + identity);

			User user = fDao.getUsersFormAccountPassword(account, password,
					identity);
			

			System.out.println("doGet is running ，fDao.getUsersFormAccountPassword  user = 。" + user);
			
			if (user != null) {
				HttpSession session = request.getSession();

				System.out.println("session.setAttribute(userinfo =)" + user);
				System.out.println("getIdentity" + user.getIdentity());

				session.setAttribute("userinfo", user);
				if (user.getIdentity().equalsIgnoreCase("student")) {
					response.sendRedirect("/ScorePrj/students/studentmainframe.jsp");
				} else if (user.getIdentity().equalsIgnoreCase("teacher")) {
					response.sendRedirect("/ScorePrj/teachers/teachermainframe.jsp");
				} else if (user.getIdentity().equalsIgnoreCase("adminstrator")) {
					response.sendRedirect("/ScorePrj/adminstrators/adminstratormainframe.jsp");
				}
			} else {
				System.out.println("LoginServlet is running, doGet....user is null.");
				// forward
				ServletContext application = this.getServletContext();
				RequestDispatcher rd = application.getRequestDispatcher("/login/confirmFailure.html");
				rd.forward(request, response);
			}
		} else {
			response.sendRedirect("newlogin.jsp");
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("LoginServlet doPost() is Running ...");
		request.setCharacterEncoding("gb2312");

		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String identity = request.getParameter("identity");
		String cookietimestr = request.getParameter("cookietime");

		int cookietime = 9527;
		if (cookietimestr != null) {
			cookietime = Integer.parseInt(cookietimestr);
		}
		if (account != null && password != null && account != ""
				&& password != "") {

			FunctionDao fDao = new FunctionDao();

			// ����疯�����存�����烽��ゆ�
			System.out.println("LoginServlet doPost .account:" + account + ",password:" + password
					+ ",cookietime:" + cookietime + ",identity:"
					+ identity);
			User user = fDao.getUsersFormAccountPassword(account, password,
					identity);
			
			System.out.println("user == null:" + (user == null));
			
			if (user != null) {
				System.out.println("user identity:" + (user.getIdentity()));
				System.out.println("user name:" + (user.getUsersname()));
				
				HttpSession session = request.getSession();
				session.setAttribute("userinfo", user);
				if (cookietime != 9527) {
					System.out.println("cookie :" + cookietime);
					// ����烽�锟�OKIES
					Cookie accountCookie = fDao.createCookie(
							"neoScoreSystemAccount", account, cookietime);
					Cookie passwordCookie = fDao.createCookie(
							"neoScoreSystemPassword", password, cookietime);
					Cookie identityCookie = fDao.createCookie(
							"neoScoreSystemIdentity", identity, cookietime);
					System.out.println("accountCookie"
							+ accountCookie.getPath() + ",  passwordCookie"
							+ passwordCookie.getPath() + ",  identityCookie"
							+ identityCookie.getPath());
					response.addCookie(accountCookie);
					response.addCookie(passwordCookie);
					response.addCookie(identityCookie);
					// ����烽�锟�OKIES
				}
				if (user.getIdentity().equalsIgnoreCase("student")) {
					response.sendRedirect("/ScorePrj/students/studentmainframe.jsp");
				} else if (user.getIdentity().equalsIgnoreCase("teacher")) {
					response.sendRedirect("/ScorePrj/teachers/teachermainframe.jsp");
				} else if (user.getIdentity().equalsIgnoreCase("adminstrator")) {
					response.sendRedirect("/ScorePrj/adminstrators/adminstratormainframe.jsp");
				}
			} else {
				// forward 
				System.out.println("user is null.");
				
				ServletContext application = this.getServletContext();
				RequestDispatcher rd = application
						.getRequestDispatcher("/login/confirmFailure.html");
				rd.forward(request, response);
			}
		} else {
			response.sendRedirect("newlogin.jsp");
		}

	}

	public void init() throws ServletException {
		// Put your code here
	}

}
