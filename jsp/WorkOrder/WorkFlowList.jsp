<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF8" %> 
<%@ taglib uri="webwork" prefix="ww" %>

<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<div class="page">
	<div class="container" style="height:340px;">
		<div id="workflow_m_panel" style="border:solid 1px #66CCCC">
			<div id="workflow_m_list_datagrid_wraper" class="datagrid_wraper">
				<div id="workflow_m_list" class="datagrid" >Loading...</div>
			</div>
		</div>
		<p>Description:</p>
		<div  style="height:110px;border:solid 1px #66CCCC" >
			<TEXTAREA id="workflow_m_panel_detail" style="height:107px;;width:99%;border:solid 0px #66CCCC"></TEXTAREA>
		</div>
	</div>
</div>
<ww:form id="WorkFlow_m_list_form" action="WorkFlowList" method="post" name="WorkFlow_list_form" namespace="/WorkFlow" onSubmit="return datagridSearch(this,'workflow_m_list')">
   <ww:hidden name="page" />
   <ww:hidden name="pageSize" />
</ww:form>

<script>
	     $(document).ready(function() {
	          $("#workflow_m_list").datagrid({
				  callname: 'workflow_m_list',
					  height:200,
				  toolbar:[
					  {"text":"Refresh","btnClass":"Refresh"},
					  {"text":"Separator","btnClass":"Separator"},
					  {"text":"Add User","btnClass":"Add","src":"WorkFlow/WorkFlowInput.action","width":550,"height":330},
					  {"text":"Edit WorkFlow Info","btnClass":"Edit","src":"Operator/WorkFlowInfoTab.jsp?vo.roleID={0}","width":700,"height":450},
					  {"text":"Delete","btnClass":"Delete","src":"WorkFlow/WorkFlowDelete.action?vo.roleID={0}&vo.name={1}&vo.state=2"},
					  ],
				  columns:[
					  "<xwohi:i18n text="WorkFlow.sequence" />",
					  "<xwohi:i18n text="WorkFlow.name" />",
					  "<xwohi:i18n text="WorkFlow.type" />",
					  "<xwohi:i18n text="WorkFlow.workOrderClass" />"
				  ],
				  linkedForm:"WorkFlow_m_list_form",
				  colwidth:[30,100],
				  params:"vo.workorderClass.id=<%=request.getParameter("vo.workorderClass.id")%>",
				  url:"WorkFlow/WorkFlowList.action",
				  onclick:function(row,data){
					  $("#workflow_m_panel_detail").val(data[7]);
				  }
			  }
			  );
	     });

</script>
