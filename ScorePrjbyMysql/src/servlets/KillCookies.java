package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FunctionDao;

public class KillCookies extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		FunctionDao fDao = new FunctionDao();				
		Cookie accountCookie = fDao.createCookie("neoScoreSystemAccount","",0);
		Cookie passwordCookie = fDao.createCookie("neoScoreSystemPassword","",0);
		response.addCookie(accountCookie);
		response.addCookie(passwordCookie);	
	}

}
