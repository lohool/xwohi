<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="webwork" prefix="ww" %>
<!DOCTYPE html>
<html>
<head runat="server">
<title>会员管理登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="login/css/login.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div class="login-panel">
    <table class="login-context">
        <tr>
            <td width="400" align="center">
            </td>
            <td align="center">
                <table>
                    <tr>
                        <td height="40" align="center"><img src ="login/images/login_tit.png" alt="logo"/></td>
                    </tr>
                </table>
                <ww:form name="form1"  action="/Login.action" method="POST"  theme="my_simple">
				
				<table >
				    <tr>
					 <td colspan=2>
					 <ww:property value="errors.class"/>
						<ww:if test="errors!=null && errors.size()>0">
						<FONT SIZE="2" COLOR="red">
						<ww:iterator value="errors">
						<ww:property value="getText(value[0])" /> <br>
						</ww:iterator> 
						</FONT>
						</ww:if>
					 <!--
						<hr width="80%">
						<ww:if test="actionErrors != null">
						<ww:property value="actionErrors" />
						</ww:if>
					-->
					 </td>
				    </tr>
                    <tr>
                        <td width="80" height="35" align="right">帐 号：</td>
                        <td align="left"><ww:textfield   name="account"  style="width:120px;" /></td>
                    </tr>
                    <tr>
                        <td width="80" height="35" align="right">密 码：</td>
                        <td align="left"><ww:password  name="password"  required="true" style="width:120px;"/></td>
                    </tr>
                    <tr>
                        <td width="80" height="35" align="right">验证码：</td>
                        <td align="left" valign="middle">
                            <table >
                                <tr>
                                    <td  align="left" width="80px">
                                        <input type="text" id="txtVerifyInput" maxlength="4" class="verify-input" runat="server" >
                                    </td>
                                    <td align="left" valign="middle">
                                        <a href="javascript:void(0);" onclick="window.refresh_verify_code()">
                                            <img id="imgVerifyCode" src="login/images/VerifyCode.jpg" alt="验证码" width="60" height="25" title="验证码不区分大小写，点击刷新" /><ww:token />
                                        </a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td width="80" height="35" align="right"></td>
                        <td align="left"><a href="index.html"><input type="submit" value="登 录" class="btn-login"></a></td>
                    </tr>
                </table>
				</ww:form>
            </td>
        </tr>
    </table>
</div>

</body>
</html>