<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312" errorPage="/error/errorPage.jsp"%>
<%@page import="vo.User"%>
<%@page import="dao.TeacherDao"%>
<%@page import="vo.Course"%>
<%@page import="vo.Score"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>教师</title>
</head>
<body>
	<%request.setCharacterEncoding("gb2312");
			//session检查
		User user = (User)session.getAttribute("userinfo");
		String action = request.getParameter("action");
		String couno = request.getParameter("couno");
		TeacherDao tDao = new TeacherDao();
		ArrayList scores = tDao.queryCourseScore(couno,user.getUsersaccount());
		
		if(action.equals("submit")){
			String[] stunos = request.getParameterValues("stunos");
			String[] subscores = request.getParameterValues("scores");
			String   commit = request.getParameter("commit");
			boolean success = tDao.setCourseScore(couno,stunos,subscores);
			if(!success){
			%>
			<font color="red">提交失败,请确认格式正确</font><BR>
			<%
			}else{
			System.out.println("分数设置成功");
			if(commit.equals("yes")){
			tDao.setCourseScoreCommitted(couno,stunos);
			}
			}
			response.sendRedirect("/ScorePrj/teachers/setscore.jsp?couno="+couno+"&action=queryscore");
		}
		
	%>
		课程号码为:(<%=couno %>)的成绩修改界面
		<%if(!scores.isEmpty()){ %>
		<form action="setscore.jsp?action=submit&couno=<%=couno %>" method="post">
	 	<input type="hidden" value="<%=couno %>">
		<table>
		<tr>
			<th>学号</th>
			<th>姓名</th>
			<th>分数</th>
		</tr>
		
	<%	for(int i=0;i<scores.size();i++){
		Score socre = (Score)scores.get(i);
		%>
		<tr>
			<td><%=socre.getStuno() %><input type="hidden" name="stunos" value="<%=socre.getStuno() %>"></td>
			<td><%=socre.getStuname() %></td>
			<td><input type="text" name="scores" value="<%=socre.getScore() %>"></td>
		</tr>
		<%
	}
		
	 %>
	 </table>
	 <%
	 Score tempScore =(Score)scores.get(0);
	 System.out.println(tempScore.getChangeable());
	 if(tempScore.getChangeable().equals("yes")){
	 %>
     <input class="radio" type="radio" name="commit" value="no" tabindex="12" checked="checked" />暂存
     <input class="radio" type="radio" name="commit" value="yes" tabindex="12"/>提交(<font color="red">提交后不能修改</font>)
	 <input type="submit" value="确定">
	  <%
	 }
	 %>
	 </form>
	 <%
	 } 
	 %>
	<%@ include file="/include/tail.jsp" %>
</body>
</html>