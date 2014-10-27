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
<br>
<div align="center">
<ww:form name="form1" namespace="/Knowledge" action="KnowledgeModify" method="post" validate="true">
<ww:hidden name="vo.id" />
<table class="sort-table" id="input_table" cellpadding="0" cellspacing="0" align="center" width="500" bgcolor="#E3E3E3">
<thead>
<TR>
<TD colspan="2">
<xwohi:i18n text="Knowledge.info"/></TD>
</TR>
</thead>
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Knowledge.title"/></TD><TD bgColor="#ffffff" width="60%">
<ww:textfield name="vo.title" size="40" required="true"/></TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Knowledge.createTime"/></TD><TD bgColor="#ffffff" width="60%">
<ww:textfield name="vo.createTime" required="true"/></TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Knowledge.file"/></TD><TD bgColor="#ffffff" width="60%">
<ww:file name="vo.file" size="40" required="true"/></TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Knowledge.content"/></TD><TD bgColor="#ffffff" width="60%">
<ww:textarea name="vo.content" cols="60" rows="15" required="true"/></TD>
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
