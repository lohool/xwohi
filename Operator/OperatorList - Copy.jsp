<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
<title></title>
<script src="/js/fun.js" type="text/javascript"></script>
<script src="/js/sortabletable.js" type="text/javascript"></script>
<script src="/js/rowColorTable.js" type="text/javascript"></script>

<link href="/css/style.css" rel="StyleSheet" type="text/css">
<link href="/css/sortabletable.css" rel="StyleSheet" type="text/css">
<link href="/css/rowColorTable.css" rel="StyleSheet" type="text/css">
<link href="/menu/menu.css" rel="StyleSheet" type="text/css">

<script src="/menu/menu.js" type="text/javascript"></script>
<script src="/menu/PopupMenu.js" type="text/javascript"></script>


<script type="text/javascript">
var primaryKeyName="vo.id";
var homeAction="/Operator/OperatorList.action";

var inputAction="/Operator/OperatorInput.action";
var deleteAction="OperatorDelete.action";
var loadAction="/Operator/OperatorInfo.action";
var thisAction="/Operator/OperatorList.action";
var showInfoAction="/Operator/OperatorShow.action";
var helpAction="";
</script>
</head>

<body >


<div class="page" style="height:100%;border:solid 1px green">
<div id="pageTitle">
		<jsp:include page="/editMenu.jsp" /> 	
</div>

<table width="100%" height="100%" cellspacing="0" id="sort-table" class="sort-table" style="height:100%;border:solid 1px green">
<thead>
<tr>
<td width=7 align="center">&nbsp;</td>
<td><xwohi:i18n text="Operator.account" /></td>
<td><xwohi:i18n text="Operator.name" /></td>
<td><xwohi:i18n text="Department" /></td>
<td><xwohi:i18n text="Job" /></td>
<!--
<TD width="30"><xwohi:i18n text="delete" /></TD>
<TD width="30"><xwohi:i18n text="modify" /></TD>
-->
</tr>
</thead>
<tbody>
<ww:iterator value="objList">
<TR onclick=checkedTableRow(this); ondblclick="doDblClick()" valueOfId="<ww:property value="id"/>" valueOfChecked="">
<td width=7 class="headID">&nbsp;</td>
<td>

			<ww:property value="account"/>
			</td>
			<td>
			<ww:property value="name"/>
			</td>
			<td>
			<ww:property value="department.name"/>
			</td>
			<td>
			<ww:property value="job.name"/>
			</td>
</TR>
</ww:iterator>
</tbody>
</table>
<div><ww:property value="paginateView" escape="false"></ww:property></div>
</div>
<form name="form1" action="/Operator/OperatorList.action">
<ww:hidden name="page"></ww:hidden>
<ww:hidden name="pageSize"></ww:hidden> 
	<ww:hidden name="vo.id" /> 
	<ww:hidden name="id" /> 
</form>

<script>
var st = new SortableTable(document.getElementById("sort-table"),
	["None","String", "CaseInsensitiveString", "String", "String"]);

sort(st);
st.onsort =sort(st);

</script>
<script src="/js/table.js" type="text/javascript"></script>
<a href="javascript:parent.openAlert('http://www.baidu.com','Test')" >aaaaaaaaaaa</a>
</body>
</html>
