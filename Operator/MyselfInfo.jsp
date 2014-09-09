<%@ page session="true" %>
<%@ page contentType="text/html;charset=gb2312" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<html>
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
	<xwohi:i18n text="Operator.info"/>
	</span>
	<span class="pageTitle-right" >
	</span>
	</TD>
</TR>
</thead>
</TABLE>
</div>
<div align="center">
<ww:form name="form1" namespace="/Operator"  action="OperatorModify" method="post" validate="true">
<ww:hidden  name="vo.id"/>
<table bgcolor="#E3E3E3" width="500" align="center" cellspacing="0" cellpadding="0" id="input_table" class="sort-table">
<thead>
<TR>
<TD colspan="2">
<xwohi:i18n text="Operator.info"/>
</TR>
</thead>
<TR>
<TD bgColor="#ffffff" align="right" width="40%"><xwohi:i18n text="Operator.account" />:</TD><TD bgColor="#ffffff" width="60%">
             <ww:textfield  name="vo.account"/>     
	  </TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" width="40%"><xwohi:i18n text="Operator.name" />:</TD><TD bgColor="#ffffff" width="60%">
             <ww:textfield label="vo.name" name="vo.name" required="true"/>     
	  </TD>
</TR>
<TR>
	<TD bgColor="#ffffff" align="right" width="40%">
	<xwohi:i18n text="Job" />:
	</TD>

<TD bgColor="#ffffff"  width="40%">
	<ww:property value="vo.job.name" />
</TD>
</TR>

<TR>
	<TD bgColor="#ffffff"  align="right" width="40%">
	<xwohi:i18n text="Department" />:
	</TD>

<TD bgColor="#ffffff" width="40%">
		<ww:property value="vo.department.name" />

</TD>
</TR>

<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Operator.roles"/></TD>
<TD bgColor="#ffffff" width="60%">



	<ww:select name="selectedList" listKey="roleID" listValue="name" list="vo.roles" value="vo.roles.roleID" size="7"  multiple="multiple" cssStyle="border:1pt solid #636563;font-size:9pt;width=100px" />
	
	</TD>
</TR>

<TR>
<TD align="center" colspan="2"> 
      <input type="submit"  value="<xwohi:i18n text="submit" /> ">
      <input type="reset" value="<xwohi:i18n text="reset" />">
       </TD>
</TR>
</table>
</ww:form>
</div>
</div>

</html>