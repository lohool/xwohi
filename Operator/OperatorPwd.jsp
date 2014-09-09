<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="webwork" prefix="ww" %>
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
</HEAD>

<BODY>

<TABLE width="100%" border=0  align=center cellPadding=0 cellSpacing=8 >
  <TBODY>
    <TR>
      <TD height=30 bgColor=#FFFFFF><div align="left"></div>
          <div align="left"><span class="pt9-18"></span>
              <table width="80%" border="0" cellspacing="0" cellpadding="4">
                <tr>
                  <td width="60"><div align="center"><span class="pt9-18"><b><img src="/images/ico_arrow_title.gif" width="13" height="13"></b></span></div></td>
                  <td width="97%"><span class="pt9-18"><b><span class="title-blank-b"><span class="pt9-18"><b><span class="title-blank-b">修改操作员资料</span></b></span></span></b></span></td>
                </tr>
              </table>
        </div>
		</TD>
    </TR>
    <TR>
      <TD height=30 bgColor=#FFFFFF><div align="center">

          <TABLE cellSpacing=1 width="80%" cellPadding=1  bgColor=#999999 
            border=0>
            <TBODY>
				<ww:if test="errors!=null && errors.size()>0">
			<tr>
                <TD valign="top" bgColor=#ffffff width="100%">  
				<div align="center">
                  <TABLE WIDTH="400" BORDER=0 CELLSPACING=1 CELLPADDING=3 bgColor=#F9F9F7>
				  <tr>
				  <td>
				<br>
				<FONT SIZE="2" COLOR="red">发生错误了:
				<ww:iterator value="errors">
				<br>★<ww:property value="value"/> 
				</ww:iterator> 
				<br></FONT></br>
				</td>
				</tr>
                  </TABLE>

                </div>

			</td>
			</tr>
				</ww:if>
              <TR>
                <TD align=middle valign="top" bgColor=#ffffff width="100%">                
				<div align="center">
<ww:form name="form1" action="/operator/OperatorModPwd.action" method="POST" validate="true">
<ww:hidden name="ID"/>

                  <TABLE WIDTH="400" BORDER=0 CELLSPACING=1 CELLPADDING=3 ALIGN=center>

                    <TR BGCOLOR=E6F4FF class="pt9-18">
                      <TD width="100" bgcolor="#FFD275" CLASS=p9>原密码：</TD>
                      <TD width="70%" bgcolor="#F9F9F7" CLASS=p9><ww:textfield label="oldPwd" name="oldPwd" required="true"/> </TD>
                    </TR>
					<TR BGCOLOR=E6F4FF class="pt9-18">
                      <TD width="30%" bgcolor="#FFD275" CLASS=p9>密码： </TD>
                      <TD width="70%" bgcolor="#F9F9F7" CLASS=p9><ww:textfield  label="password" name="password" required="true"/> </TD>
                    </TR>
					<TR BGCOLOR=E6F4FF class="pt9-18">
                      <TD width="30%" bgcolor="#FFD275" CLASS=p9>密码确认： </TD>
                      <TD width="70%" bgcolor="#F9F9F7" CLASS=p9> <ww:textfield  label="password2" name="password2" required="true"/></TD>
                    </TR>

                    <TR BGCOLOR=E6F4FF class="pt9-18">
                      <TD bgcolor="#FFD275"><div align="left"><spacer type=block width=1></div></TD>
                      <TD CLASS=p9 BGCOLOR=#F9F9F7>
                        <div align="left">
                          <input name="reset" type="submit" class="botton" value="修改">
                          <INPUT name="submit" TYPE="reset" class="botton" value="重填">
                      </div>
					  </TD>
                    </TR>

                  </TABLE>
</ww:form>

                </div>
				</TD>
              </TR>
            </TBODY>
          </TABLE>

      </div>
	  
	  </TD>
    </TR>
  </TBODY>
</TABLE>

</BODY>
</HTML>
