<%@ page session="true" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>

<div class="page" style="height:100%">
	<div id="Album_panel" class="panel" style="position:absolute;left:0px;width:200px;height:100%;" layoutHeight="12"> 
		<ww:action id="cg" name="AlbumList" namespace="/Album" executeResult="true">
			<ww:param name="pageSize" value="100" />
		</ww:action>
	</div>
	<div id="File_panel" class="panel" style="position:absolute;left:211px;width:100%;height:100%;" layoutWidth="633" layoutHeight="12"> 
		<div  style="width:100%;height:100%;border:solid 1px #CAE4FF;background-color:#FFFFFF" > </div>
	</div>
	<div id="Img_panel" class="panel" style="position:absolute;text-align:center;right:0px;width:400px;height:100%;"  layoutHeight="12"> 
			<img id="img_preview_panel" style="width:95%;" ></div>
	</div>
</div>
<script>
	function showImage(src)
	{
		$("#img_preview_panel").attr("src",src); 
	}
</script>