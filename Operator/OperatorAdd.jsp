<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF8" %> 
<%@ taglib uri="webwork" prefix="ww" %>

<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<script> 

function addConfirmer() 
{ 
	myform = document.getElementById("operator_add_form"); 

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
	myform = document.getElementById("operator_add_form"); 
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

<div class="page">
<ww:form name="operator_add_form" id="operator_add_form" namespace="/Operator" action="OperatorAdd" method="post" validate="true" onsubmit="return onSubmit(this);">
<INPUT TYPE="hidden" NAME="vo.state" value="1">
<div class="container" layoutHeight="38">
<div class="content" >
<p><ww:textfield  name="vo.account" label="%{getText('Operator.account')}" /></p>
<p><ww:textfield  name="vo.name" label="%{getText('Operator.name')}" /></p>

<p><label class="label"><xwohi:i18n text="Operator.password"/>:</label><ww:password  name="vo.password"  /></p>
<p><label class="label"><xwohi:i18n text="Operator.password2"/>:</label><ww:password  name="vo.password2"  /></p>


<p><ww:select name="vo.job.id" listKey="id" listValue="name" list="select.job" value="vo.job.id" label="%{getText('Job')}"/></p>
<p><label class="label"><xwohi:i18n text="Department"/>:</label>
		<INPUT id="vo.department.id" TYPE="hidden" NAME="vo.department.id" style="width:50px">
		<INPUT id="departmentName" TYPE="text" NAME="departmentName" readonly="true" style="width:100px">
		<INPUT TYPE="button" value="Sel..." onclick="openDialog('Department/DepartmentSelect.action','Select Department',true,600,350)">
</p>
<p>
	<label class="label" ><xwohi:i18n text="Operator.roles"/>:</label>
	<span style="display:inline-block;width:120px;"><xwohi:i18n text="Operator.selectdRoles"/></span>
	<span style="display:inline-block;width:50px"> </span>
	<span style="display:inline-block;width:120px;"><xwohi:i18n text="Operator.notSelectedRoles"/></span>
	<br>
	<label class="label" > &nbsp;</label>
	<span style="display:inline-block;width:120px;">		
	<select name="vo.roles.roleID" size="7"  multiple="true" style="width:120px;height:140px;"/>
	</span>
	<span style="display:inline-block;width:50px;vertical-align:top;"> 
		<br>
		<br>
		<input type="button" value=" --> " onClick="removeConfirmer(); return false;"/> 
		<br>
		<br>
		<input type="button" value=" <-- " onClick="addConfirmer(); return false;"/>
	</span>
	<span style="display:inline-block;width:120px;">		
		<ww:select name="allList" listKey="roleID" listValue="name" list="select.roles" value="vo.roles.roleID" size="9"  multiple="true" cssStyle="width:120px;height:140px;" />
	</span>
</p>
</div>
</div>
<div class="panel" style="height:25px;text-align:center;">
	   <ww:if test="#session.operation_user.isAccess(\"/Operator/OperatorDelete.action\")==true">
      <input type="submit"  value="<xwohi:i18n text="submit" /> ">
	  </ww:if>
      <input type="reset" value="<xwohi:i18n text="reset" />">
      <input type="button" value="<xwohi:i18n text="close" />" onclick="_window.closeCurrent()">
</div>
</ww:form>
</div>
