<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="java.io.*" %>
<html>
<head>
<title>系统错误-数据库错误</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #CC3300}
-->
</style></head>
<body topmargin="0" leftmargin="0">
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="middle"><div align="center">
      <table width="350" height="91"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="146"><div align="center"><img src="/images/error.jpg" width="146" height="91"></div></td>
          <td width="173" bgcolor="#FFAE38"><div align="center" class="title-blank-b">对不起！系统发生错误，请联系管理员。
		  <br><%=((Exception)request.getAttribute("action.exception")).toString()%></div></td>
          <td width="10" bgcolor="#FE9900"><div align="right"><img src="/images/right1.gif" width="44" height="91"></div></td>
        </tr>
		<tr>
          <td colspan=3>
		  <%
		  Exception ex=(Exception)request.getAttribute("action.exception");
		  ex.printStackTrace(new PrintWriter(out));
		  %>
		  </td>
        </tr>
      </table>
    </div></td>
  </tr>
</table>
</body>
</html>
