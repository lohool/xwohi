<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
	<ww:form id="WorkOrderClass_select_form" name="WorkOrderClass_select_form" namespace="/WorkOrderClass"  action="WorkOrderClassList" method="post"   onsubmit="return windowSearch(this);">
		<INPUT TYPE="hidden" name="page" value="0">
		<INPUT TYPE="hidden" name="pageSize" value="-1">
		<INPUT TYPE="hidden" name="parentId" value="1">
	</ww:form>
	<div class="treegrid_wraper" style="border:solid 0px red;height:100%;width:100%;" >
		<div id="WorkOrderClass_select" class="treegrid" style="border:solid 0px red;">Loading...</div>
	</div>
<script>
	     $(document).ready(function() {
	          $("#WorkOrderClass_select").treegrid({
			  callname: 'WorkOrderClass_select',
			  //width: 200,
			  //height:300,
				//minus_height:40,
			  //multiple:true,
			  displayLayer:1,
			  columns:[
				  "<xwohi:i18n text="WorkOrderClass.name" />",
				  "<xwohi:i18n text="WorkOrderClass.creator" />",
				  "<xwohi:i18n text="WorkOrderClass.description" />",
				  "<xwohi:i18n text="WorkOrderClass.state" />",
				  "<xwohi:i18n text="WorkOrderClass.Select" />"
			  ],
			  //colwidth:[30,120,200],
			  linkedForm:"WorkOrderClass_select_form",
			  params:"parentId=1",
			  url:"WorkOrderClass/WorkOrderClassList.action",

			  onclick:function(row,data)
			  {
			  }
			  }
			  );
	     });


</script>
