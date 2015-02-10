<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF8" %> 
<%@ taglib uri="webwork" prefix="ww" %>

<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>

<div class="page">
	<form method="post" name="operator_sel_form" id="operator_sel_form" action="WorkFlowProcess/WorkFlowProcessModify.action" class="pageForm required-validate" onsubmit="return send_operator_form(this)">
	<INPUT TYPE="hidden" NAME="vo.id" value="<ww:property value="vo.id"/>">
	<INPUT TYPE="hidden" NAME="workorderId" value="<%=request.getParameter("workorderId")%>">
<INPUT TYPE="hidden" NAME="vo.state" value="1">
<div class="container" layoutHeight="36">
<div class="content" >
<p><ww:textfield  name="vo.account" label="%{getText('WorkOrder.account')}" /></p>
<p><ww:textfield  name="vo.name" label="%{getText('WorkOrder.name')}" /></p>
<p><label class="label"><xwohi:i18n text="Operator"/>:</label>
		<INPUT  TYPE="hidden" NAME="vo.operator.id" style="width:50px" value="<ww:property value="vo.operator.id" />">
		<INPUT  TYPE="text" NAME="operatorName" readonly="true" style="width:100px" value="<ww:property value="vo.operator.name" />">
		<INPUT TYPE="button" value="Sel..." onclick="openDialog('Operator/OperatorSelector/OperatorList.jsp','Select WorkFlow Processor',false,600,350)">
</p>
<p><label class="label" style="vertical-align:top;"><xwohi:i18n text="WorkOrder.content"/>:</label><ww:textarea  name="vo.content" cols="40" rows="7"/></p>
</div>
</div>
<div class="panel" style="height:25px;text-align:center;">
      <input type="submit"  value="<xwohi:i18n text="save" /> ">
      <input type="reset" value="<xwohi:i18n text="reset" />">
</div>
</form>
</div>

<script>
function bringBack(formId,json)
{
	form = document.getElementById(formId); 
	//var json = eval('(' + values + ')');
	for( a in json)
	{
		if(form[a])
		form[a].value=json[a];
	}
}
function send_operator_form(form)
{
	var operatorSelform = document.getElementById("operator_sel_form"); 
	if(operatorSelform["vo.operator.id"].value=="" || operatorSelform["vo.operator.id"].value==null)
	{
		alert("请选择工单处理人");
		return false;
	}
	//return ajaxDatagridSubmit(form,"worklog_list",function callback(){$("#WorkOrderInfo_form").find("#btn_save").attr("disabled",true); ;});
	return ajaxDatagridSubmit(form,"worklog_list_<%=request.getParameter("s")%>");

}
</script>