<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312" errorPage="errorPage.jsp"%>
<%@page import="vo.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>����Ա</title>
</head>
<body>
	<%
		request.setCharacterEncoding("gb2312");
			//session���
			User user = (User)session.getAttribute("userinfo");
			if(user==null && user.getIdentity().equalsIgnoreCase("admin")){
		response.sendRedirect("../error/loginOverTime.jsp");
			}
			else{
			String username = user.getUsersname();
	%>
			��¼�ɹ�,��ӭ<%=username %>��¼
	
	
	<%
		}
	 %>
	
	<%@ include file="/include/tail.jsp" %>
</body>
</html>