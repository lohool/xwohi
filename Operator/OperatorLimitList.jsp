
<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="webwork" prefix="ww" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>操作员权限管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
}
-->
</style>
<link href="/css.css" rel="stylesheet" type="text/css">
</head>

<body>
<TABLE width="100%" border=0 
                  align=center cellPadding=0 cellSpacing=8 >
  <TBODY>
    <TR>
      <TD height=30 bgColor=#FFFFFF><div align="left"></div>
        <div align="left"><span class="pt9-18"></span>
              <table width="80%" border="0" cellspacing="0" cellpadding="4">
                <tr>
                  <td width="60"><div align="center"><span class="pt9-18"><b><img src="/images/ico_arrow_title.gif" width="13" height="13"></b></span></div></td>
                  <td width="97%"><span class="pt9-18"><b><span class="title-blank-b">操作员管理&gt;&gt;操作员权限管理</span></b></span></td>
                </tr>
              </table>
      </div></TD>
    </TR>
    <TR>
      <TD height=30 bgColor=#FFFFFF><div align="center">
        <TABLE cellSpacing=1 cellPadding=1 width="100%" bgColor=#999999 
            border=0>
          <TBODY>
            <TR>
              <TD align=middle valign="top" bgColor=#ffffff>
                <FORM METHOD=POST ACTION="OperatorLimitModify.action">
				<INPUT TYPE="hidden" NAME="id; value="<ww:property value="id;/>">
                  <TABLE cellSpacing=1 cellPadding=2 width="100%" 
                  align=center border=0>
                    <THEAD>

                      <TR bgcolor="#FFD275" class="pt9-18">
                        <TD align=middle><div align="center" class="style3"></div></TD>
                        <TD align=middle><div align="center" class="style3">ID</div></TD>
                        <TD align=middle><div align="center" class="style3">权限</div></TD>
                      </TR>
                    </THEAD>

                    <TBODY>
					<ww:iterator value="objList" >

                      <TR bgcolor="#F9F9F7" class="pt9-18">
                        <TD align=middle class="pt9-18"><INPUT TYPE="checkbox" NAME="limitID" value="<ww:property value="sysLimitID"/>" <ww:if test="isAuthorize==true"> checked</ww:if>></TD>
                        <TD align=middle bgcolor="#F9F9F7" class="pt9-18"><ww:property value="sysLimitID"/></TD>
                        <TD align=middle bgcolor="#F9F9F7" class="pt9-18"><ww:property value="limitName"/></TD>
                        <TD align=middle bgcolor="#F9F9F7" class="pt9-18"><ww:property value="opName"/></TD>
                      </TR>
					</ww:iterator>

                      <TR bgcolor="#FFD275" class="pt9-18">
                        <TD align=middle colspan="3"><INPUT TYPE="submit" value="授权"><INPUT TYPE="reset" value="重选"></TD>
                      </TR>

                    </TBODY>
                  </TABLE>
              </FORM>
			  
			  </TD>
            </TR>
          </TBODY>
        </TABLE>
      </div></TD>
    </TR>
  </TBODY>
</TABLE>
<script>
function onDelete()
{
	var r=confirm("您确定要删除该操作员吗？");
	if(r)
	{
		return true;
	}
	else return false;
}
</script>
</body>
</html>
