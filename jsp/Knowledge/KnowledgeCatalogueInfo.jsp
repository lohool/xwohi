<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" %> 
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
<xwohi:i18n text="KnowledgeCatalogue.info"/></span><span class="pageTitle-right"></span></TD>
</TR>
</thead>
</TABLE>
</div>
<br>
<br>
<div align="center">
<ww:form name="form1" namespace="/Knowledge" action="KnowledgeCatalogueModify" method="post" validate="true">
<ww:hidden name="vo.id" />

<table class="sort-table" id="input_table" cellpadding="0" cellspacing="0" align="center" width="500" bgcolor="#E3E3E3">
<thead>
<TR>
<TD colspan="2">
<xwohi:i18n text="KnowledgeCatalogue.info"/></TD>
</TR>
</thead>
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="KnowledgeCatalogue.name"/></TD><TD bgColor="#ffffff" width="60%">
<ww:textfield name="vo.name" required="true"/></TD>
</TR>
<!--
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="KnowledgeCatalogue.parent"/></TD><TD bgColor="#ffffff" width="60%">
<ww:select name="vo.parent.id" listKey="id" listValue="name" list="select.parent" /></TD>
</TR>
-->
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="KnowledgeCatalogue.description"/></TD><TD bgColor="#ffffff" width="60%">
<ww:textarea name="vo.description" cols="40" rows="7" required="true"/></TD>
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
