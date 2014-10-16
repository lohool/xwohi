<%@ page session="true" %>
<%@ page contentType="text/html;charset=gb2312" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<html xmlns:xwohi="http://www.lohool.com/wohi/" xmlns:ww="http://www.opensymphony.com/webwork/">

<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>

<script type="text/javascript">
function form_submit(form)
{
		$.ajax({ 
			url: form.action, 
			//context: document.body, 
			data :   unescape($(form).find(":input").serialize()),
			type:"POST",
			dataType:"json",
			error: function(XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest.status);
                        alert(XMLHttpRequest.readyState);
                        alert(textStatus);
                    },
			success: function(data){
				if(data.code=="200")
				{
					alert("saved");
					//alert(self.id);
				}
				else
				{
					alert(data)
				}

			}
	  });
		
	return false;
}
</script>


<body leftmargin="0" topmargin="0" >
<div class="page">
<div class="panel">Grant data group permissions to the current role.</div>
<div class="panel">
<ww:form name="form1" namespace="/Role" action="RoleDataPermissionModify" method="post" validate="true" onsubmit="return form_submit(this)">
<ww:hidden  name="vo.roleID"/>
<table width="100%" align="center" cellspacing="0" cellpadding="0" id="input_table" >
<ww:action id="dgl" name="DataGroupList" namespace="/DataGroup" executeResult="false" >
			<ww:param name="pageSize" value="100" />
</ww:action>
<TR>
	<ww:iterator value="#attr.dgl.objList" status="dglList">
		<ww:if test="#dglList.index % 2 == 0">
</TR>
<TR>
		</ww:if>
<TD width="50%"> 
	  <div class="panel" style="height:25px;text-align:left;">
		<ww:property value="#dglList.index"/>: <ww:property value="name"/> (<ww:property value="%{URI}" /><ww:property value="%{nameSpace}" />)
	  </div>
	  <div class="panel" style="height:130px;text-align:left">
		<ww:action id="cl" name="%{URI}"  namespace="%{nameSpace}" executeResult="false" >
			<ww:param name="pageSize" value="100" />
		</ww:action>
		<TABLE >
		<TR>
			<TD>Group</TD>
			<TD>Read</TD>
			<TD>Create</TD>
			<TD>Update</TD>
			<TD>Delete</TD>
		</TR>
		<ww:iterator value="#attr.cl.objList">
		<ww:set name="permissionValue" value="vo.getPermission([1].id,id)"/>
		<TR>
			<TD><INPUT TYPE="checkbox" <ww:if test="#permissionValue>0">checked</ww:if> NAME="dataGroup" ID="<ww:property value="[1].id"/>_<ww:property value="id"/>" value="<ww:property value="[1].id"/>_<ww:property value="id"/>" ><ww:property value="name"/></TD>
			<TD><INPUT TYPE="checkbox" <ww:if test="(#permissionValue&1)==1">checked</ww:if> NAME="<ww:property value="[1].id"/>_<ww:property value="id"/>" value="1"></TD>
			<TD><INPUT TYPE="checkbox" <ww:if test="(#permissionValue&2)==2">checked</ww:if> NAME="<ww:property value="[1].id"/>_<ww:property value="id"/>" value="2"></TD>
			<TD><INPUT TYPE="checkbox" <ww:if test="(#permissionValue&4)==4">checked</ww:if> NAME="<ww:property value="[1].id"/>_<ww:property value="id"/>" value="4"></TD>
			<TD><INPUT TYPE="checkbox" <ww:if test="(#permissionValue&8)==8">checked</ww:if> NAME="<ww:property value="[1].id"/>_<ww:property value="id"/>" value="8"></TD>
		</TR>
        </ww:iterator>
		</TABLE>
	  </div>
 </TD>
     </ww:iterator>
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
