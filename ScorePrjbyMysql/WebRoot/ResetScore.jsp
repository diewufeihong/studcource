<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gb2312" errorPage="errorPage.jsp"%>

<html>
  <head>

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
  
  <body onLoad="MM_preloadImages('xiugai.jpg')">
	<table width="200" border="1">
      <tr>
        <td><img src="haishui.jpg" width="1000" height="400"></td>
      </tr>
    </table>
	<H3>&nbsp;</H3>
			
  <div align="left">
    <%
			request.setCharacterEncoding("gb2312");
			
			String stuno = request.getParameter("stuno");
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection conn = DriverManager.getConnection("jdbc:odbc:DSSchool","scott","tiger");
			Statement stat = conn.createStatement();
			
			String[] scores = request.getParameterValues("score");
			String[] sconos = request.getParameterValues("scono");
			String[] types = request.getParameterValues("type");
			if(sconos!=null){
				for(int i = 0; i < scores.length ; i++){
					stat.executeUpdate("UPDATE ���Գɼ�  SET ����="+ scores[i] +" WHERE ѧ��='"+ stuno +"' AND �γ̴���='"+ sconos[i] +"' AND ����='"+ types[i] +"'");
					}
			out.print("�޸����");
			}
			
			ResultSet rs = stat.executeQuery("SELECT K.�γ̴���, X.����,K.����,K.����, S.�̲�  FROM ���Գɼ� K JOIN ѧ�� X ON X.ѧ��=K.ѧ�� JOIN ���пγ� S ON S.�γ̺���=K.�γ̴��� WHERE K.ѧ��='"+ stuno +"'");
		 %>
    ѧ��"<%=stuno %>"�ɼ��޸� </div>
			  <form action="" method="post">
		 <table align="center">
		 <tr>
		 	<th>��Ŀ</th>
		 	<th>����</th>
		 	<th>����</th>
		 	<th></th>		 
		 </tr>
		<%
		while(rs.next()){
		String scono = rs.getString("�γ̴���");
		String type = rs.getString("����");
			%>
			<tr>
				<td><%=rs.getString("�̲�") %></td>
				<td>type</td>
				<td><input type="text" name="score" value="<%=rs.getString("����") %>"></td>
				<td><input type="hidden" name="scono" value="<%=scono %>"> <input type="hidden" name="type" value="<%=type %>"></td>
			</tr>			
			<%	
		}
		
		 %>
		 </table>
		 <div align="center">
		   <input type="submit" value="�޸�">
		   <a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','xiugai.jpg',1)"><img src="xiug0.jpg" name="Image2" width="160" height="72" border="0"></a>
		   </div>
		 </form>
</body>
</html>
