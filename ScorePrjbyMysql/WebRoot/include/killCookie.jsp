<%@ page language="java" import="java.util.*" pageEncoding="gb2312" errorPage="/error/errorPage.jsp"%>
<%@page import="dao.FunctionDao"%>
<%@page import="dao.StudentDao"%>
<%@page import="vo.User"%>
<%@page import="servlets.KillCookies"%>
<html>
  <head> </head>  
  <title>kill</title>
  <body>
	<%
				KillCookies kc = new KillCookies();
				kc.doGet(request,response);
	%>
	<script>history.back();</script>
  </body>
</html>
