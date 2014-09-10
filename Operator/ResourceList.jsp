<%@ page contentType="text/html; charset=gb2312" %>
<%@ taglib uri="webwork" prefix="ww" %>
<html>
<head>
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
	<xwohi:i18n text="Resource.list"/>
	</span>
	<span class="pageTitle-right" >
	<a href="/Resource/ResourceInput.action"><xwohi:i18n text="new"/></a>
	</span>
	</TD>
</TR>
</thead>
</TABLE>

</div>
<table width="100%" cellspacing="0" id="sort-table" class="sort-table">
<thead>
<tr>
<td><xwohi:i18n text="Resource.name" /></td>
<td><xwohi:i18n text="Resource.nameCode" /></td>
<td><xwohi:i18n text="Resource.description" /></td>
<td><xwohi:i18n text="Resource.userType" /></td>
<TD width="30"><xwohi:i18n text="delete" /></TD><TD width="30"><xwohi:i18n text="modify" /></TD>
</tr>
</thead>
<tbody>
<ww:iterator value="objList">
<TR>
<td>
			<ww:property value="getText(name)"/>
			</td>
<td>
			<ww:property value="name"/>
			</td>
			
			<td>
			<ww:property value="description"/>&nbsp;
			</td><td>
			<ww:property value="userType"/>
			</td><TD>
			<a href="javascript:doDelete('<ww:property value="resourceID"/>')"><img src="/images/delete.gif" border="0" alt="<xwohi:i18n text="delete" />"></a></TD><TD>
			<a href="javascript:doLoad('<ww:property value="resourceID"/>')"><img src="/images/detail.gif" border="0" alt="<xwohi:i18n text="modify" />"></a></TD>
</TR>
</ww:iterator>
</tbody>
</table>
<ww:property value="paginateView" escape="false"></ww:property>
</div>
<form name="form1" action="/Resource/ResourceList.action">
<ww:hidden name="page"></ww:hidden>
<ww:hidden name="pageSize"></ww:hidden> 
	<ww:hidden name="vo.resourceID" /> 
</form>

<script type="text/javascript">

function doDelete(n)
{
	var r=confirm("<xwohi:i18n text="Are you realy to delete it?" />");
	if(r)
	{
		form1.action="ResourceDelete.action";
		form1["vo.resourceID"].value=n;
		form1.submit();
	}
}
function doLoad(n)
{
		form1.action="ResourceInfo.action";
		form1["vo.resourceID"].value=n;
		form1.submit();
}


var st = new SortableTable(document.getElementById("sort-table"),
	["String", "CaseInsensitiveString", "String"]);

sort(st);
st.onsort =sort(st);

</script>
</body>
</html>
