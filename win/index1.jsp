<%@ page session="true" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<!doctype html>
<html>

<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type"/>
<title>JIME平台管理系统 </title>


	<link rel="stylesheet" href="../win/jqueryui/themes/cupertino/jquery-ui.min.css">
	<script src="../win/jqueryui/jquery-1.9.1.js"></script>
	<script src="../win/jqueryui/ui/jquery.ui.core.js"></script>
	<script src="../win/jqueryui/ui/jquery.ui.widget.js"></script>
	<script src="../win/jqueryui/ui/jquery.ui.accordion.js"></script>
	<script src="../win/jqueryui/ui/jquery.ui.mouse.js"></script>
	<script src="../win/jqueryui/ui/jquery.ui.resizable.js"></script>
	<link rel="stylesheet" href="../win/jqueryui/demos.css">
	<style>
	#accordion-resizer {
		padding: 10px;
		width: 180px;
		height: 400px;
		background:white;
	}
	</style>
  <style>
div.panel 
{
	BACKGROUND-COLOR:#E7F7FE;
	border:outset 1px;
	border:inset 1px;
	border:solid #C4F9FD 1px;	
	BORDER-COLOR:threedhighlight threedshadow threedshadow threedhighlight;
	empty-cells: show ;
    border-collapse: collaps;
	position:relative;
	padding:5px;
	border-spacing: 0;
	vertical-align:middle;
	white-space: nowrap;
    height:100%;
	width:100%;
}
div.panel .container 
{
	BACKGROUND-COLOR:#E7F7FE;
	border:outset 1px;
	border:inset 1px;
	border:solid #C4F9FD 1px;	
	BORDER-COLOR: threedshadow threedshadow threedhighlight threedhighlight;
	empty-cells: show ;
    border-collapse: collaps;
	position:relative;
	padding:5px;
	border-spacing: 0;
	vertical-align:middle;
	white-space: nowrap;
    height:100%;
	width:100%;
}
</style>
<script>
$(function() {
	var height=$(window).height()-$("#Toolbars").height()-$("#TopBar").height()-20-4;
  	$("#accordion-resizer").css("height",height);
	$( "#accordion-resizer" ).resizable({
			minHeight: height,
			maxHeight: height,
			minWidth: 180,
			resize: function() {
				$( "LeftMenu" ).css("width",$( "#accordion" ).width()+20);
				$( "MainFrame" ).css("left",$( "#accordion" ).width()+20);
				$( "#accordion" ).accordion( "refresh" );
			}
		});
	});

</script>
</head>

<body style="padding:0px;margin:0px;" SCROLL=NO>


<div id="LeftMenu"  class="panel" style="display:block" style="position:absolute; left:0px;top:81px; width:200px;height:100%;z-index:100000; border:solid 1px blue" >
	<div id="accordion-resizer" >
		<div id="accordion">

		</div>
	</div>
</div>

<script>
	$.get("MainMenu.jsp?t="+Math.random(),function(data,status){
			$( "#accordion" ).html(data);
			$("#accordion").accordion("refresh");

    });

function resetMainFrameSize()
{
	

	//resize the accordion menu

}

//resetMainFrameSize();

$(document).ready(function(){
	resetMainFrameSize();
})


$(window).resize(function(){
	resetMainFrameSize();
})

</script>

	<script>

	$(function() {
		$( "#accordion" ).accordion({
			heightStyle: "fill"
		});
	});
	</script>

</body>

</html>
