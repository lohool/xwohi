<%@ page session="true" %>
<%@ page contentType="text/html;charset=gb2312" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<html xmlns:xwohi="http://www.lohool.com/wohi/" xmlns:ww="http://www.opensymphony.com/webwork/">

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
	<xwohi:i18n text="Role.info"/>
	</span>
	<span class="pageTitle-right" >
	</span>
	</TD>
</TR>
</thead>
</TABLE>
</div>
<div align="center">
<ww:form name="form1" namespace="/Role" action="RoleModify" method="post" validate="true">
<ww:hidden  name="vo.roleID"/>

<table width="500" align="center" cellspacing="0" cellpadding="0" id="input_table" class="sort-table">
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Role.name"/></TD><TD bgColor="#ffffff" width="60%">
<ww:textfield name="vo.name" required="true"/></TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Role.description"/></TD><TD bgColor="#ffffff" width="60%">
<ww:textarea name="vo.description" cols="40" rows="6" required="true"/></TD>
</TR>


<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Role.roleRes"/></TD>
<TD bgColor="#ffffff" width="60%">



<TABLE>
<TR>
	<TD>
	<ww:select name="selectedList" listKey="resourceID" listValue="name" list="vo.resources" value="vo.resource.resourceID" size="7"  multiple="multiple" cssStyle="width=100px;" />
    <INPUT TYPE="hidden" NAME="vo.resources.resourceID">
   </TD>
	<TD>
		<input type="button" value=" --> " onClick="removeConfirmer(); return false;"> 
	<br>
	<br>
    <input type="button" value=" <-- " onClick="addConfirmer(); return false;">

	</TD>
	<TD>
<ww:select name="allList" listKey="resourceID" listValue="name" list="select.resources" value="vo.resource.resourceID" size="7"  multiple="multiple" cssStyle="width=100px;" />
	
	</TD>
</TR>
</TABLE>
</TD>
</TR>


<TR>
<TD align="center" colspan="2"> 
      <input type="button" onclick="getLists();" value="<xwohi:i18n text="submit" /> ">
      <input type="reset" value="<xwohi:i18n text="reset" />">
       </TD>
</TR>
</table>
</ww:form>
</div>
</html>
