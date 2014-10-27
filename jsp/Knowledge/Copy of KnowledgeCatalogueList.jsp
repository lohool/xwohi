<%@ page contentType="text/html; charset=gb2312" %>
<%@ taglib uri="webwork" prefix="ww" %>
<!DOCTYPE HTML>
<html xmlns:xwohi="http://www.lohool.com/wohi/" xmlns:ww="http://www.opensymphony.com/webwork/">
<head>
<META http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<script type="text/javascript" src="/js/fun.js"></script>
<script src="/js/sortabletable.js" type="text/javascript"></script>
<script src="/js/rowColorTable.js" type="text/javascript"></script>
<link href="/css/sortabletable.css" rel="StyleSheet" type="text/css">
<link href="/css/rowColorTable.css" rel="StyleSheet" type="text/css">
<link href="/css/style.css" rel="StyleSheet" type="text/css">
<script>
function http(url){ 
   var http = new ActiveXObject("Microsoft.XMLHTTP"); 
   http.Open("POST",url, false); 
   http.setRequestHeader("Content-Type","text/xml"); 
   http.setRequestHeader("Cache-Control","no-cache"); 
   http.Send(url); 
   //var root="<?xml version=\"1.0\" standalone=\"no\" ?>"+http.responseText;
   //var dom = new ActiveXObject("Microsoft.XMLDOM") 
   //dom.async=false; //设置为同步方式获取数据 
   //alert(http.responseText);
   //dom.loadXML(root) ;
   return http.responseText;//dom.documentElement.childNodes;//
   
} 
</script>
<script type="text/javascript">
var homeAction="/Knowledge/KnowledgeCatalogueList.action";
var inputAction="/Knowledge/OperatorInput.action";
var deleteAction="OperatorDelete.action";
var primaryKeyName="vo.id";
var loadAction="/Knowledge/OperatorInfo.action";
var thisAction="/Knowledge/OperatorInput.action";
var showInfoAction="/Knowledge/OperatorShow.action";
var helpAction="";
</script>

</head>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>


<body topmargin="0" leftmargin="0">
<div class="page">

<div id="pageTitle">
		<jsp:include page="/editMenu.jsp" /> 	
<TABLE id="title-table" cellpadding="0" cellspacing="0" height="30" width="100%">
<thead>
<TR>
<TD>
<span class="pageTitle-left"><img src="/images/ico_arrow_title.gif" width="13" height="13">
<a href="/Knowledge/KnowledgeCatalogueList.action?vo.parent.id=0">Root$</a>>
<script>document.write(http("/Knowledge/ShowKnowledgePath.action?vo.id=<ww:property  value="vo.parent.id"/>"));</script>
</span>
	<span class="pageTitle-right">
	<a href="/Knowledge/KnowledgeCatalogueInput.action?vo.id=<ww:property value="vo.parent.id"/>"><xwohi:i18n text="new_catalogue"/></a>
	<a href="/Knowledge/KnowledgeInput.action?vo.id=<ww:property value="vo.parent.id"/>"><xwohi:i18n text="new_file"/></a>
    </span>

</TD>
</TR>
</thead>
</TABLE>
</div>
<style>
table
{
	border:0px;
}
</style>
<table width="100%" cellspacing="0" id="sort-table"  class="sort-table">
<thead>
<tr>
<td width=7 class="headID">&nbsp;</td>
<td><xwohi:i18n text="KnowledgeCatalogue.name" /></td>
<td><xwohi:i18n text="KnowledgeCatalogue.editor" /></td>
<td><xwohi:i18n text="KnowledgeCatalogue.createtime" /></td>
<TD width="30">
<xwohi:i18n text="delete"/></TD>
<TD width="30">
<xwohi:i18n text="modify"/></TD>
</tr>
</thead>
<tbody>

<ww:iterator value="objList">
<TR onclick="checkedTableRow(this)" ondblclick="doDblClick()" valueOfId="<ww:property value="id"/>" valueOfChecked="">
<td width=7 class="headID">&nbsp;</td>
<td>
			<a href="/Knowledge/KnowledgeCatalogueList.action?vo.parent.id=<ww:property value="id" />">
			<img src="/images/icon/Manual31.gif" border=0> <ww:property value="name"/>
			</a>
			</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<TD>
			<a href="javascript:doDelete('<ww:property value="id"/>')"><img src="/images/delete.gif" border="0"/></a>
			</TD><TD>
			<a href="javascript:doLoad('<ww:property value="id"/>')"><img src="/images/detail.gif" border="0" /></a>
</TD>
</TR>
</ww:iterator>
<script>
document.write(http("/Knowledge/KnowledgeList.action?vo.catalogue.id=<ww:property value="vo.parent.id"/>"));
</script>
</tbody>

</table>
</div>
<form name="form1" action="/Knowledge/KnowledgeCatalogueDelete.action">
<ww:hidden name="page"/>
<ww:hidden name="pageSize"/> 
<ww:hidden name="vo.id" /> 
<INPUT TYPE="hidden" NAME="vo.parent.id" value="<ww:property value="vo.parent.id"/>">
</form>

<script type="text/javascript">

function doDelete(n)
{
	var r=confirm("Are you sure to delete it?");
	if(r)
	{
		form1.action="KnowledgeCatalogueDelete.action";
		form1["vo.id"].value=n;
		//form1["vo.parent.id"].value=n;
		form1.submit();
	}
}
function doLoad(n)
{
		form1.action="KnowledgeCatalogueInfo.action";
		form1["vo.id"].value=n;
		//form1["vo.parent.id"].value=n;
		form1.submit();
}


var st = new SortableTable(document.getElementById("sort-table"),
	["None","String", "String", "Date", "None", "None"]);

sort(st);
st.onsort =sort(st);

</script>

<script src="/js/table.js" type="text/javascript"></script>
</body>
</html>
