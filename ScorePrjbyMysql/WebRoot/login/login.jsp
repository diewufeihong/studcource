<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312" errorPage="/error/errorPage.jsp"%>
<html>
<head>
<title>NEO系统登陆界面</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
body {
	background-color: #1E639E;
}
.STYLE1 {color: #FFFFFF}
#Layer1 {
	position:absolute;
	width:246px;
	height:174px;
	z-index:1;
	left: 179px;
	top: 9px;
}
#Layer2 {
	position:absolute;
	width:200px;
	height:115px;
	z-index:1;
	left: 261px;
	top: 15px;
}
#Layer3 {
	position:absolute;
	width:200px;
	height:115px;
	z-index:1;
	left: 18px;
	top: -2px;
}
-->
</style></head>

<body>
<table width="774" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="774"><img src="/ScorePrj/login/biaoti.jpg" width="837" height="201"></td>
  </tr>
</table>
<table width="837" border="0" align="center">
  <tr>
    <td height="30"><span class="STYLE1">
    <marquee behavior="scroll" onMouseOver="this.stop()" onMouseOut="this.start()">欢迎光临教学管理系统，感谢您的支持！！</marquee></span></td>
  </tr>
</table>
<%	System.out.println(request.getRemoteAddr()+ " is running login.jsp..."); %>
<table width="876" height="57" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="477"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="477" height="250">
          <param name="movie" value="huamian.swf">
          <param name="quality" value="high">
          <embed src="/ScorePrj/login/huamian.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="477" height="250"></embed>
        </object></td>
        <td width="424" bgcolor="#FFFFFF"><form method="post" name="login" action="/ScorePrj/servlet/LoginServlet">
          <p> &nbsp;&nbsp;&nbsp;&nbsp;账号
            <input type="text" id="account" name="account" size="25" tabindex="5" maxlength="40" align="left"/>
</p>
          <p>      <br>
          &nbsp;&nbsp;&nbsp;&nbsp;密码
            <input type="password" id="label" name="password" size="25" tabindex="5" maxlength="40"/>&nbsp;</p>
          <p><br>
          &nbsp;&nbsp;&nbsp;&nbsp;登陆类型
            <select id="identity" name="identity" tabindex="6">
                  <option value="student">学生</option>
                  <option value="teacher">教师</option>
                  <option value="adminstrator">管理员</option>
            </select>
          </p>
          <p><br>
          &nbsp;&nbsp;&nbsp;&nbsp;登录有效期
            <input class="radio" type="radio" name="cookietime" value="315360000" tabindex="8"  />
          永久
          <input class="radio" type="radio" name="cookietime" value="2592000" tabindex="9"  />
          一个月
          <input class="radio" type="radio" name="cookietime" value="86400" tabindex="10"  />
          一天
          <input class="radio" type="radio" name="cookietime" value="3600" tabindex="11"  />
          一小时
          <input class="radio" type="radio" name="cookietime" value="0" tabindex="12" checked="checked" />
          浏览器进程<br>
          </p>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="submit" value="登录">
        </form></td>
      </tr>
</table>
	<div id="Layer1">
	  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="342" height="187">
        <param name="movie" value="12.swf">
        <param name="quality" value="high">
        <param name="wmode" value="transparent">
        <embed src="/ScorePrj/login/12.swf" width="342" height="187" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed>
      </object>
	  <div id="Layer2">
	    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="421" height="226">
          <param name="movie" value="31.swf">
          <param name="quality" value="high">
          <param name="wmode" value="transparent">
          <embed src="31.swf" width="421" height="226" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed>
        </object>
	    <div id="Layer3">
	      <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="301" height="175">
            <param name="movie" value="10.swf">
            <param name="quality" value="high">
            <param name="wmode" value="transparent">
            <embed src="/ScorePrj/login/10.swf" width="301" height="175" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed>
          </object>
	    </div>
	  </div>
	</div>
	<%@ include file="/include/tail.jsp" %>
</body>
</html>