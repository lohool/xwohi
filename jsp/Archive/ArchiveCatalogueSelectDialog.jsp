<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ page import="java.util.*"  %>
<%@ page import="com.lohool.jproject.xwohi.common.*"  %>
<%@ page import="com.lohool.jproject.xwohi.archive.po.*"  %>

<html>
<base target="_self">
<head>
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Open File Dialog</title>
<script type="text/javascript" src="js/fun.js"></script>
<link href="css/rowColorTable.css" rel="StyleSheet" type="text/css">
<link href="css/style.css" rel="StyleSheet" type="text/css">
<script>
function http(url){ 
   var http = new ActiveXObject("Microsoft.XMLHTTP"); 
   http.Open("POST",url, false); 
   http.setRequestHeader("Content-Type","text/xml"); 
   http.setRequestHeader("Cache-Control","no-cache"); 
   http.Send(url); 
   return http.responseText;//dom.documentElement.childNodes;//
   
} 
</script>
</head>

<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>

<body topmargin="0" leftmargin="0" onkeydown="if (event.keyCode==116){document.location.reload()}">

<div class="page">
<div id="pageTitle">
<TABLE id="title-table" cellpadding="0" cellspacing="0" height="30" width="100%">
<thead>
<TR>
<TD><span class="pageTitle-left"><img src="../images/ico_arrow_title.gif" width="13" height="13">
	<span id="path"></span>
	</span>
	<span class="pageTitle-right">
    </span>
</TD>
</TR>
</thead>
</TABLE>
</div>

<table width="100%" cellspacing="0" id="sort-table" >
<tr>
<td><xwohi:i18n text="name" /></td>
<td width="50"><xwohi:i18n text="editor" /></td>
<td width="120"><xwohi:i18n text="createTime" /></td>
</tr>
<tr>
<td height="1" colspan="5" bgcolor="#66CCCC">
</td>
</tr>

<tbody>

<ww:iterator value="objList">
<TR>
<td>
			<a href="ArchiveCatalogueSelectDialog.action?vo.parent.id=<ww:property value="id" />" >
			<img src="../images/icon/Manual31.gif" border=0> <ww:property value="name"/>
			</a>
			</td>
			<td>&nbsp;</td>
			<td><ww:property value="formatTime(createTime)"/></td>
</TR>
</ww:iterator>
</tbody>
</table>
</form>
</div>

<script>
var text=http("Archive/ShowPath.action?URL=ArchiveCatalogueSelectDialog.action&vo.id=<ww:property value="vo.parent.id"/>");
var value="<ww:property value="vo.parent.id"/>";
//removeAllOptions(selForm,selField);
//selForm.selField.add(new Option(text, value)); 
path.innerHTML=text;
//parent.document.selForm.selField.value=;
//parent.document.selForm.selValue.value=;
parent.setSelected(path.innerText,value);
</script>


</body>
</html>
