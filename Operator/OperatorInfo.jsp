<%@ page session="true" %>
<%@ page contentType="text/html;charset=gb2312" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>

<script> 

function addConfirmer() 
{ 
	myform = document.getElementById("operator_info_form"); 
	var selectedList=myform["selectedList"];
	var selectableList=myform["allList"];
	for (i = 0; i < selectableList.options.length; i++) 
	{ 
		//	alert(selectableList.options[i].text)
		if (selectableList.options[i].selected == true) 
		{ 
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
	var selectedList=myform["selectedList"];
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
function onSubmit(form) 
{                            
	//myform = document.operator_info_form; 

	myform["vo.roles.roleID"].value="";

	var selectedList=myform["selectedList"];
	var selectableList=myform["allList"];

	for (i = selectedList.options.length -1; i >= 0; i--)  
	{ 
		//myform["vo.roles.roleID"].value = myform["vo.roles.roleID"].value + ',' +selectedList.options[i].value; 
		selectedList.options[i].selected = true; 
	} 

	myform["vo.roles.roleID"].value = myform["vo.roles.roleID"].value.substring(1);
	//alert(myform["vo.roles.roleID"].value);
	return form_submit(form,'window');
	//return false;
} 

</script> 
<script>
$(document).ready(function(){
	operator_info_form['vo.password'].value="<ww:property value="vo.password" />";
	operator_info_form['vo.password2'].value="<ww:property value="vo.password" />";
})
</script>
<script type="text/javascript">
function form_submit(form,type)
{
		alert(form.action )
		alert(unescape($(form).find(":input").serialize() ))
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
					alert("current window id:"+_window.focusWindowId)
					var win =_window.windows[_window.focusWindowId];
					alert("parent window id:"+win.parentWindow)
					var parentWin=_window.windows[win.parentWindow];
					if(data.forwardUrl && data.forwardUrl!="")parentWin.SetContent("[url]"+data.forwardUrl);
					win.Close();
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

<ww:form id="operator_info_form" name="operator_info_form" namespace="/Operator"  action="OperatorModify" method="post" validate="true" theme="simple" onsubmit=" return onSubmit(this);">

<table width="100%" align="left" height="100%" cellspacing="0" cellpadding="0" id="input_table" class="sort-table" style="float:left;position:relative;top:0px;">

<ww:hidden  name="vo.id"/>
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
	<ww:select name="selectedList" listKey="roleID" listValue="name" list="vo.roles" value="vo.roles.roleID" size="7"  multiple="true" cssStyle="border:1pt solid #636563;font-size:9pt;width:100px"  />
	    <INPUT TYPE="hidden" NAME="vo.roles.roleID">

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
