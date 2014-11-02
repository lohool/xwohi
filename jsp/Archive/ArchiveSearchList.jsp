<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<html xmlns:xwohi="http://www.lohool.com/wohi/" xmlns:ww="http://www.opensymphony.com/webwork/">
<head>
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript" src="/js/fun.js"></script><script src="/js/sortabletable.js" type="text/javascript"></script><script src="/js/rowColorTable.js" type="text/javascript"></script>
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

</head>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>


<body topmargin="0" leftmargin="0">
<div class="page">
<div id="pageTitle">
<TABLE id="title-table" cellpadding="0" cellspacing="0" height="30" width="100%">
<thead>
<TR>
<TD><span class="pageTitle-left"><img src="/images/ico_arrow_title.gif" width="13" height="13">
<a href="/Archive/ArchiveCatalogueList.action?vo.parent.id=0">Root$</a>>
	</span>
	<span class="pageTitle-right">
    </span>
</TD>
</TR>
</thead>
</TABLE>
</div>

<table width="100%" cellspacing="0" id="sort-table" >
<thead>
<tr>
<td><xwohi:i18n text="ArchiveCatalogue.name" /></td>
<td width="50"><xwohi:i18n text="ArchiveCatalogue.editor" /></td>
<td width="120"><xwohi:i18n text="ArchiveCatalogue.createTime" /></td>
<!--
<TD width="30">
<xwohi:i18n text="delete"/></TD>
<TD width="30">
<xwohi:i18n text="modify"/></TD>
-->
</tr>
<tr>
<td height="1" colspan="5" bgcolor="red">
</td>
</tr>

</thead>
<tbody>
<ww:iterator value="objList">
<TR>
<td>
			<img src="/images/icon/Manual4.gif" border=0> <ww:property value="title"/>
			</td><td>
			<ww:property value="editor"/>
			</td><td>
			<ww:property value="createTime"/>
			</td>
			<!--
			<TD>
			<a href="javascript:doDeleteArchive('<ww:property value="id"/>')"><img src="/images/delete.gif" border="0"/></a>
			</TD>
			<TD>
			<a href="javascript:doLoadArchive('<ww:property value="id"/>')"><img src="/images/detail.gif" border="0" /></a>
			</TD>
			-->
</TR>
</ww:iterator>
</tbody>
<ww:property value="paginateView" escape="false"></ww:property>

</div>
<form name="form2" action="/Archive/ArchiveSearchList.action">
<ww:hidden name="page"/>
<ww:hidden name="pageSize"/> 
<ww:hidden name="vo.id" /> 

<ww:hidden name="vo.title"/>
<ww:hidden name="vo.catalogue.id" />
<ww:hidden name="vo.serialNumber"/>
<ww:hidden name="vo.timeLimit"/>
<ww:hidden name="vo.content"/>
<ww:hidden name="vo.editor"/>
<ww:hidden name="beginTime"/>
<ww:hidden name="endTime"/>

</form>
<script type="text/javascript">

function doDeleteArchive(n)
{
	var r=confirm("Are you sure to delete it?");
	if(r)
	{
		form2.action="ArchiveDelete.action";
		form2["vo.id"].value=n;
		form2.submit();
	}
}
function doLoadArchive(n)
{
		form2.action="ArchiveInfo.action";
		form2["vo.id"].value=n;
		form2.submit();
}
var st = new SortableTable(document.getElementById("sort-table"),
	["String", "String", "Date", "None", "None"]);

sort(st);
st.onsort =sort(st);



</script>

</body>
</html>
