<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<html>
<head>
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>

<body leftmargin="0" topmargin="0" >
<div class="page">
<div id="pageTitle">
<TABLE width="100%" height="30"  cellspacing="0" cellpadding="0" id="title-table">
<thead>
<TR>
	<TD>
	<span class="pageTitle-left">
	<img height="13" width="13" src="/images/ico_arrow_title.gif">
	<xwohi:i18n text="Privilege.list"/>
	</span>
	<span class="pageTitle-right" >
	<a href="/Privilege/PrivilegeInput.action"><xwohi:i18n text="new"/></a>
	</span>
	</TD>
</TR>
</thead>
</TABLE>

</div>
<table width="100%" cellspacing="0" id="sort-table" class="sort-table">
<thead>
<tr height="30px">
<td><xwohi:i18n text="Privilege.name" /></td>
<td><xwohi:i18n text="Privilege.resource" /></td>
<td><xwohi:i18n text="Privilege.url" /></td>
<TD width="30"><xwohi:i18n text="delete" /></TD>
<TD width="30"><xwohi:i18n text="modify" /></TD>
</tr>
</thead>
<tbody>
<ww:iterator value="objList">
<TR height="20" valign="middle">
<td>
			<ww:property value="name"/>
			</td><td>
			<ww:property value="resource.name"/>
			</td><td>
			<ww:property value="url"/>
			</td><TD>
			<a href="javascript:doDelete('<ww:property value="privilegeID"/>')"><img src="/images/delete.gif" border="0" alt="<xwohi:i18n text="delete" />"></a>
			</TD><TD>
			<a href="javascript:doLoad('<ww:property value="privilegeID"/>')"><img src="/images/detail.gif" border="0" alt="<xwohi:i18n text="modify" />"></a>
			</TD>
</TR>
</ww:iterator>
</tbody>
</table>
<ww:property value="paginateView" escape="false"></ww:property>
</div>
<form name="form1" action="/Privilege/PrivilegeList.action">
<ww:hidden name="page"></ww:hidden>
<ww:hidden name="pageSize"></ww:hidden> 
	<ww:hidden name="vo.privilegeID" /> 
</form>

</body>
</html>
