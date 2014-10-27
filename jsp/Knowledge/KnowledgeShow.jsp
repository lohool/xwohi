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
<xwohi:i18n text="Knowledge.info"/></span><span class="pageTitle-right"></span></TD>
</TR>
</thead>
</TABLE>
</div>
<br>
<br>
<div align="center">
<ww:hidden name="vo.id" />
<table class="sort-table" id="input_table" cellpadding="0" cellspacing="0" align="center" width="90%" bgcolor="#E3E3E3">
<thead>
<TR>
<TD align="center">
<ww:property value="vo.title" /></TD>
</TR>
</thead>
<TR>
<TD bgColor="#ffffff" align="center" width="40%" >
</TD>
</TR>
<TR>
<TD bgColor="#ffffff" width="60%">
<ww:property value="vo.createTime" /></TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Knowledge.file"/>:
<ww:property value="vo.file" /></TD>
</TR>
<TR>
<TD bgColor="#ffffff" width="40%">
<ww:property value="vo.content" escape="false" /></TD>
</TR>

<TR>
<TD align="center" colspan="2"> 
      <input type="button" onclick="history.go(-1)" value="<xwohi:i18n text="back" />">
       </TD>
</TR>
</table>
</div>
</div>
</body>
</html>
