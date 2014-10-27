<%@ page session="true" %>
<%@ page contentType="text/html;charset=gb2312" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<html xmlns:xwohi="http://www.lohool.com/wohi/" xmlns:ww="http://www.opensymphony.com/webwork/">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/sortabletable.css" rel="StyleSheet" type="text/css">

<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>

<body topmargin="0" leftmargin="0">
<div class="page">
<div id="pageTitle">
<TABLE id="title-table" cellpadding="0" cellspacing="0" height="30" width="100%">
<thead>
<TR>
<TD><span class="pageTitle-left"><img src="/images/ico_arrow_title.gif" width="13" height="13">
<xwohi:i18n text="Knowledge.info"/></span><span class="pageTitle-right"></span></TD>
</TR>
</thead>
</TABLE>
</div>
<br>
<div align="center">
<ww:form name="form1" namespace="/Knowledge" action="KnowledgeAdd" method="post" validate="true">
<INPUT TYPE="hidden" NAME="vo.catalogue.id" value="<ww:property value="vo.id" />">
<INPUT TYPE="hidden" NAME="vo.parent.id" value="<ww:property value="vo.id" />">
<table class="sort-table" id="input_table" cellpadding="0" cellspacing="0" align="center" width="100%" bgcolor="#E3E3E3">
<thead>
<TR>
<TD colspan="2">
<xwohi:i18n text="Knowledge.info"/></TD>
</TR>
</thead>
<TR>
<TD bgColor="#ffffff" align="right" width="20%">
<xwohi:i18n text="Knowledge.title"/></TD><TD bgColor="#ffffff" width="60%">
<ww:textfield name="vo.title" size="40" required="true"/></TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" width="20%">
<xwohi:i18n text="Knowledge.file"/></TD><TD bgColor="#ffffff" width="60%">
<ww:file name="vo.file" size="40"/></TD>
</TR>
<TR>
<TD colspan="2" bgColor="#ffffff" align="right" width="20%">
<xwohi:i18n text="Knowledge.content"/></TD>
</TR>
<TR>
<TD colspan="2" bgColor="#ffffff" width="80%">
	<textarea class="wpHtmlEditArea" style="height:600px;" id="editor" name="vo.content" wrap="off"></textarea>
	<link href="../sample.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/fckeditor/fckeditor.js"></script>
	<script type="text/javascript">

	var oFCKeditor = new FCKeditor( 'vo.content' ) ;
	oFCKeditor.BasePath	= '/fckeditor/' ;
	oFCKeditor.Height	= 370 ;
	//oFCKeditor.Create() ;
	oFCKeditor.ReplaceTextarea() ;

</script>

</TD>
</TR>
<TR>
<TD align="center" colspan="2"> 
      <input type="submit" value="<xwohi:i18n text="submit" />">
      <input type="reset" value="<xwohi:i18n text="reset" />">
 </TD>
</TR>
</table>
</ww:form>
</div>
</div>

</body>
</html>
