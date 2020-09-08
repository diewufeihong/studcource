<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312" errorPage="/error/errorPage.jsp"%>
<%@page import="vo.User"%>
<%@page import="dao.StudentDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ñ§Éú</title>
</head>
<body>
		<%
			//session¼ì²é
			User user = (User)session.getAttribute("userinfo");
			String action = request.getParameter("action");
			if(action.equalsIgnoreCase("choicecourse")){
				String[] counos = request.getParameterValues("couno");
				String stuno = user.getUsersaccount();
				StudentDao sDao = new StudentDao();
				for(int i=0 ; i< counos.length;i++){
				sDao.choiceCourse(stuno,counos[i]);
				}				
				 %>	
				<jsp:forward page="choicecourse.jsp"></jsp:forward>
				 <%
				}
	 %>
	

</body>
</html>