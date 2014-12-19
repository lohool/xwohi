<%@ page session="true" %>
<%@ page contentType="text/html;charset=gb2312" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<html xmlns:xwohi="http://www.lohool.com/wohi/" xmlns:ww="http://www.opensymphony.com/webwork/">

<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<script> 

function addConfirmer() 
{ 
	myform = document.getElementById("role_info_form"); 

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
	myform = document.getElementById("role_info_form"); 
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
	
alert("gg" )

	var selectedList=myform["vo.resources.resourceID"];
alert(selectedList.options.length )
	var selectableList=myform["allList"];
	for (i = selectedList.options.length -1; i >= 0; i--)  
	{ 
		//myform["vo.roles.roleID"].value = myform["vo.roles.roleID"].value + ',' +selectedList.options[i].value; 
		selectedList.options[i].selected = true; 
	} 

	//myform["vo.roles.roleID"].value = myform["vo.roles.roleID"].value.substring(1);
	//alert(myform["vo.roles.roleID"].value);
	return form_submit(myform,"Role_list");
	//return false;
} 
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
<ww:form id="role_info_form" name="role_info_form" namespace="/Role" action="RoleModify" method="post" validate="true" onsubmit="return onSubmit(this)">
<ww:hidden  name="vo.roleID"/>

<div class="page" layoutHeight="38">

<table >
<TR>
<TD align="right" width="40%"><xwohi:i18n text="Role.name"/></TD>
<TD width="60%"><ww:textfield name="vo.name" required="true"/></TD>
</TR>
<TR>
<TD align="right" width="40%"><xwohi:i18n text="Role.description"/></TD>
<TD width="60%"><ww:textarea name="vo.description" cols="40" rows="6" required="true"/></TD>
</TR>


<TR>
<TD align="right" width="40%"><xwohi:i18n text="Role.roleRes"/></TD>
<TD width="60%">
<TABLE>
<TR>
	<TD>
	<ww:select name="vo.resources.resourceID" listKey="resourceID" listValue="name" list="vo.resources" value="vo.resource.resourceID" size="7"  multiple="true" cssStyle="border:1pt solid #636563;font-size:9pt;width:120px"/>
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
</table>
</div>
				<div  style="height:25px;text-align:center;">
					  <input type="submit"  value="<xwohi:i18n text="submit" /> ">
					  <input type="reset" value="<xwohi:i18n text="reset" />">
					  <input type="button" value="<xwohi:i18n text="close" />" onclick="_window.closeCurrent()">
				</div>
</ww:form>


