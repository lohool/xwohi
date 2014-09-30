<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF8" %> 
<%@ taglib uri="webwork" prefix="ww" %>

<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>

<div align="center">
<ww:form name="operator_add_form" namespace="/Operator" action="OperatorAdd" method="post" validate="true" onsubmit="return iframeCallback(this,'operator_list')" enctype="multipart/form-data">
<INPUT TYPE="hidden" NAME="vo.state" value="1">
<table bgcolor="#E3E3E3" width="500" align="center" cellspacing="0" cellpadding="0" id="input_table" class="sort-table">
<thead>
<TR>
<TD colspan="2">
<xwohi:i18n text="Operator.info"/>
</TR>
</thead>
<TR>
<TD bgColor="#ffffff" align="right" width="40%"><xwohi:i18n text="Operator.account" />:</TD><TD bgColor="#ffffff" width="60%">
             <ww:textfield  name="vo.account" required="true"/>     			<INPUT TYPE="file" NAME="file1">

	  </TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" width="40%"><xwohi:i18n text="Operator.name" />:</TD><TD bgColor="#ffffff" width="60%">
             <ww:textfield  name="vo.name" required="true"/>     
	  </TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" width="40%"><xwohi:i18n text="Operator.password" />:</TD><TD bgColor="#ffffff" width="60%">
             <ww:password  name="vo.password" required="true"/>     
	  </TD>
</TR>
<TR>
	<TD bgColor="#ffffff" align="right" width="40%">
	<xwohi:i18n text="Operator.password2" />
	</TD>
	<TD bgColor="#ffffff" width="60%">
       <ww:password  name="vo.password2" required="true"/>     
	</TD>
</TR>
<TR>
	<TD bgColor="#ffffff" align="right" width="40%">
	<xwohi:i18n text="Job" />:
	</TD>

<TD bgColor="#ffffff"  width="40%">
	<ww:select name="vo.job.id" listKey="id" listValue="name" list="select.job" value="vo.job.id"/>
</TD>
</TR>

<TR>
	<TD bgColor="#ffffff"  align="right" width="40%">
	<xwohi:i18n text="Department" />:
	</TD>

<TD bgColor="#ffffff" width="40%">
	<ww:select name="vo.department.id" listKey="id" listValue="name" list="select.department" value="vo.department.id"/>
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
