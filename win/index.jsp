<%@ page session="true" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<!doctype html>
<html>

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type"/>
<title>JIME平台管理系统 </title>

<link rel="stylesheet" type="text/css" href="/css/coolbar.css" />

<link rel="stylesheet" type="text/css" href="/win/styles/index.css" />
<link rel="stylesheet" type="text/css" href="/win/styles/_Window.css" />
<script src="/win/js/_Window.js" type="text/javascript"></script>
<script src="/win/js/drag.js" type="text/javascript"></script>


<link href="/css/style.css" rel="StyleSheet" type="text/css" />
<link href="/css/sortabletable.css" rel="StyleSheet" type="text/css" />
<link href="/css/rowColorTable.css" rel="StyleSheet" type="text/css" />
<link href="/menu/menu.css" rel="StyleSheet" type="text/css" />


<script src="/js/fun.js" ></script>
<script src="/js/sortabletable.js" ></script>
<script src="/js/rowColorTable.js" ></script>
<link rel="stylesheet" href="/win/jqueryui/themes/cupertino/jquery-ui.min.css" />
<script src="/win/jqueryui/jquery-1.9.1.js"></script>
<script src="/win/jqueryui/ui/jquery.ui.core.js"></script>
<script src="/win/jqueryui/ui/jquery.ui.widget.js"></script>
<script src="/win/jqueryui/ui/jquery.ui.accordion.js"></script>
<script src="/win/jqueryui/ui/jquery.ui.mouse.js"></script>
<script src="/win/jqueryui/ui/jquery.ui.resizable.js"></script>
<script src="/win/jqueryui/ui/jquery.ui.widget.js"></script>
<script src="/win/jqueryui/ui/jquery.ui.tabs.js"></script>

<link rel="stylesheet" href="/win/styles/ui.css">
<link type="text/css" rel="stylesheet" href="/win/DataGrid/default/dhdatagrid.css"/>
<link type="text/css" rel="stylesheet" href="/win/DataGrid/default/paginate.css"/>
<script language="javascript" src="/win/DataGrid/datagrid.js"></script>
<script src="/win/js/resize.js" type="text/javascript"></script>



<style>

	#accordion-resizer {
		padding: 10px;
		width: 180px;
		height: 400px;
		background:white;
	}
</style>


</head>

<body style="padding:0px;margin:0px;overflow-x:hidden;overflow-y:hidden" SCROLL=NO >
<div style="z-index:-100;position:absolute; left:0;top:0; width:100%;height:100%"><!--<img src="win/2.jpg" border=0 width="100%" height="100%">--></div>
<div id="TopBar" class="panel" style="z-index:1000;position:absolute; left:0;top:0; width:100%;height:30px;"> 
	<div  class="panel" style="position:absolute; left:0;top:0px; width:100%;height:px;"> 
		<span style="float:right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>	
		<a class="menuBarButton" href="/Logout.action" style="float:right">Log Out</a> 
		<a class="menuBarButton" style="float:right">Help</a> 
		<a href="#" class="menuBarButton" style="float:right" onclick="openDialog('/crm/FAQList.html','发短信')" >FAQ</a>
		<a class="separator" style="float:right"> </a>
		<a href="#" class="menuBarButton" style="float:right" onclick="openDialog('/Operator/OperatorList.action','Modal Dialog')" >全屏模式对话框</a>
		<a href="#" class="menuBarButton" style="float:right" onclick="openDialog('/Operator/OperatorList.action','Modal Dialog',true)" >内部模式对话框</a>
		<a href="#" class="menuBarButton" style="float:right" onclick="openWorkWindow('/crm/MyAssignments.html','我的任务')" >我的任务</a>
		<a href="#" class="menuBarButton" style="float:right" onclick="alert(_window.focusWindowId)" >Focus Win</a>
		<a class="separator" style="float:right"> </a>
		<a href="#" class="menuBarButton" style="float:right"  ><ww:property value="#session.operation_user.name"/></a>
	</div>

</div>
<div id="LeftMenu"  class="panel" style="display:block;position:absolute; padding:0px; left:0px;top:45px; height:100%;z-index:1001; " >
	<div id="accordion-resizer" class="container" style="background:transparent">
		<div id="accordion" >
		</div>
	</div>
</div>

<div id="MainPanel"  class="panel" style="position:absolute; left:200px;padding:0px; top:43px;z-index:0;background:transparent;">
	<div id="Taskbar" class="panel"  style="width:100%;height:30px;"> 
			<span class="menuBarButton">首页</span><a class="separator"> </a>
	</div>

	<div id="MainFrame" class="panel" >
<TEXTAREA id="text" NAME="text" ROWS="15" COLS="70"></TEXTAREA>

	<a  style="position:absolute; border:0;left:20px;top:20px;cursor:hand" ondblclick="openWorkWindow('/NotePad/NotePadList.action','Email')" onmousedown="dragStart(this)" ondragstart='return false' onselectstart='return false'><img src="images/icon/20071208160057107.png" width="60"></a>

	<a  style="position:absolute; border:0;left:20px;top:120px;cursor:hand" ondblclick="openWorkWindow('/Document/ReceiveDocument.action','Email')" onmousedown="dragStart(this)" ondragstart='return false' onselectstart='return false'><img src="images/icon/20071127133923221.png" width="60"></a>

	<a  style="position:absolute; border:0;left:20px;top:220px;cursor:hand" ondblclick="openWorkWindow('http://www.google.com','Google')" onmousedown="dragStart(this)" ondragstart='return false' onselectstart='return false'><img src="images/icon/20071127133912736.png" width="60"></a>
	<a  style="position:absolute; border:0;left:20px;top:320px;cursor:hand" ondblclick="openWorkWindow('http://www.google.com','Google')" onmousedown="dragStart(this)" ondragstart='return false' onselectstart='return false'><img src="images/icon/20071208013719337.png" width="60"></a>
	<a  style="position:absolute; border:0;left:100px;top:20px;cursor:hand" ondblclick="openWorkWindow('http://www.jq-school.com/','Google')" onmousedown="dragStart(this)" ondragstart='return false' onselectstart='return false'><img src="images/icon/20071208160223428.png" width="60"></a>

	</div>
</div>
<!--
	<div style="float:left"><address><a href="#"><span onclick="openWindow('[url]/left.jsp', 'Menu', 'move=yes,resize=yes,left=0,top=0,width=168px,height=500');">Start</span> </a>| <span onclick="">Menu Demo</span>	Copyright ?2002 - 2005 </address></div>
	-->
<div id="Toolbars" class="panel" style="width:100%;height:5px;position:absolute;z-index:1002;">
<!--
	<div   style="float:left;" ><a  onclick="openMenuWindow()" valign="middle" style="float:left;cursor:hand;text-align:center;vertical-align:middle;TEXT-DECORATION:none;width:100;height:28px;margin:0px;border:solid 0 blue;background-image:url(/images/10.gif);"><div style="text-align:center;vertical-align:middle;line-height:30px;height:30px;"><span style="vertical-align:middle"><img src="images/icon/20071208013751903.png" border=0 width="25"></span><font color="white" size="4"><I><B>Start</B></I></font></div></a><a class="separator"></a><a href="#" class="menuBarButton"><img src="images/largeicon/back.gif"  border="0" align="absmiddle" alt="用户管理" onclick="parent.mainFrame.history.go(-1)"></a><a href="#" class="menuBarButton"><img src="images/largeicon/forward.gif"  border="0" align="absmiddle" alt="用户管理" onclick="parent.mainFrame.history.go(1)"></a><a href="#" class="menuBarButton"><img src="images/largeicon/refresh.gif"  border="0" align="absmiddle" alt="刷新"onclick="parent.mainFrame.location.reload()"></a><a href="#" class="menuBarButton"><img src="images/largeicon/stop.gif"  border="0" align="absmiddle" alt="Stop" onclick="parent.mainFrame.stop()"></a><a class="separator"></a><a href="#" class="menuBarButton"><img src="images/largeicon/resource.gif"  border="0" align="absmiddle" alt="我的工作桌面" onclick="parent.mainFrame.location='/System/Desktop.action'"></a><a href="#" class="menuBarButton"><img src="images/largeicon/scheme.gif"  border="0" align="absmiddle" alt="我的工作计划" onclick="parent.mainFrame.location='/WeekScheme/WeekSchemeList.action'"></a><a href="#" class="menuBarButton"><img src="images/largeicon/paper.gif"  border="0" align="absmiddle" alt="收文" onclick="parent.mainFrame.location='/Document/ReceiveDocument.action'"></a><a href="#" class="menuBarButton"><img src="images/largeicon/doc.gif"  border="0" align="absmiddle" alt="我的记事本" onclick="parent.mainFrame.location='/NotePad/NotePadList.action'"></a><a href="" class="menuBarButton"><img src="images/largeicon/email.gif"  height="30" border="0" align="absmiddle" alt="收邮件" onclick="parent.mainFrame.location='/InBox/InBoxList.action'"></a><a class="separator"></a><a href="#" class="menuBarButton"><img src="images/largeicon/user.gif"  border="0" align="absmiddle" alt="个人资料查看/修改" onclick="parent.mainFrame.location='/Operator/MyselfInfo.action'"></a><a href="#" class="menuBarButton"><img src="images/largeicon/password.gif"  height="30" border="0" align="absmiddle" alt="修改密码" onclick="parent.mainFrame.location='/Operator/OperatorPwd.jsp'"></a><a href="" class="menuBarButton" target="_top"><img src="images/largeicon/exit.gif"  border="0" align="absmiddle" alt="退出系统" onclick="parent.location='/Logout.jsp'"></a><a class="separator"></a>
	</div>
	-->
</div>
<script type="text/javascript" src="win/js/ui.js?v=08.01.03"></script>
<script>
function openWorkWindow(url,title)
{
	openWindow('[url]'+url, title, 'move=yes,resize=yes,left=200,top=30,width=500px,height=300');
}
function openDialog(url,title,isWinDialog,width,height)
{
	var w=width?width:470;
	var h=height?height:350;
	if(isWinDialog==true)
	{
	_openWindowDialog('[url]'+url, title,_window.focusWindowId ,'maximize=no,minimize=no,move=yes,resize=yes,left=200,top=30,width='+w+'px,height='+h+'px,minWidth='+w+',minHeight='+h);
	}
	else
	{
	_openDialog('[url]'+url, title,_window.focusWindowId ,'maximize=no,minimize=no,move=yes,resize=yes,left=200,top=30,width='+w+'px,height='+h+'px,minWidth='+w+',minHeight='+h);
	}
}
function openAlert(url,title)
{
	openAlertWindow('[url]'+url, title, 'maximize=no,minimize=no,move=yes,resize=yes,left=400,top=150,width=470px,height=350px');
}
</script>
<script>

$(function() {
	$.get("win/MainMenu.jsp?t="+Math.random(),function(data,status){
			$( "#accordion" ).html(data);
			$("#accordion").accordion("refresh");

    });
	});
function resetMainFrameSize()
{
	
	var mainPanel=document.getElementById("MainPanel");
	var toolbars=document.getElementById("Toolbars");
	var leftMenu=document.getElementById("LeftMenu");
	var topBar=document.getElementById("TopBar");
	var Taskbar=document.getElementById("Taskbar");
	//var h=document.documentElement.clientHeight-parseInt(toolbars.style.height)-parseInt(topBar.style.height) ;
	var h=$(window).height()-$("#Toolbars").height()-$("#TopBar").height() ;
	var w=document.documentElement.clientWidth-parseInt($("#LeftMenu").css("width"))-10;
	if(	leftMenu.style.display!="block")
	{
		w-=parseInt(leftMenu.style.width);
	}
	$("#MainPanel").css("width",w);
	$("#MainFrame").css("height",h-parseInt(Taskbar.style.height)-38);
	$("#MainFrame").css("width",w);
	$("#Taskbar").css("width",w);
	$("#LeftMenu").css("height",h);
	$("#accordion-resizer").css("height",h-30);
	$("#accordion").css("height",h-30);
	//leftMenu.style.height=h-4-parseInt($("#LeftMenu").css("padding"))*2-2;
	leftMenu.style.top=parseInt($("#TopBar").css("height"))+parseInt($("#TopBar").css("padding"))*2 +3;
	//toolbars.style.top=document.documentElement.clientHeight-parseInt(toolbars.style.height);
	$("#Toolbars").css("top",document.documentElement.clientHeight-parseInt(toolbars.style.height));
	toolbars.style.left=0;
	toolbars.style.width="100%";

	//resize the accordion menu

}
$(document).ready(function(){
	resetMainFrameSize();
	resizeMenu();
})


$(window).resize(function(){
	resetMainFrameSize();
	$("#accordion").accordion("refresh");
})

function resizeMenu()
{
	//var height=$(window).height()-$("#Toolbars").height()-$("#TopBar").height()-parseInt($("#LeftMenu").css("padding"))*2-parseInt($("#TopBar").css("padding"))*2-parseInt($("#accordion-resizer").css("padding"))*2-10;
	var height=$(window).height()-$("#Toolbars").height()-$("#TopBar").height()-50;
  	$("#accordion-resizer").css("height",height);
	
	$( "#accordion-resizer" ).resizable({
			minHeight: height,
			maxHeight: height,
			minWidth: 180,
			resize: function() {
				$( "#LeftMenu" ).css("width",$( "#accordion" ).width()+20);
				//$( "#LeftMenu" ).css("height",height);
				$( "#MainPanel" ).css("left",$( "#accordion" ).width()+20);
				//$( "#accordion" ).css("height",height);
				$( "#accordion" ).accordion( "refresh" );
			}
		});
}


</script>

<script>

	$(function() {
		$( "#accordion" ).accordion({
			heightStyle: "fill"
		});
	});

$(document).ready(function(){
	$.ajaxSetup({cache:false}); 
	reDefineHTMLActions();
})
</script>

</body>

</html>
