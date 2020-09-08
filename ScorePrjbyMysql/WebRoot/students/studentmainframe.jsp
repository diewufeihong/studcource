<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@page import="vo.User"%>
<%@page import="vo.Score"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>学生</title>
</head>
<body>
	<%
			vo.User user = (User)session.getAttribute("userinfo");
			String username = user.getUsersname();
			System.out.println("studentsmainframe is running...username:"+username);
	%>
			登录成功,欢迎<%=username %>登录
	<%	
			StudentDao sDao = new StudentDao();
			ArrayList stuscos = sDao.queryScore(user.getUsersaccount());
			if(stuscos.isEmpty()){
			System.out.println("跳至选课页面");
			%>
			 <jsp:forward page="choicecourse.jsp"></jsp:forward>
			<%
			}
			else{
			%>
			<a href="choicecourse.jsp">选课</a><BR>
			<table border="2" bgColor="#ff8000">
			<tr>
				<th>科目</th>
				<th>分数</th>
			</tr>
			<%
			for(int i=0 ; i<stuscos.size();i++){
			Score score = (Score)stuscos.get(i);
			if(score.getScore()!=null && score.getCoursename()!=null){
				%>
				<tr>
					<td><%= score.getCoursename() %></td>
					<td>
					<%if(score.getChangeable().equals("no")){%>
					<%= score.getScore()%>
					<%}else{
					%>分数正在发布<%
					}%>
					</td>
				</tr>
				<%
				}
			}
			}
		
	 %>
	</table>
	<%@ include file="/include/tail.jsp" %>
</body>
</html>