<%@ page session="true" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<!DOCTYPE HTML>
<html>

<head>
<title>JIME Framework</title>


<link rel="stylesheet" href="/win/jqueryui/themes/cupertino/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/css/sortabletable.css" />
<link rel="stylesheet" type="text/css" href="/win/styles/_Window.css" />
<link rel="stylesheet" href="/win/styles/ui.css">
<link type="text/css" rel="stylesheet" href="/win/DataGrid/default/dhdatagrid.css"/>
<link type="text/css" rel="stylesheet" href="/win/DataGrid/default/paginate.css"/>

<link type="text/css" rel="stylesheet" href="/win/jquery-easyui/themes/default/menu.css"/>

<script src="/win/jsMessage.jsp" type="text/javascript"></script>

<script src="/win/jqueryui/jquery-1.9.1.js"></script>
<script src="/win/jqueryui/ui/jquery.ui.core.js"></script>
<script src="/win/jqueryui/ui/jquery.ui.widget.js"></script>
<script src="/win/jqueryui/ui/jquery.ui.accordion.js"></script>
<script src="/win/jqueryui/ui/jquery.ui.mouse.js"></script>
<script src="/win/jqueryui/ui/jquery.ui.resizable.js"></script>
<script src="/win/jqueryui/ui/jquery.ui.widget.js"></script>
<script src="/win/jqueryui/ui/jquery.ui.tabs.js"></script>
<script src="/win/jqueryui/ui/jquery.ui.draggable.js"></script>
<script src="/win/jqueryui/ui/jquery.ui.position.js"></script>

<script src="/win/jquery-easyui/src/jquery.menu.js"></script>
<script src="/win/jquery-easyui/src/jquery.parser.js"></script>

<script src="/win/js/_Window.js" type="text/javascript"></script>

<script src="/win/DataGrid/datagrid.js"></script>
<script src="/win/js/resize.js"></script>
<script src="/win/js/ui.js"></script>
<script src="/template/css_xhtml/validation.js"></script>

<style>
	#accordion-resizer {
		padding: 10px;
		width: 180px;
		height: 400px;
	}
</style>
</head>

<body >
<div id="TopBar" class="panel" style="z-index:10000;position:absolute; left:0;top:0; width:100%;height:30px;"> 
	<div style=" height:30px;float:right"> 
		<span ><ww:property value="#session.operation_user.name"/></span>
		<a class="separator" ></a>
		<a href="#" class="menuBarButton"  onclick="alert(_window.focusWindowId)" >Focus Win</a>
		<a href="#" class="menuBarButton"  onclick="openWorkWindow('http://www.baidu.com','我的任务')" >Window</a>
		<a href="#" class="menuBarButton"  onclick="openAlert('Alert Test!','Alert')" >Alert</a>
		<a href="#" class="menuBarButton"  onclick="openConfirm({content:'Confirm?',title:'Confirm',ok:function(){alert('Callback:Ok')},cancel:function(){alert('Callback:Cancel')}})" >Confirm</a>
		<a href="#" class="menuBarButton"  onclick="openDialog('/Operator/OperatorList.jsp','Modal Dialog',true)" >Inner Dialog</a>
		<a href="#" class="menuBarButton"  onclick="openDialog('/Operator/OperatorList.action','Modal Dialog')" >Outer Dialog</a>
		<a class="separator" ></a>
		<a href="#" class="menuBarButton"  onclick="openDialog('/crm/FAQList.html','·¢¶ÌÐÅ')" >FAQ</a>
		<a class="menuBarButton" >Help</a> 
		<a class="menuBarButton" href="/Logout.action" >Log Out</a> 
		<span >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>	
	</div>

</div>
<div id="LeftMenu"  class="panel" style="display:block;position:absolute; padding:0px; left:0px;top:42px; z-index:10001; " >
	<div id="accordion-resizer" class="container" style="background:transparent;">
		<div id="accordion" >
		</div>
	</div>
	<div id="hidenMenuButton"  style="position:absolute;width:6px;height:100%;top:0px;right:0px;padding:0px;">
	</div>
</div>

<div id="MainPanel"  class="MainPanel" style="position:absolute; left:200px;padding:0px; top:42px;z-index:0;background:transparent;">
	<div id="TaskbarPanel" class="panel"  style="width:100%;height:25px;padding: 0px;"> 
	<!--
			<span id="hidenMenuButton" class="hidenMenuButton" style="position:absolute;cursor:hand;z-index:1;left:0px;" onclick="hideMenu()">&lt;&lt;</span><div class="separator" style="float:left;"> </div>
	-->
		<div style="position:absolute;width:2px;height:25px;z-index:1;background-color:#E7F7FE;left:-2px;"></div>
		<div id="Taskbar"  style="position:absolute;z-index:0;height:25px;border:solid 0px red;left:0px"> </div>
		<div id="TaskbarFuncPanel" style="position:absolute;width:50px;height:25px;z-index:1;background-color:#E7F7FE;right:0px;">
			<span class="panel" style="width:10px;height:20px;cursor:default;border:solid 1px;float:right;" onclick="_window.ShowMenu(event)">▼</span>
			<span id="minAllWin" class="panel" style="width:10px;height:20px;border:solid 1px;float:right;cursor:default" onclick="_window.shrinkAll()"> </span>
			<div class="separator" style="float:right"> </div>
		</div>
	</div>

	<div id="MainFrame" class="panel" style="padding:0px">
<TEXTAREA id="text" NAME="text" ROWS="15" COLS="70" style="position:relative;left:200px;top:20px"></TEXTAREA>

	<a class="draggable" style="position:absolute; border:0;left:20px;top:20px;cursor:hand" ondblclick="openWorkWindow('/NotePad/NotePadList.action','Email')"  ><img src="images/icon/20071208160057107.png" width="60"></a>

	<a class="draggable" style="position:absolute; border:0;left:20px;top:100px;cursor:hand" ondblclick="openWorkWindow('/Document/ReceiveDocument.action','Email')" ><img src="images/icon/20071127133923221.png" width="60"></a>

	<a class="draggable" style="position:absolute; border:0;left:20px;top:180px;cursor:hand" ondblclick="openWorkWindow('http://www.google.com','Google')"><img src="images/icon/20071127133912736.png" width="60"></a>
	<a class="draggable" style="position:absolute; border:0;left:20px;top:260px;cursor:hand" ondblclick="openWorkWindow('http://www.google.com','Google')" ><img src="images/icon/20071208013719337.png" width="60"></a>
	<a class="draggable" style="position:absolute; border:0;left:100px;top:20px;cursor:hand" ondblclick="openWorkWindow('http://www.jq-school.com/','Google')" ><img src="images/icon/20071208160223428.png" width="60"></a>

	</div>
</div>
<!--
	<div style="float:left"><address><a href="#"><span onclick="openWindow('[url]/left.jsp', 'Menu', 'move=yes,resize=yes,left=0,top=0,width=168px,height=500');">Start</span> </a>| <span onclick="">Menu Demo</span>	Copyright ?2002 - 2005 </address></div>
	-->
<div id="Toolbars" class="panel" style="width:100%;height:0px;position:absolute;z-index:10002;display:none">
<!--
	<div   style="float:left;" ><a  onclick="openMenuWindow()" valign="middle" style="float:left;cursor:hand;text-align:center;vertical-align:middle;TEXT-DECORATION:none;width:100;height:28px;margin:0px;border:solid 0 blue;background-image:url(/images/10.gif);"><div style="text-align:center;vertical-align:middle;line-height:30px;height:30px;"><span style="vertical-align:middle"><img src="images/icon/20071208013751903.png" border=0 width="25"></span><font color="white" size="4"><I><B>Start</B></I></font></div></a><a class="separator"></a><a href="#" class="menuBarButton"><img src="images/largeicon/back.gif"  border="0" align="absmiddle" alt="ÓÃ»§¹ÜÀí" onclick="parent.mainFrame.history.go(-1)"></a><a href="#" class="menuBarButton"><img src="images/largeicon/forward.gif"  border="0" align="absmiddle" alt="ÓÃ»§¹ÜÀí" onclick="parent.mainFrame.history.go(1)"></a><a href="#" class="menuBarButton"><img src="images/largeicon/refresh.gif"  border="0" align="absmiddle" alt="Ë¢ÐÂ"onclick="parent.mainFrame.location.reload()"></a><a href="#" class="menuBarButton"><img src="images/largeicon/stop.gif"  border="0" align="absmiddle" alt="Stop" onclick="parent.mainFrame.stop()"></a><a class="separator"></a><a href="#" class="menuBarButton"><img src="images/largeicon/resource.gif"  border="0" align="absmiddle" alt="ÎÒµÄ¹¤×÷×ÀÃæ" onclick="parent.mainFrame.location='/System/Desktop.action'"></a><a href="#" class="menuBarButton"><img src="images/largeicon/scheme.gif"  border="0" align="absmiddle" alt="ÎÒµÄ¹¤×÷¼Æ»®" onclick="parent.mainFrame.location='/WeekScheme/WeekSchemeList.action'"></a><a href="#" class="menuBarButton"><img src="images/largeicon/paper.gif"  border="0" align="absmiddle" alt="ÊÕÎÄ" onclick="parent.mainFrame.location='/Document/ReceiveDocument.action'"></a><a href="#" class="menuBarButton"><img src="images/largeicon/doc.gif"  border="0" align="absmiddle" alt="ÎÒµÄ¼ÇÊÂ±¾" onclick="parent.mainFrame.location='/NotePad/NotePadList.action'"></a><a href="" class="menuBarButton"><img src="images/largeicon/email.gif"  height="30" border="0" align="absmiddle" alt="ÊÕÓÊ¼þ" onclick="parent.mainFrame.location='/InBox/InBoxList.action'"></a><a class="separator"></a><a href="#" class="menuBarButton"><img src="images/largeicon/user.gif"  border="0" align="absmiddle" alt="¸öÈË×ÊÁÏ²é¿´/ÐÞ¸Ä" onclick="parent.mainFrame.location='/Operator/MyselfInfo.action'"></a><a href="#" class="menuBarButton"><img src="images/largeicon/password.gif"  height="30" border="0" align="absmiddle" alt="ÐÞ¸ÄÃÜÂë" onclick="parent.mainFrame.location='/Operator/OperatorPwd.jsp'"></a><a href="" class="menuBarButton" target="_top"><img src="images/largeicon/exit.gif"  border="0" align="absmiddle" alt="ÍË³öÏµÍ³" onclick="parent.location='/Logout.jsp'"></a><a class="separator"></a>
	</div>
	-->
</div>
<script>

$(function() {
	$.get("win/MainMenu.jsp?t="+Math.random(),function(data,status){
			$( "#accordion" ).html(data);
			$("#accordion").accordion("refresh");

    });
	$( ".draggable" ).draggable({
		start: function() {
		},
		drag: function() {
		},
		stop: function() {
			$this=$(this);
			var left=parseInt($this.css("left"));
			var top=parseInt($this.css("top"));
			left =  Math.floor(left / 80) * 80+20;
			top =  Math.floor(top / 80) * 80+20;
			$this.css("left",left+"px");
			$this.css("top",top+"px");
		}
	});
});
function hideMenu()
{
	var leftMenu=document.getElementById("LeftMenu");
	if(leftMenu.style.display=="none")
	{
		leftMenu.style.display="block";
		$( "#hidenMenuButton" ).html("&lt;&lt;");
	}
	else 
	{
		leftMenu.style.display="none";
		$( "#hidenMenuButton" ).html("&gt;&gt;");
	}
	resetMainFrameSize();
}
function resetMainFrameSize()
{
	
	var mainPanel=document.getElementById("MainPanel");
	var toolbars=document.getElementById("Toolbars");
	var leftMenu=document.getElementById("LeftMenu");
	var topBar=document.getElementById("TopBar");
	var TaskbarPanel=document.getElementById("TaskbarPanel");
	//var h=document.documentElement.clientHeight-parseInt(toolbars.style.height)-parseInt(topBar.style.height) ;
	var h=$(window).height()-$("#TopBar").outerHeight();
	if(	toolbars.style.display!="none")
	{
		h-=$("#Toolbars").outerHeight()
	}
	var w=document.documentElement.clientWidth-parseInt($("#LeftMenu").css("width"))-15;
	var left=$( "#LeftMenu" ).width();
	if(	leftMenu.style.display!="block")
	{
		w+=parseInt($("#LeftMenu").css("width"));
		left=0;
	}
	$("#TopBar").css("width",document.documentElement.offsetWidth-12);//-padding*2-margin*2
	$("#LeftMenu").css("top",$("#TopBar").outerHeight());
	$("#LeftMenu").css("height",h-2);
	$("#TaskbarPanel").css("width",w+10);
	$("#Taskbar").css("width",w-$("#TaskbarFuncPanel").width());
	$("#MainPanel").css("width",w);
	$("#MainPanel" ).css("left",left+2);
	$("#MainFrame").css("height",h-$("#TaskbarPanel").outerHeight()-2);
	$("#MainFrame").css("width",w+10);
	$("#accordion-resizer").css("height",h-24);
	//$("#accordion").css("height",h-30);
	//leftMenu.style.height=h-4-parseInt($("#LeftMenu").css("padding"))*2-2;
	//toolbars.style.top=document.documentElement.clientHeight-parseInt(toolbars.style.height);
	$("#Toolbars").css("top",document.documentElement.clientHeight-parseInt(toolbars.style.height));
	toolbars.style.left=0;
	toolbars.style.width="100%";
	//resize the accordion menu

}
$(document).ready(function(){
	$.ajaxSetup({cache:false}); 
	$( "#accordion" ).accordion({
		heightStyle: "fill"
	});
	resetMainFrameSize();
	resizeMenu();
	WindowInit();
})

//resolve the resize event is invoked multiple times
var windowWidth=$(window).width() ;
var windowHeight=$(window).height() ;
$(window).resize(function(){
	var tmpWidth=$(window).width() ;
	var tmpHeight=$(window).height() ;
	if(tmpWidth!=windowWidth || tmpHeight!=windowHeight)
	{
		windowWidth=tmpWidth;
		windowHeight=tmpHeight;
		resetMainFrameSize();
		$("#accordion").accordion("refresh");
		_window.MaximizeExpand();
	}
})

function resizeMenu()
{
	//var height=$(window).height()-$("#Toolbars").height()-$("#TopBar").height()-parseInt($("#LeftMenu").css("padding"))*2-parseInt($("#TopBar").css("padding"))*2-parseInt($("#accordion-resizer").css("padding"))*2-10;
	var height=$(window).height()-$("#TopBar").outerHeight()-24;
	var toolbars=document.getElementById("Toolbars");
	if(	toolbars.style.display!="none")
	{
		height-=$("#Toolbars").outerHeight()
	}
	
	$( "#accordion-resizer" ).resizable({
			minHeight: height,
			maxHeight: height,
			minWidth: 180,
			resize: function() {
				//$("#LeftMenu").css("height",height);

				//$( "#LeftMenu" ).css("width",$( "#accordion" ).width()+20);
				//$( "#LeftMenu" ).css("height",height);
				var w=document.documentElement.clientWidth-parseInt($("#LeftMenu").css("width"))-14;
				$("#MainFrame").css("width",w+10);
				$("#TaskbarPanel").css("width",w+10);
				//$("#MainPanel").css("width",w+10);
				$( "#MainPanel" ).css("left",$( "#LeftMenu" ).width()+2);
				//$( "#accordion" ).css("height",height);
				$( "#accordion" ).accordion( "refresh" );
			}
		});
}
</script>


</body>

</html>
