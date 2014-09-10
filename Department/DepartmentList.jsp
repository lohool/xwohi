<%@ page contentType="text/html; charset=gb2312" %>
<%@ taglib uri="webwork" prefix="ww" %>
<html>
<head>
<META http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<script type="text/javascript" src="/js/fun.js"></script><script src="/js/sortabletable.js" type="text/javascript"></script><script src="/js/rowColorTable.js" type="text/javascript"></script>
<link href="/css/sortabletable.css" rel="StyleSheet" type="text/css">
<link href="/css/rowColorTable.css" rel="StyleSheet" type="text/css">
<link href="/css/style.css" rel="StyleSheet" type="text/css">
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
	<xwohi:i18n text="Department.list"/>
	</span>
	<span class="pageTitle-right" >
	<a href="/Department/DepartmentInput.action"><xwohi:i18n text="new"/></a>
	</span>
	</TD>
</TR>
</thead>
</TABLE>

</div>
<table width="100%" cellspacing="0" id="sort-table" class="sort-table">
<thead>
<tr>
<td><xwohi:i18n text="Department.name" /></td><TD width="30"><xwohi:i18n text="delete" /></TD><TD width="30"><xwohi:i18n text="modify" /></TD>
</tr>
</thead>
<tbody>
<ww:iterator value="objList">
<TR>
<td>
			<ww:property value="name"/>
			</td><TD>
			<a href="javascript:doDelete('<ww:property value="id"/>')"><img src="/images/delete.gif" border="0" alt="<xwohi:i18n text="delete" />"></a>
			</TD><TD>
			<a href="javascript:doLoad('<ww:property value="id"/>')"><img src="/images/detail.gif" border="0" alt="<xwohi:i18n text="modify" />"></a>
			</TD>
</TR>
</ww:iterator>
</tbody>
</table>
<ww:property value="paginateView" escape="false"></ww:property>
</div>
<form name="form1" action="/Department/DepartmentList.action">
<ww:hidden name="page"></ww:hidden>
<ww:hidden name="pageSize"></ww:hidden> 
	<ww:hidden name="vo.id" /> 
</form>

<script type="text/javascript">

function doDelete(n)
{
	var r=confirm("<xwohi:i18n text="Are you realy to delete it?" />");
	if(r)
	{
		form1.action="DepartmentDelete.action";
		form1["vo.id"].value=n;
		form1.submit();
	}
}
function doLoad(n)
{
		form1.action="DepartmentInfo.action";
		form1["vo.id"].value=n;
		form1.submit();
}


var st = new SortableTable(document.getElementById("sort-table"),
	["String", "CaseInsensitiveString", "Number", "Date", "None"]);

sort(st);
st.onsort =sort(st);

</script>
</body>
</html>
