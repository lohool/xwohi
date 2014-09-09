<!doctype html>
<html>

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type"/>
<title>CRM平台管理系统 </title>

<link rel="stylesheet" type="text/css" href="../css/coolbar.css" />

<link rel="stylesheet" type="text/css" href="../win/styles/index.css" />
<link rel="stylesheet" type="text/css" href="../win/styles/_Window.css" />
<script src="../win/js/_Window.js" type="text/javascript"></script>

	<link rel="stylesheet" href="../win/jqueryui/themes/cupertino/jquery-ui.min.css">
	<script src="../win/jqueryui/jquery-1.9.1.js"></script>
	<script src="../win/jqueryui/ui/jquery.ui.core.js"></script>
	<script src="../win/jqueryui/ui/jquery.ui.widget.js"></script>
	<script src="../win/jqueryui/ui/jquery.ui.accordion.js"></script>
	<script src="../win/jqueryui/ui/jquery.ui.mouse.js"></script>
	<script src="../win/jqueryui/ui/jquery.ui.resizable.js"></script>
	<script src="../win/jqueryui/ui/jquery.ui.draggable.js"></script>
	<link rel="stylesheet" href="../win/styles/ui.css">
	<style>
	#accordion-resizer {
		padding: 10px;
		width: 180px;
		height: 400px;
		background:white;
	}
	</style>

</head>

<body style="padding:0px;margin:0px;background:#D8F9FC" SCROLL="NO">

<!--
<div style="z-index:-100;position:absolute; left:0;top:0; width:100%;height:100%"><img src="../win/2.jpg" border=0 width="100%" height="100%"></div>
-->
<div id="TopBar" class="panel" style="z-index:100;position:absolute; left:0;top:0; width:100%;height:60px;"> 
				<div  class="panel" style="padding:0px;position:absolute; left:0;top:40px; height:30px;"> 
					<span style="float:right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>	
					<a class="menuBarButton" style="float:right">Log Out</a> <a class="menuBarButton" style="float:right">Help</a> 
					<a href="#" class="menuBarButton" style="float:right" onclick="openDialog('../crm/FAQList.html','发短信')" >FAQ</a>
					<a class="separator" style="float:right"> </a>
					<a href="#" class="menuBarButton" style="float:right" onclick="openDialog('../crm/sms.html','发短信')" >发短信</a>
					<a href="#" class="menuBarButton" style="float:right" onclick="openWorkWindow('../crm/MyAssignments.html','我的任务')" >我的任务</a>
				</div>

</div>
<div id="LeftMenu"  class="panel" style="display:block;position:absolute; left:0px;top:93px; width:200px;height:100%;z-index:100000; " >
	<div id="accordion-resizer" class="container" style="background:transparent">
		<div id="accordion" >
		</div>
	</div>
</div>

<div id="MainPanel" style="position:absolute; left:213px; top:73px;z-index:0;background:transparent">
	<div id="Taskbar" class="panel" style=" width:100%;height:30px;"> 
			<span class="menuBarButton">首页</span><a class="separator"> </a>
	</div>

	<div id="MainFrame" class="panel" >

		<a id="icon0" style="position:absolute; border:0;left:20px;top:20px;cursor:hand" ondblclick="openWorkWindow('../crm/WorkOrder_list.html','所有工单')"><img src="../images/icon/20071208160057107.png" width="60"></a>

		<a id="icon1" style="position:absolute; border:0;left:20px;top:120px;cursor:hand" ondblclick="openWorkWindow('../crm/inbox.html','Email')"><img src="../images/icon/20071127133923221.png" width="60"></a>

		<a id="icon2"  style="position:absolute; border:0;left:20px;top:220px;cursor:hand" ondblclick="openWorkWindow('../crm/System_Setting.html','系统管理')" ><img src="../images/icon/20071127133912736.png" width="60"></a>
		<a id="icon3"  style="position:absolute; border:0;left:20px;top:320px;cursor:hand" ondblclick="openWorkWindow('http://www.baidu.com','baidu')" ><img src="../images/icon/20071208013719337.png" width="60"></a>
		<a id="icon4"  style="position:absolute; border:0;left:20px;top:420px;cursor:hand" ondblclick="openWorkWindow('../win/jqueryui/demos/slider/multiple-vertical.html','Slider')" ><img src="../images/icon/20071208160223428.png" width="60"></a>

	</div>
</div>

<div id="Toolbars"  style="width:100%;height:0px;position:absolute;z-index:1;">
<!--
	<div style="float:left"><address><a href="#"><span onclick="openWindow('[url]../left.jsp', 'Menu', 'move=yes,resize=yes,left=0,top=0,width=168px,height=500');">Start</span> </a>| <span onclick="">Menu Demo</span>	Copyright ?2002 - 2005 </address></div>
	-->
	<!--
	<div   style="float:left;" ><a  onclick="openMenuWindow()" valign="middle" style="float:left;cursor:hand;text-align:center;vertical-align:middle;TEXT-DECORATION:none;width:100;height:28px;margin:0px;border:solid 0 blue;background-image:url(/images/10.gif);"><div style="text-align:center;vertical-align:middle;line-height:30px;height:30px;"><span style="vertical-align:middle"><img src="/images/icon/20071208013751903.png" border=0 width="25"></span><font color="white" size="4"><I><B>Start</B></I></font></div></a><a class="separator"></a><a href="#" class="menuBarButton"><img src="../images/largeicon/back.gif"  border="0" align="absmiddle" alt="用户管理" onclick="parent.mainFrame.history.go(-1)"></a><a href="#" class="menuBarButton"><img src="../images/largeicon/forward.gif"  border="0" align="absmiddle" alt="用户管理" onclick="parent.mainFrame.history.go(1)"></a><a href="#" class="menuBarButton"><img src="../images/largeicon/refresh.gif"  border="0" align="absmiddle" alt="刷新"onclick="parent.mainFrame.location.reload()"></a><a href="#" class="menuBarButton"><img src="../images/largeicon/stop.gif"  border="0" align="absmiddle" alt="Stop" onclick="parent.mainFrame.stop()"></a><a class="separator"></a><a href="#" class="menuBarButton"><img src="../images/largeicon/resource.gif"  border="0" align="absmiddle" alt="我的工作桌面" onclick="parent.mainFrame.location='/System/Desktop.action'"></a><a href="#" class="menuBarButton"><img src="../images/largeicon/scheme.gif"  border="0" align="absmiddle" alt="我的工作计划" onclick="parent.mainFrame.location='/WeekScheme/WeekSchemeList.action'"></a><a href="#" class="menuBarButton"><img src="../images/largeicon/paper.gif"  border="0" align="absmiddle" alt="收文" onclick="parent.mainFrame.location='/Document/ReceiveDocument.action'"></a><a href="#" class="menuBarButton"><img src="../images/largeicon/doc.gif"  border="0" align="absmiddle" alt="我的记事本" onclick="parent.mainFrame.location='/NotePad/NotePadList.action'"></a><a href="" class="menuBarButton"><img src="../images/largeicon/email.gif"  height="30" border="0" align="absmiddle" alt="收邮件" onclick="parent.mainFrame.location='/InBox/InBoxList.action'"></a><a class="separator"></a><a href="#" class="menuBarButton"><img src="../images/largeicon/user.gif"  border="0" align="absmiddle" alt="个人资料查看/修改" onclick="parent.mainFrame.location='/Operator/MyselfInfo.action'"></a><a href="#" class="menuBarButton"><img src="../images/largeicon/password.gif"  height="30" border="0" align="absmiddle" alt="修改密码" onclick="parent.mainFrame.location='/Operator/OperatorPwd.jsp'"></a><a href="" class="menuBarButton" target="_top"><img src="../images/largeicon/exit.gif"  border="0" align="absmiddle" alt="退出系统" onclick="parent.location='/Logout.jsp'"></a><a class="separator"></a>
	-->
	</div>
</div>
<script type="text/javascript" src="../win/js/ui.js?v=08.01.03"></script>
<script>
</script>
<script>

$(function() {
		$( "#accordion" ).accordion({
			heightStyle: "fill"
		});
	$.get("./MainMenu.jsp?t="+Math.random(),function(data,status){
			$( "#accordion" ).html(data);
			$("#accordion").accordion("refresh");

    });
	});

function resetMainFrameSize()
{

	var toolbars=document.getElementById("Toolbars");
	var h=$(window).height()-$("#Toolbars").innerHeight()-$("#TopBar").innerHeight();
	var w=$(window).width()-$("#LeftMenu").innerWidth();
	/*
	if(	leftMenu.style.display!="block")
	{
		w-=parseInt(leftMenu.style.width);
	}
	*/
	$("#MainPanel").css("height",h-16);
	$("#MainPanel").css("width",w-16);
	$("#MainFrame").css("height",h-26-$("#Taskbar").height());
	$("#MainFrame").css("width",w-16);
	$("#LeftMenu").css("height",h-14);
	$("#LeftMenu").css("top",$("#TopBar").innerHeight()+3);//parseInt($("#TopBar").css("height"))+parseInt($("#TopBar").css("padding"))*2 +3);

	toolbars.style.top=$(window).height()-$("#Toolbars").innerHeight();//document.documentElement.clientHeight-parseInt(toolbars.style.height);
	toolbars.style.left=0;
	toolbars.style.width="100%";

}
$(function() {
	var height=$(window).height()-$("#Toolbars").innerHeight()-$("#TopBar").innerHeight()-($("#LeftMenu").innerHeight()-$("#LeftMenu").height())-($("#accordion-resizer").innerHeight()-$("#accordion-resizer").height())-10;

  	$("#accordion-resizer").css("height",height);
	$( "#accordion-resizer" ).resizable({
			minHeight: height,
			maxHeight: height,
			minWidth: 180,
			resize: function() {
				$( "#LeftMenu" ).css("width",$( "#accordion" ).width()+20);
				$( "#MainPanel" ).css("left",$( "#accordion" ).width()+20+13);
				//resetMainFrameSize();
				$( "#accordion" ).accordion( "refresh" );
			}
		});
	});



$(document).ready(function(){
	resetMainFrameSize();
})


$(window).resize(function(){
	resetMainFrameSize();
})

</script>

	<script>

	$(function() {
		$( "#icon0" ).draggable();
		$( "#icon1" ).draggable();
		$( "#icon2" ).draggable();
		$( "#icon3" ).draggable();
		$( "#icon4" ).draggable();
	});
	</script>

</body>

</html>
