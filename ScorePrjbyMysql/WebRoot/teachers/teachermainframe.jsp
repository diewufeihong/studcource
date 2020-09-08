<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312" errorPage="/error/errorPage.jsp"%>
<%@page import="vo.User"%>
<%@page import="dao.TeacherDao"%>
<%@page import="vo.Course"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>½ÌÊ¦</title>
</head>
<body>
	<%
			//session¼ì²é
			User user = (User)session.getAttribute("userinfo");
			String username = user.getUsersname();
			System.out.println("teachersmainframe is running...username:"+username);
	%>
		µÇÂ¼³É¹¦,»¶Ó­<%=username %>µÇÂ¼
		<table>
			<tr>
				<th>Ëù½Ì¿Î³Ì</th>
			</tr>
	<%
		TeacherDao tDao = new TeacherDao();
		ArrayList courses = tDao.queryTeachCourse(user.getUsersaccount());
		for(int i=0;i<courses.size();i++){
		Course course = (Course)courses.get(i);
			 %>
			 <tr>
			 <td><a href="setscore.jsp?couno=<%=course.getCourseno() %>&action=queryscore"><%=course.getCoursename() %></a></td>
			 </tr>
			 <%
		}
	 %>
	 </table>
	<%@ include file="/include/tail.jsp" %>
</body>
</html>