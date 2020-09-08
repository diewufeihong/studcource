<%@ page language="java" import="java.util.*" pageEncoding="gb2312" isErrorPage="true" %>
<html>
  <head>

  <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  <style type="text/css">
<!--
#Layer1 {
	position:absolute;
	width:200px;
	height:115px;
	z-index:1;
}
#Layer2 {
	position:absolute;
	width:540px;
	height:469px;
	z-index:1;
	left: 289px;
	top: 70px;
	background-color: #FFFFFF;
	background-image: url(board.jpg);
}
.STYLE1 {font-size: xx-large}
body {
	background-color: #FFFFFF;
}
#Layer3 {
	position:absolute;
	width:200px;
	height:115px;
	z-index:1;
	left: 56px;
	top: 79px;
}
-->
  </style>
  </head>
  
   <body>
	<H1>&nbsp;</H1>
			
   <div id="Layer2">
              <table width="342" height="402" border="1" align="center">
                <tr>
                  <td height="219"><div align="center">
                    <p class="STYLE1">&nbsp;</p>
                    <p align="right" class="STYLE1"><font color='red'>出错啦!</font></p>
                  </div></td>
                </tr>
                <tr>
                  <td height="154"><div align="center"><a href="<%=request.getContextPath()%>/login/login.jsp">操作错误,点我回到登陆界面!</a>&nbsp;</div></td>
                </tr>
              </table>
              <div id="Layer3">
                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="242" height="201">
                  <param name="movie" value="san.swf">
                  <param name="quality" value="high">
                  <param name="wmode" value="transparent">
                  <embed src="san.swf" width="242" height="201" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed>
                </object>
              </div>
              <p>&nbsp;</p>
              <div align="center"></div>
   </div>
</body>
</html>
