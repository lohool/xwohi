<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF8" %> 
<%@ taglib uri="webwork" prefix="ww" %>

<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>

<div class="page">
<ww:form namespace="/WorkOrder" action="WorkOrderModify" method="post" validate="true" onsubmit="return ajaxDatagridSubmit(this,'WorkOrder_list');">
<ww:hidden name="vo.id" />
<INPUT TYPE="hidden" NAME="vo.state" value="1">
<div class="container" layoutHeight="36">
<div class="content" >
<p><ww:textfield  name="vo.account" label="%{getText('WorkOrder.account')}" /></p>
<p><ww:textfield  name="vo.name" label="%{getText('WorkOrder.name')}" /></p>
<p><label class="label"><xwohi:i18n text="Class"/>:</label>
		<INPUT  TYPE="hidden" NAME="vo.workorderClass.id" style="width:50px" value="<ww:property value="vo.workorderClass.id" />">
		<INPUT  TYPE="text" NAME="workorderClass" readonly="true" style="width:100px" value="<ww:property value="vo.workorderClass.name" />">
		<INPUT TYPE="button" value="Sel..." onclick="openDialog('jsp/WorkOrder/WorkOrderClassSelect.jsp','Select WorkOrderClass',true,600,350)">
</p>
<p><label class="label" style="vertical-align:top;"><xwohi:i18n text="WorkOrder.content"/>:</label><ww:textarea  name="vo.content" cols="40" rows="7"/></p>
</div>
</div>
<div class="panel" style="height:25px;text-align:center;">
	   <ww:if test="#session.operation_user.isAccess(\"/WorkOrder/WorkOrderDelete.action\")==true">
      <input type="submit"  value="<xwohi:i18n text="save" /> ">
      <input type="button"  value="<xwohi:i18n text="complete" />" onclick="">
	  </ww:if>
      <input type="reset" value="<xwohi:i18n text="reset" />">
      <input type="button" value="<xwohi:i18n text="close" />" onclick="_window.closeCurrent()">
</div>
</ww:form>
</div>
<script>
function makesure(woId,classId)
{
 var isAgreed=confirm("是否确定要完成处理，提交后该事务不能回退。");
 if(isAgreed)
 document.location="WorkOrder/WorkOrderProcessAction.action?action=3&workorderId="+woId+"&workorderClassId="+classId;
}
</script>