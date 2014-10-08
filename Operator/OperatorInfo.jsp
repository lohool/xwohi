<%@ page session="true" %>
<%@ page contentType="text/html;charset=gb2312" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>

<script> 

function addConfirmer() 
{ 
	myform = document.getElementById("operator_info_form"); 

	var selectedList=myform["vo.roles.roleID"];
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
	myform = document.getElementById("operator_info_form"); 
	var selectedList=myform["vo.roles.roleID"];
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
	

	var selectedList=myform["vo.roles.roleID"];
	var selectableList=myform["allList"];

	for (i = selectedList.options.length -1; i >= 0; i--)  
	{ 
		//myform["vo.roles.roleID"].value = myform["vo.roles.roleID"].value + ',' +selectedList.options[i].value; 
		selectedList.options[i].selected = true; 
	} 

	//myform["vo.roles.roleID"].value = myform["vo.roles.roleID"].value.substring(1);
	//alert(myform["vo.roles.roleID"].value);
	return ajaxDatagridSubmit(myform,'operator_list');
	//return false;
} 

</script> 
<ww:form id="operator_info_form" name="operator_info_form" namespace="/Operator"  action="OperatorModify" method="post" validate="true" theme="simple" onsubmit=" return onSubmit(this);">
<ww:hidden  name="vo.id"/>

<table width="100%" align="left" height="100%" cellspacing="0" cellpadding="0" id="input_table" class="sort-table" style="float:left;position:relative;top:0px;">

<TR>
<TD  align="right" width="40%"><xwohi:i18n text="Operator.account" />:</TD><TD  width="60%">
             <ww:textfield  name="vo.account"/>     
	  </TD>
</TR>
<TR>
<TD  align="right" width="40%"><xwohi:i18n text="Operator.name" />:</TD><TD  width="60%">
             <ww:textfield label="vo.name" name="vo.name" required="true"/>     
	  </TD>
</TR>
<TR>
<TD  align="right" width="40%"><xwohi:i18n text="Operator.password" />:</TD><TD  width="60%">
             <ww:password  name="vo.password" required="true"/>     
	  </TD>
</TR>
<TR>
<TD  align="right" width="40%"><xwohi:i18n text="Operator.password2" />:</TD><TD  width="60%">
             <ww:password  name="vo.password2" required="true"/>     
	  </TD>
</TR>
<TR>
	<TD  align="right" width="40%">
	<xwohi:i18n text="job" />:
	</TD>

<TD   width="40%">
	<ww:select name="vo.job.id" listKey="id" listValue="name" list="select.job" value="vo.job.id" />
</TD>
</TR>

<TR>
	<TD   align="right" width="40%">
	<xwohi:i18n text="department" />:
	</TD>

<TD  width="40%">
	<ww:select name="vo.department.id" listKey="id" listValue="name" list="select.department" value="vo.department.id"  multiple="multiple"/>
	<INPUT id="departmentId" TYPE="text" NAME="departmentId">
	<INPUT id="departmentName" TYPE="text" NAME="departmentName">
	<INPUT TYPE="button" value="Sel" onclick="openDialog('/Department/DepartmentSelect.action','Select Department',true,600,350)">
</TD>
</TR>

<TR>
<TD  align="right" width="40%">
<xwohi:i18n text="Operator.roles"/></TD>
<TD  width="60%">

<!--
    <INPUT TYPE="hidden" NAME="vo.roles.roleID">
-->
<TABLE>
<TR><TD><xwohi:i18n text="Operator.selectdRoles"/></TD><TD>&nbsp;</TD><TD><xwohi:i18n text="Operator.notSelectedRoles"/></TD></TR>
<TR>
	<TD>
	<ww:select name="vo.roles.roleID" listKey="roleID" listValue="name" list="vo.roles" value="vo.roles.roleID" size="7"  multiple="true" cssStyle="border:1pt solid #636563;font-size:9pt;width:100px"  />

   </TD>
	<TD>
		<input type="button" value=" --> " onClick="removeConfirmer(); return false;"> 
	<br>
	<br>
    <input type="button" value=" <-- " onClick="addConfirmer(); return false;">

	</TD>
	<TD>
<ww:select name="allList" listKey="roleID" listValue="name" list="select.roles" value="vo.roles.roleID" size="7"  multiple="true" cssStyle="border:1pt solid #636563;font-size:9pt;width:100px" />
	
	</TD>
</TR>

</table>
</td>
</tr>
<TR>
<TD align="center" colspan="2"> 
	   <ww:if test="#session.operation_user.isAccess(\"/Operator/OperatorDelete.action\")==true">
      <input type="submit"  value="<xwohi:i18n text="submit" /> ">
	  </ww:if>
      <input type="reset" value="<xwohi:i18n text="reset" />">
       </TD>
</TR>
</table>

</ww:form>
<script>
$(document).ready(function(){
	var	myform = document.getElementById("operator_info_form"); 
	myform['vo.password'].value="<ww:property value="vo.password" />";
	myform['vo.password2'].value="<ww:property value="vo.password" />";
})
</script>
