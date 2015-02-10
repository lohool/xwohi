<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<%String a="A"+(int)(Math.random()*1000);%>
<%
	String name=request.getParameter("vo.name");
	if(name==null)name=""; 
%>
<ww:form id="WorkOrder_list_form" action="WorkOrderList" method="post" name="WorkOrder_list_form" namespace="/WorkOrder" onSubmit="return windowSearch(this)">
   <INPUT TYPE="hidden" NAME="groupId" value="<%=request.getParameter("groupId")%>">
   <INPUT TYPE="hidden" NAME="vo.name" value="<%=name%>">
   <ww:hidden name="page" />
   <ww:hidden name="pageSize" />
</ww:form>
<div class="page" >
	<div id="datagrid_wraper" class="datagrid_wraper" >
		<div id="WorkOrder_list" class="datagrid" >Loading...</div>
	</div>
</div>
<script>

	     $(document).ready(function() {
	          $("#WorkOrder_list").datagrid({
			  callname: 'WorkOrder_list',
			  toolbar:[
				  {"text":"Refresh","btnClass":"Refresh"},
				  {"text":"Add WorkOrder","btnClass":"Add","src":"WorkOrder/WorkOrderInput.action?targetGrid=WorkOrder_list","width":550,"height":330},
				  {"text":"工单信息:{0}","btnClass":"Edit","target":"window","src":"WorkOrder/WorkOrderInfo.action?vo.id={0}&targetGrid=WorkOrder_list","width":800,"height":330},
				  {"text":"Delete","btnClass":"Delete","target":"WorkOrder_panel","src":"WorkOrder/WorkOrderDelete.action?vo.id={0}&vo.state=2&groupId=<%=request.getParameter("groupId")%>"},
				  {"text":"Delete","btnClass":"Delete","target":"WorkOrder_panel","src":"WorkOrder/WorkOrderDelete.action?vo.id={0}&vo.state=1&groupId=<%=request.getParameter("groupId")%>"},
				  {"text":"WorkOrder Group:<ww:property value="vo.group.name"/>","btnClass":"text"},
				  ],
			  columns:[
				  "<xwohi:i18n text="ID" />",
				  "<xwohi:i18n text="WorkOrder.workorderClass" />",
				  "<xwohi:i18n text="WorkOrder.content" />",
				  "<xwohi:i18n text="WorkOrder.state" />"
			  ],
			  linkedForm:"WorkOrder_list_form",
			  //colwidth:[30,120,200],
			  pager:
				{
					"total":<ww:property value="resultSize"/>,
					"current_page":<ww:property value="page"/>,
					"pagesize":<ww:property value="pageSize"/>,
					"form":"WorkOrder_list_form"
				},
			  data: [
			  <ww:iterator value="objList">
				  [
				  "<ww:property value="id"/>",
				  "<ww:property value="workorderClass.name"/>",
				  "<ww:property value="content"/>",
				  "<ww:property value="state"/>"
				  ],
			   </ww:iterator>
			  ]
			  }
			  );
	     });

</script>
