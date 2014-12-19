<%@ page session="true" %>
<%@ page contentType="text/html;charset=gb2312" %> 
<%@ taglib uri="webwork" prefix="ww" %>

<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<script> 

function addConfirmer() 
{ 
	myform = document.getElementById("role_add_form"); 

	var selectedList=myform["vo.resources.resourceID"];
	var selectableList=myform["allList"];
	for (i = 0; i < selectableList.options.length; i++) 
	{ 
		if (selectableList.options[i].selected == true) 
		{ 
			var memo= $("#id option:eq(1)").attr("Memo")
			newOpt = new Option(selectableList.options[i].text, selectableList.options[i].value); 
			selectedList.add(newOpt); 
			selectableList.remove(i);
			i--;
		} 
	} 
} 

function removeConfirmer() 
{ 
	myform = document.getElementById("role_add_form"); 
	var selectedList=myform["vo.resources.resourceID"];
	var selectableList=myform["allList"];

	for (i = 0;i < selectedList.options.length ;  i++)  
    { 
        if (selectedList.options[i].selected == true)  
        { 
			newOpt = new Option(selectedList.options[i].text, selectedList.options[i].value); 
			selectableList.add(newOpt); 
            selectedList.remove(i); 
			i--;
		} 
    } 
} 
function onSubmit(myform) 
{                            
	//myform = document.operator_info_form; 
	var selectedList=myform["vo.resources.resourceID"];
	var selectableList=myform["allList"];

	for (i = selectedList.options.length -1; i >= 0; i--)  
	{ 
		//myform["vo.roles.roleID"].value = myform["vo.roles.roleID"].value + ',' +selectedList.options[i].value; 
		selectedList.options[i].selected = true; 
	} 

	//myform["vo.roles.roleID"].value = myform["vo.roles.roleID"].value.substring(1);
	//alert(myform["vo.roles.roleID"].value);
	return ajaxDatagridSubmit(myform,"Role_list");
	//return false;
} 

</script> 

<div class="page">
<ww:form id="role_add_form" name="role_add_form" namespace="/Role" action="RoleAdd" method="post" validate="true" onsubmit="return onSubmit(this)">
<div align="center" layoutHeight="38">
<table  align="center" >
<TR>
<TD>
<xwohi:i18n text="Role.name"/></TD><TD>
<ww:textfield name="vo.name" cssStyle="width:300px" required="true"/></TD>
</TR>
<TR>
<TD>
<xwohi:i18n text="Role.resource"/></TD>
<TD>
<TABLE>
<TR>
	<TD>
	<select name="vo.resources.resourceID" size="7"  multiple="true" style="border:1pt solid #636563;font-size:9pt;width:120px"/>
   </TD>
	<TD>
		<input type="button" value=" --> " onClick="removeConfirmer(); return false;"> 
	<br>
	<br>
    <input type="button" value=" <-- " onClick="addConfirmer(); return false;">

	</TD>
	<TD>
	<ww:select name="allList" listKey="resourceID" listValue="name" list="select.resources" value="vo.resource.resourceID" size="7" multiple="true" cssStyle="border:1pt solid #636563;font-size:9pt;width:120px" />
	
	</TD>
</TR>
</TABLE>
</TD>
</TR>
<TR>
<TD>
<xwohi:i18n text="Role.description"/></TD><TD>
<ww:textarea name="vo.description" cols="30" rows="9" required="true" cssStyle="width:300px"/></TD>
</TR>
</table>
</div>
				<div class="panel" style="height:25px;text-align:center;">
					  <input type="submit"  value="<xwohi:i18n text="submit" /> ">
					  <input type="reset" value="<xwohi:i18n text="reset" />">
					  <input type="button" value="<xwohi:i18n text="close" />" onclick="_window.closeCurrent()">
				</div>
</ww:form>
</div>
