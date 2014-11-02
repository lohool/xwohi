<%@ page contentType="text/html; charset=utf-8" %>
<center>
<table  height="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="middle"><div align="center">
      <table height="91"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="146"><div align="center"><img src="/images/error.jpg" width="146" height="91"></div></td>
          <td width="173" bgcolor="#FFAE38">
		  <div align="center" class="title-blank-b" style="border:0px;">
		  当前用户没有登录系统或无该功能使用权限，请重新登录或联系系统管理员。
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
