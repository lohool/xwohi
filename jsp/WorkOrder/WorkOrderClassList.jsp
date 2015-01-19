<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
	<ww:form id="WorkOrderClass_list_form" name="WorkOrderClass_list_form" namespace="/WorkOrderClass"  action="WorkOrderClassList" method="post"   onsubmit="return windowSearch(this);">
		<INPUT TYPE="hidden" name="page" value="0">
		<INPUT TYPE="hidden" name="pageSize" value="-1">
		<INPUT TYPE="hidden" name="parentId" value="1">
	</ww:form>
	<div class="datagrid_wraper" style="border:solid 0px red;height:100%;width:100%;" >
		<div id="WorkOrderClass_list" class="datagrid" style="border:solid 0px red;">Loading...</div>
	</div>
<script>
	     $(document).ready(function() {
	          $("#WorkOrderClass_list").treegrid({
			  callname: 'WorkOrderClass_list',
			  //width: 200,
			  //height:300,
				//minus_height:40,
			  //multiple:true,
			  toolbar:[
				  {"text":"Refresh","btnClass":"Refresh"},
				  {"text":"Add User","btnClass":"Add","src":"WorkOrderClass/WorkOrderClassInput.action","width":550,"height":230},
				  {"text":"Edit WorkOrderClass Info","btnClass":"Edit","src":"WorkOrderClass/WorkOrderClassInfo.action?vo.id={1}","width":550,"height":230},
				  {"text":"Delete","btnClass":"Delete","src":"WorkOrderClass/WorkOrderClassDelete.action?vo.id={0}&vo.name={1}&vo.state=2"},
				  ],
			  columns:[
				  "<xwohi:i18n text="WorkOrderClass.name" />",
				  "<xwohi:i18n text="WorkOrderClass.creator" />",
				  "<xwohi:i18n text="WorkOrderClass.description" />",
				  "<xwohi:i18n text="WorkOrderClass.state" />"
			  ],
			  //colwidth:[30,120,200],
			  linkedForm:"WorkOrderClass_list_form",
			  params:"parentId=1",
			  url:"WorkOrderClass/WorkOrderClassList.action",

			  onclick:function(row,data)
			  {
			  }
			  }
			  );
	     });


</script>
