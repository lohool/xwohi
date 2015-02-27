<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<%String a="WO"+(int)(Math.random()*1000);%>
<%
	request.setAttribute("a",a);
	String name=request.getParameter("vo.name");
	if(name==null)name=""; 
	String action=request.getParameter("action");
	request.setAttribute("action",action);
%>
<div class="panel">
<ww:form id="WorkOrder_list_form_%{#request.action}" action="%{#request.action}WorkOrderList" method="post" name="WorkOrder_list_form" namespace="/WorkOrder" onSubmit="return datagridSearch(this,'WorkOrder_list_%{#request.action}')">
   <ww:hidden name="page" />
   <ww:hidden name="pageSize" />
   Start Time:<INPUT TYPE="text" NAME="beginTime">
   End Time:<INPUT TYPE="text" NAME="endTime">
   <INPUT TYPE="reset"><INPUT TYPE="submit">
</ww:form>
</div>
	<div id="datagrid_wraper" class="datagrid_wraper" >
		<div id="WorkOrder_list_<%=action%>" class="datagrid" >Loading...</div>
	</div>
<script>

	     $(document).ready(function() {
	          $("#WorkOrder_list_<%=action%>").datagrid({
			  callname: 'WorkOrder_list',
			  showToolbarText:true,
			  toolbar:[
				  {"text":"Refresh","btnClass":"Refresh"},
				  {"text":"Add WorkOrder","btnClass":"Add","src":"WorkOrder/WorkOrderInput.action?type=<%=action%>&targetGrid=WorkOrder_list","width":550,"height":330},
				  {"text":"工单信息[:{0}]","btnClass":"Edit","target":"window","src":"WorkOrder/WorkOrderInfo.action?vo.id={0}&targetGrid=WorkOrder_list"},
				  {"text":"Delete","btnClass":"Delete","target":"WorkOrder_panel","src":"WorkOrder/WorkOrderDelete.action?vo.id={0}&vo.state=2&groupId=<%=request.getParameter("groupId")%>"},
				  {"text":"Separator","btnClass":"Separator"},
				  {"text":"Add Log","display":"text","btnClass":"ico","ico":"images/blue_round/edit_page.png","target":"window","src":"Operator/OperatorInfo.action?vo.id={0}"},
				  {"text":"Next","display":"text","btnClass":"ico","ico":"images/blue_round/next.png","target":"window","src":"Operator/OperatorInfo.action?vo.id={0}"},
				  {"text":"Invalid","display":"text","btnClass":"ico","ico":"images/blue_round/next.png","target":"window","src":"Operator/OperatorInfo.action?vo.id={0}"},
				  {"text":"Duplicated","display":"text","btnClass":"ico","ico":"images/blue_round/next.png","target":"window","src":"Operator/OperatorInfo.action?vo.id={0}"},
				  {"text":"Reopen","display":"text","btnClass":"ico","ico":"images/blue_round/next.png","target":"window","src":"Operator/OperatorInfo.action?vo.id={0}"},
				  {"text":"Separator","btnClass":"Separator"},
				  {"text":"Cancel","display":"text","btnClass":"ico","ico":"images/blue_round/delete.png","target":"window","src":"WorkOrder/WorkOrderDelete.action?vo.id={0}&vo.state=2&groupId=<%=request.getParameter("groupId")%>"},
				  {"text":"Close","display":"text","btnClass":"ico","ico":"images/blue_round/delete.png","target":"window","src":"WorkOrder/WorkOrderDelete.action?vo.id={0}&vo.state=2&groupId=<%=request.getParameter("groupId")%>"},
				  {"text":"WorkOrder Group:<ww:property value="vo.group.name"/>","btnClass":"text"},
				  ],
			  columns:[
				  "<xwohi:i18n text="ID" />",
				  "<xwohi:i18n text="WorkOrder.workorderClass" />",
				  "<xwohi:i18n text="WorkOrder.processor" />",
				  "<xwohi:i18n text="WorkOrder.title" />",
				  "<xwohi:i18n text="WorkOrder.state" />"
			  ],
			  linkedForm:"WorkOrder_list_form_<%=action%>",
			  colwidth:[30,80,80],
			  url:"WorkOrder/<%=action%>WorkOrderList.action",
			  onclick:function(row,data)
			  {
					$("#WorkOrder_list_<%=a%>").datagrid("enableAllButton");
					if(data[0]==1)$("#WorkOrder_list_<%=a%>").datagrid("disableButton","Edit");
			   }
			  });
	     });

</script>
