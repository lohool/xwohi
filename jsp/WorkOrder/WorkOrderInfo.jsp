<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF8" %> 
<%@ taglib uri="webwork" prefix="ww" %>

<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<%
String a="A"+(int)(Math.random()*1000);
 request.setAttribute("a",a);
%>

<div class="page">
<ww:form id="WorkOrderInfo_form" namespace="/WorkOrder" action="WorkOrderModify" method="post" validate="true" onsubmit="return ajaxDatagridSubmit(this,'WorkOrder_list');">
<ww:hidden name="vo.id" />
<INPUT TYPE="hidden" NAME="vo.state" value="1">
<div class="container" layoutHeight="36" >
	<div class="content" style="position:relative;width:50%;float:left;top:0px;">
		<p><label class="label"><xwohi:i18n text="Class"/>:</label>
				<INPUT  TYPE="hidden" NAME="vo.workorderClass.id" style="width:50px" value="<ww:property value="vo.workorderClass.id" />">
				<INPUT  TYPE="text" NAME="workorderClass" readonly="true" style="width:100px" value="<ww:property value="vo.workorderClass.name" />">
				<INPUT TYPE="button" value="Sel..." onclick="openDialog('jsp/WorkOrder/WorkOrderClassSelect.jsp','Select WorkOrderClass',true,600,350)">
		</p>
		<P><label class="label"><xwohi:i18n text="Area"/>:</label>
			<select class="combox" name="vo.area.id" refId="w_combox_wo_province_<%=a%>" refUrl="Province/ProvinceSelectList.action?vo.area.id={val}&pageSize=-1">
				<option value="-1">----</option>
				<ww:action id="cl" name="AreaList" namespace="/Area" executeResult="false" >
					<ww:param name="pageSize">-1</ww:param>
				</ww:action>
				<ww:iterator value="#attr.cl.objList">
					<option value="<ww:property value="id" />"><ww:property value="name" /></option>
				</ww:iterator>
			</select>
		</p>
		<p><label class="label"><xwohi:i18n text="Province"/>:</label>
			<select class="combox" name="vo.province.id" id="w_combox_wo_province_<%=a%>" refId="w_combox_wo_city_<%=a%>" refUrl="City/CitySelectList.action?vo.province.id={val}&pageSize=-1" >
				<option value="-1">----</option>
			</select>
		</p>
		<p>
			<label class="label"><xwohi:i18n text="City"/>:</label>
			<select class="combox" name="vo.city.id" id="w_combox_wo_city_<%=a%>" >
				<option value="-1">----</option>
			</select>
			<input name="signin_mile" type="text" value="<ww:property  value="vo.city.name" />" readonly="readonly"/>
		</p>
		<p><label class="label" style="vertical-align:top;"><xwohi:i18n text="WorkOrder.content"/>:</label><ww:textarea  name="vo.content" cols="25" rows="7"/></p>
	</div>
	<div id="worklog_panel" style="position:absolute;float:right;top:0px;right:0px;width:50%;border:solid 1px #66CCCC" layoutHeight="150">
		<div id="worklog_list_datagrid_wraper" class="datagrid_wraper" >
		<div id="worklog_list_<%=a%>" class="datagrid" >Loading...</div>
		</div>
	</div>
	<div  style="position:absolute;float:right;bottom:36px;;right:0px;height:150px;width:50%;border:solid 1px #66CCCC" >
		<TEXTAREA id="worklog_panel_detail_<%=a%>" NAME="" ROWS="" COLS="" style="height:100%;width:99%;border:solid 0px #66CCCC"></TEXTAREA>
	</div>
</div>
<div class="panel" style="height:25px;text-align:center;">
	<span class="content" style="display:inline-block;width:30%;">
	   <ww:if test="#session.operation_user.isAccess(\"/WorkOrder/WorkOrderDelete.action\")==true">
      <input id="btn_save" type="submit"  value="<xwohi:i18n text="save" /> ">
      <input type="reset" value="<xwohi:i18n text="reset" />">
	  </ww:if>
	</span>
	<span class="content" style="display:inline-block;width:30%;">
      <input type="button" value="<xwohi:i18n text="close window" />" onclick="_window.closeCurrent()">
	</span>
	<span  class="content" style="display:inline-block;width:30%;" >
	   <ww:if test="#session.operation_user.isAccess(\"/WorkOrder/WorkOrderDelete.action\")==true">

	  <input type="button"  value="<xwohi:i18n text="Add Work Log" />" onclick="addWorkLog(<ww:property value="vo.id" />,<ww:property value="vo.workorderClass.id" />)">
      <input type="button"  value="<xwohi:i18n text="complete" />" onclick="makesure(<ww:property value="vo.id" />,<ww:property value="vo.workorderClass.id" />)">
	  </ww:if>
	</span>
</div>
</ww:form>
</div>
<ww:form id="WorkFlow_list_form_%{#request.a}" action="WorkFlowProcessList" method="post" name="WorkFlow_list_form" namespace="/WorkFlowProcess" onSubmit="return datagridSearch(this,'worklog_list')">
   <ww:hidden name="page" />
   <ww:hidden name="pageSize" />
</ww:form>
<script type="text/javascript">  
$(document).ready(function(){
	$(".combox").CascadingSelect();
})

</script>

<script>
function makesure(woId,classId)
{
openConfirm({
	title:"Confirm",
	content:"是否确定要完成处理，提交后该事务不能回退。",
	ok:function(){
		openDialog("WorkOrder/WorkOrderProcessAction.action?event=3&workorderId="+woId+"&workorderClassId="+classId+"&s=<%=a%>");
	}

});
 
}
function addWorkLog(woId,classId)
{
		openDialog("WorkOrder/WorkOrderProcessAction.action?event=1&workorderId="+woId+"&workorderClassId="+classId+"&s=<%=a%>","处理过程信息添加");
}
</script>

<script>

	     $(document).ready(function() {
	          $("#worklog_list_<%=a%>").datagrid({
			  callname: 'worklog_list_<%=a%>',
			  columns:[
				  "<xwohi:i18n text="WorkOrder.step" />",
				  "<xwohi:i18n text="WorkOrder.workorderClass" />",
				  "<xwohi:i18n text="WorkOrder.content" />"
			  ],
			  linkedForm:"WorkFlow_list_form_<%=a%>",
			  colwidth:[30,100],
			  params:"vo.workOrder.id=<ww:property value="vo.id" />",
			  url:"WorkFlowProcess/WorkFlowProcessList.action",
			  onclick:function(row,data){$("#worklog_panel_detail_<%=a%>").val(data[2])}
			  }
			  );
	     });

</script>
