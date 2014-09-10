<%@ page session="true" %>
<%@ page contentType="text/html;charset=gb2312" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ page import="com.lohool.jproject.xwohi.common.*"  %>
<html xmlns:xwohi="http://www.lohool.com/wohi/" xmlns:ww="http://www.opensymphony.com/webwork/">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/sortabletable.css" rel="StyleSheet" type="text/css">

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
	<xwohi:i18n text="Resource.info"/>
	</span>
	<span class="pageTitle-right" >
	</span>
	</TD>
</TR>
</thead>
</TABLE>
</div>
<div align="center">
<ww:form name="form1" namespace="/Resource" action="ResourceAdd" method="post" validate="true">
<table bgcolor="#E3E3E3" width="500" align="center" cellspacing="0" cellpadding="0" id="input_table" class="sort-table">
<thead>
<TR>
<TD colspan="2">
<xwohi:i18n text="Resource.info"/>
</TR>
</thead>
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Resource.name"/></TD><TD bgColor="#ffffff" width="60%">
<ww:textfield name="vo.name" size="30" required="true"/></TD>
</TR>
<!--
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Resource.type"/></TD><TD bgColor="#ffffff" width="60%">
<ww:textfield name="vo.type" required="true"/></TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Resource.state"/></TD><TD bgColor="#ffffff" width="60%">
<ww:textfield name="vo.state" required="true"/></TD>
</TR>
-->
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Resource.userType"/></TD><TD bgColor="#ffffff" width="60%">
<%
session.setAttribute("userTypes",Globals.getUserTypes());
%>
<ww:select name="vo.userType"  list="#session.userTypes" value="vo.userType"/></TD>
</TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Resource.description"/></TD><TD bgColor="#ffffff" width="60%">
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
</html>
