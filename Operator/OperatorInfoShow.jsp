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
<TD bgColor="#ffffff" align="right" width="40%"><xwohi:i18n text="Operator.password" />:</TD><TD bgColor="#ffffff" width="60%">
             <ww:password  name="vo.password" required="true"/>     
	  </TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" width="40%"><xwohi:i18n text="Operator.password2" />:</TD><TD bgColor="#ffffff" width="60%">
             <ww:password  name="vo.password2" required="true"/>     
	  </TD>
</TR>
<script>
form1['vo.password'].value="<ww:property value="vo.password" />";
form1['vo.password2'].value="<ww:property value="vo.password" />";
</script>
<TR>
	<TD bgColor="#ffffff" align="right" width="40%">
	<xwohi:i18n text="job" />:
	</TD>

<TD bgColor="#ffffff"  width="40%">
	<ww:select name="vo.job.id" listKey="id" listValue="name" list="select.job" value="vo.job.id"/>
</TD>
</TR>

<TR>
	<TD bgColor="#ffffff"  align="right" width="40%">
	<xwohi:i18n text="department" />:
	</TD>

<TD bgColor="#ffffff" width="40%">
	<ww:select name="vo.department.id" listKey="id" listValue="name" list="select.department" value="vo.department.id"/>
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
      <input type="button" onclick="window.close();" value="<xwohi:i18n text="close" /> ">
       </TD>
</TR>
</table>
</ww:form>
</div>
</div>
<script language="javascript"> 
<!-- 

function addConfirmer() 
{ 
	myform = document.form1; 
	var selectedList=myform["selectedList"];
	var selectableList=myform["allList"];
	for (i = 0; i < selectableList.options.length; i++) 
	{ 
		if (selectableList.options(i).selected == true) 
		{ 
			/*j = myform.selectedList.options.length - 1; 
				for (; j >= 0; j--)  
				{ 
					if (myform.selectableList.item(i).value == myform.selectedList.item(j).value)  
					{ 
						break; 
					} 
				} 
			if (j < 0) */
			{ 
			newOpt = new Option(selectableList.item(i).text, selectableList.item(i).value); 
			selectedList.add(newOpt); 
			} 
			selectableList.remove(i);
			i--;
		} 
	} 
} 

function removeConfirmer() 
{ 
	myform = document.form1; 
	var selectedList=myform["selectedList"];
	var selectableList=myform["allList"];

	/*
	myindex = 0; 
	for (; myindex < myform.selectedList.options.length; myindex++) 
	{ 
			if (myform.selectedList.options(myindex).value == myform.operatorID.value) 
			{ 
			break; 
			} 
	} 
	if (myindex == myform.selectedList.options.length) 
	{ 
	myindex = -1; 
	} 
	*/
	for (i = 0;i < selectedList.options.length ;  i++)  
    { 
        if (selectedList.options(i).selected == true)  
        { 
			newOpt = new Option(selectedList.item(i).text, selectedList.item(i).value); 
			selectableList.add(newOpt); 
            selectedList.remove(i); 
			i--;
		} 
    } 
} 
function getLists() 
{                            
	myform = document.form1; 

	myform["vo.rolesID"].value="";

	var selectedList=myform["selectedList"];
	var selectableList=myform["allList"];

	for (i = selectedList.options.length -1; i >= 0; i--)  
	{ 
		myform["vo.rolesID"].value = myform["vo.rolesID"].value + ',' +selectedList.item(i).value; 
	} 

	myform["vo.rolesID"].value = myform["vo.rolesID"].value.substring(1);
	//alert(myform["vo.rolesID"].value);
	myform.submit();
} 


//--> 
</script> 

</html>