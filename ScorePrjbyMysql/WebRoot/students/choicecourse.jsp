<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312" %>
<%@page import="vo.User"%>
<%@page import="vo.Course"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ñ§ÉúÑ¡¿Î</title>
<script type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</head>
<body onLoad="MM_preloadImages('anniu0.jpg')">
	<% 
			//session¼ì²é 
			User user = (User)session.getAttribute("userinfo"); 
			String username = user.getUsersname(); 
	%>
	<table width="200" border="1">
      <tr>
        <td><img src="xuanke.jpg" width="1000" height="400"></td>
      </tr>
    </table>
<form action="studentsfunction.jsp?action=choicecourse" method="post">
	<table>
	<tr>
		<th>¿ÆÄ¿´úºÅ</th>
		<th>¿ÆÄ¿Ãû³Æ</th>
		<th>¿ÆÄ¿½ÌÊ¦</th>
		<th>Ñ¡Ôñ</th>
	</tr>
	<%
		StudentDao sDao = new StudentDao();
		ArrayList courses = sDao.getCourses();
		ArrayList choicedcourses = sDao.getChoicedCourses(user.getUsersaccount());
		for(int i=0 ; i<courses.size();i++){
			Course course = (Course)courses.get(i);
			boolean typed = false;
			%> 
			<tr>
				<td><%= course.getCourseno() %></td>
				<td><%= course.getCoursename() %></td>
				<td><%= course.getTeachername() %></td>
				<td><%	
				for(int j=0;j<choicedcourses.size();j++){
						Course choicedcourse = (Course)choicedcourses.get(j);
						System.out.println("Î´Ñ¡:"+course.getCourseno()+"    ÒÑÑ¡:"+choicedcourse.getCourseno());
						if(course.getCourseno().equals(choicedcourse.getCourseno())){
						typed=true;
						%> 	
						ÒÑÑ¡
						<%
						}
				}
				if(typed==false){
				%> 
				<input type="checkbox" name="couno" value="<%=course.getCourseno() %>">
				<%
				}
				%></td>
			</tr>
			<%
		}
	 %>
  </table>
	 	<div align="center">
	 	  <input type="image"  onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','anniu0.jpg',1)" src="anniu.jpg" name="Image2" width="160" height="72" border="0">
        </div>
</form>
	 
	<%@ include file="/include/tail.jsp" %>
</body>
</html>