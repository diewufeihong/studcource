<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312" errorPage="/error/errorPage.jsp"%>
<%@page import="vo.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>管理员</title>
</head>
<body>
	<%

			User user = (User)session.getAttribute("userinfo");

			String username = user.getUsersname();
	%>
			登录成功,欢迎<%=username %>登录
	
	
	<%
		
	 %>
	
	<%@ include file="/include/tail.jsp" %>
</body>
</html>