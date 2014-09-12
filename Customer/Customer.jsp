<%@ page session="true" %>
<%@ page contentType="text/html;charset=gb2312" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<div class="page" style="height:100%">
	<div id="customer_group_panel" class="panel" style="width:200px;height:100%;border:solid 0px red" layoutHeight="10"> 
		<ww:action id="cg" name="CustomerGroupList" namespace="/CustomerGroup" executeResult="true">
			<ww:param name="pageSize" value="100" />
		</ww:action>
	</div>
	<div id="customer_panel" class="panel" style="position:absolute;left:211px;top:0px;width:100%;height:100%;border:solid 0px red" layoutWidth="222" layoutHeight="10"> 
	</div>
</div>
