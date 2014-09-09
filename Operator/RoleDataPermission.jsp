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
<ww:form name="form1" namespace="/Role" action="RoleDataPermissionModify" method="post" validate="true">
<ww:hidden  name="vo.roleID"/>

<table width="500" align="center" cellspacing="0" cellpadding="0" id="input_table" class="sort-table">


<TR>
<TD align="center" colspan="2"> 
<ww:action id="dgl" name="DataGroupList" namespace="/DataGroup" executeResult="false" />
	<ww:iterator value="#attr.dgl.objList">
		<ww:property value="name"/><br>
		<ww:property value="%{URI}" />
		<ww:property value="%{nameSpace}" />
		<ww:action id="cl" name="%{URI}"  namespace="%{nameSpace}" executeResult="false" />
		<ww:property value="#attr.c1" />
		<ww:iterator value="#attr.cl.objList">
		<nobr>
		<ww:set name="permissionValue" value="vo.getPermission([1].id,id)"/>
		<INPUT TYPE="checkbox" <ww:if test="#permissionValue>0">checked</ww:if> NAME="dataGroup" ID="<ww:property value="[1].id"/>_<ww:property value="id"/>" value="<ww:property value="[1].id"/>_<ww:property value="id"/>" ><ww:property value="name"/>
		
		<INPUT TYPE="checkbox" <ww:if test="(#permissionValue&1)==1">checked</ww:if> NAME="<ww:property value="[1].id"/>_<ww:property value="id"/>" value="1">Read
		<INPUT TYPE="checkbox" <ww:if test="(#permissionValue&2)==2">checked</ww:if> NAME="<ww:property value="[1].id"/>_<ww:property value="id"/>" value="2">Create
		<INPUT TYPE="checkbox" <ww:if test="(#permissionValue&4)==4">checked</ww:if> NAME="<ww:property value="[1].id"/>_<ww:property value="id"/>" value="4">Update
		<INPUT TYPE="checkbox" <ww:if test="(#permissionValue&8)==8">checked</ww:if> NAME="<ww:property value="[1].id"/>_<ww:property value="id"/>" value="8">Delete
		</nobr>
        </ww:iterator>
		<br>
     </ww:iterator>
 </TD>
</TR>


<TR>
<TD align="center" colspan="2"> 
      <input type="submit" value="<xwohi:i18n text="submit" /> ">
      <input type="reset" value="<xwohi:i18n text="reset" />">
       </TD>
</TR>
</table>
</ww:form>
</div>
</html>
