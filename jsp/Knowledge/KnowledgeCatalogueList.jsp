<%@ page contentType="text/html; charset=gb2312" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
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
<style>
.Folder
{
	position:relative;
	width:100px;
	height:120px;
	text-align:center;
	padding:8px 4px;
	margin:1px;
	border:solid 1px white;
	display:inline-block;
	float:left;
}
.Folder:hover
{
	background-color: #E0F0F8;
	border:solid 1px #A8DCF9;
}
.Folder A
{
	text-align:center;
	color:black;
    FONT-SIZE:       12px;
	width:100px;
	cursor:default;
}
.Folder A:hover
{
    COLOR:           red;
    FONT-FAMILY:     Arial, Helvetica;
    FONT-SIZE:       12px;
    TEXT-DECORATION: underline;
}
.Folder img
{
	width:80px;
	height:80px;
	border: 1px solid #CCCCCC;
	text-align:center;
	vertical-align:middle;
	line-height:80px;
}
.Folder img:hover
{
    COLOR:           #3D65F8;
    FONT-FAMILY:     Arial, Helvetica;
    FONT-SIZE:       12px;
    TEXT-DECORATION: underline;
}
.Folder .Text
{
	text-align:center;
	width:80px;
	height:40px;
    FONT-FAMILY:     Arial, Helvetica;
    FONT-SIZE:       12px;
    TEXT-DECORATION: underline;
	line-height:20px;
	display:inline-block;
	word-wrap:break-word;
	word-break:break-all;
	overflow:hidden; 
	z-index:0;
}
.Folder .Text:hover
{
	text-align:center;
	width:100px;
	height:100px;
    FONT-FAMILY:     Arial, Helvetica;
    FONT-SIZE:       12px;
    TEXT-DECORATION: underline;
	display:inline-block;
	word-wrap:break-word;
	word-break:break-all;
	overflow:hidden; 
	z-index:1000;
}



</style>

<div class="page">

<div id="pageTitle">
	<TABLE id="title-table" cellpadding="0" cellspacing="0" height="30" width="100%">
	<thead>
	<TR>
	<TD>
	<span class="pageTitle-left"><img src="images/ico_arrow_title.gif" width="13" height="13">
	<a href="Knowledge/KnowledgeCatalogueList.action?vo.parent.id=1" target='self'>Root$</a>>
	<span id="path"></span>
	</span>
		<span class="pageTitle-right">
		<a href="Knowledge/KnowledgeCatalogueInput.action?vo.id=<ww:property value="vo.parent.id"/>"><xwohi:i18n text="new_catalogue"/></a>
		<a href="Knowledge/KnowledgeInput.action?vo.id=<ww:property value="vo.parent.id"/>"><xwohi:i18n text="new_file"/></a>
		</span>

	</TD>
	</TR>
	</thead>
	</TABLE>
</div>

<div>
<ww:iterator value="objList">
<div class="Folder" >
	<a  href="Knowledge/KnowledgeCatalogueList.action?vo.parent.id=<ww:property value="id" />" target='self'>
		<img src="images/icon/Osx16.jpg" border=0 width="64px">
		<br><span class="Text"><ww:property value="name"/></span>
	</a>
</div>
</ww:iterator>
<div id="knowledgeList"></div>
</div>
</div>
<form name="form1" action="Knowledge/KnowledgeCatalogueDelete.action">
<ww:hidden name="page"/>
<ww:hidden name="pageSize"/> 
<ww:hidden name="vo.id" /> 
<INPUT TYPE="hidden" NAME="vo.parent.id" value="<ww:property value="vo.parent.id"/>">
</form>
<script>
$(document).ready(function(){
	$("#path").html(http("Knowledge/ShowKnowledgePath.action?vo.id=<ww:property  value="vo.parent.id"/>"));
	$("#knowledgeList").html(http("Knowledge/KnowledgeList.action?vo.catalogue.id=<ww:property value="vo.parent.id"/>"));
	//reDefineHTMLActions("path");
	//reDefineHTMLActions("knowledgeList");
})
</script>
