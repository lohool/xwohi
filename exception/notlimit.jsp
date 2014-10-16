<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8>
<link href="/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #CC3300}
-->
</style></head>
<body topmargin="0" leftmargin="0">
<center>
<table  height="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="middle"><div align="center">
      <table height="91"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="146"><div align="center"><img src="/images/error.jpg" width="146" height="91"></div></td>
          <td width="173" bgcolor="#FFAE38">
		  <div align="center" class="title-blank-b">
		  已登录用户没有该功能使用权限，如要使用，请联系系统管理员。
		  </div></td>
        </tr>
		<tr>
          <td colspan=3>
		  <%
		  //Exception ex=(Exception)request.getAttribute("action.exception");
		  //ex.printStackTrace(out);
		  %>
		  </td>
        </tr>
      </table>
    </div></td>
  </tr>
</table>
</body>
</html>
