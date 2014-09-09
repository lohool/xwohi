<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <title>Best Html Tab Panel using CSS and Javascript</title>
  <link rel="stylesheet" href="tab.css" type="text/css" />
<script src="/js/fun.js" type="text/javascript"></script>
<script src="tab.js" type="text/javascript"></script>

<link href="/css/style.css" rel="stylesheet">
<link href="/css/sortabletable.css" rel="StyleSheet" type="text/css">

</head>

<body onload="bodyOnLoad()"  onResize="raisePanel(currentMenuIndex)">

<!-- ========================= BEGIN of tabbed-frame div ======================== -->

<div id="tabFrame">

<div id="tabMenuDiv">
<span class="tabMenu" id="tabMenu0" onClick="return raisePanel(0)" onMouseOver="mouseOver(0)" onMouseOut="mouseOut(0)" >
   Info</span>
<span class="tabMenu" id="tabMenu1" onClick="return raisePanel(1)" onMouseOver="mouseOver(1)" onMouseOut="mouseOut(1)">
   Data Permission</span>
</div>

<div class="tabPane" id="tabPane0" src="/Role/RoleInfo.action?vo.roleID=<%=request.getParameter("vo.roleID")%>">
Loading...
</div>

<div class="tabPane" id="tabPane1" src="/Role/RoleDataPermission.action?vo.roleID=<%=request.getParameter("vo.roleID")%>">
Loading...
</div>


<div id="tabFiller" style="height:375px;"></div>

</div>
<!-- ========================= end of tabbed-frame div ======================== -->
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

	myform["vo.resources.resourceID"].value="";

	var selectedList=myform["selectedList"];
	var selectableList=myform["allList"];

	for (i = selectedList.options.length -1; i >= 0; i--)  
	{ 
		myform["vo.resources.resourceID"].value = myform["vo.resources.resourceID"].value + ',' +selectedList.item(i).value; 
	} 

	myform["vo.resources.resourceID"].value = myform["vo.resources.resourceID"].value.substring(1);
	alert(myform["vo.resources.resourceID"].value);
	myform.submit();
} 


//--> 
</script> 

</body>

</html>