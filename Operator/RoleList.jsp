<%@ page contentType="text/html; charset=gb2312" %>
<%@ taglib uri="webwork" prefix="ww" %>
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
	<xwohi:i18n text="Role.list"/>
	</span>
	<span class="pageTitle-right" >
	<a href="/Role/RoleInput.action"><xwohi:i18n text="new"/></a>
	</span>
	</TD>
</TR>
</thead>
</TABLE>

</div>

<table width="100%" cellspacing="0" id="sort-table" class="sort-table">
<thead>
<tr height="30">
<td><xwohi:i18n text="Role.name" /></td><td><xwohi:i18n text="Role.description" /></td>
<TD width="30"><xwohi:i18n text="delete" /></TD><TD width="30"><xwohi:i18n text="modify" /></TD>
</tr>
</thead>
<tbody>
<ww:iterator value="objList">
<TR height="20" valign="top">
<td>
			<ww:property value="name"/>
			</td><td>
			<ww:property value="description"/>
			</td>
			<TD>
			<a href="javascript:doDelete('<ww:property value="roleID"/>')"><img src="/images/delete.gif" border="0" alt="<xwohi:i18n text="delete" />"></a>
			</TD><TD>
			<a href="javascript:doLoad('<ww:property value="roleID"/>')"><img src="/images/detail.gif" border="0" alt="<xwohi:i18n text="modify" />"></a>
			</TD>
</TR>
</ww:iterator>
</tbody>
</table>
<ww:property value="paginateView" escape="false"></ww:property>
</div>
<form name="form1" action="/Role/RoleList.action">
<ww:hidden name="page"></ww:hidden>
<ww:hidden name="pageSize"></ww:hidden> 
	<ww:hidden name="vo.roleID" /> 
</form>

<script type="text/javascript">

function doDelete(n)
{
	var r=confirm("<xwohi:i18n text="Are you realy to delete it?" />");
	if(r)
	{
		form1.action="RoleDelete.action";
		form1["vo.roleID"].value=n;
		form1.submit();
	}
}
function doLoad(n)
{
		form1.action="RoleInfoTab.jsp";
		form1["vo.roleID"].value=n;
		form1.submit();
}


</script>
