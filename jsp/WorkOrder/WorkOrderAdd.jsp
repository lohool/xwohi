<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF8" %> 
<%@ taglib uri="webwork" prefix="ww" %>

<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>

<div class="page">
<ww:form name="WorkOrder_add_form" id="WorkOrder_add_form" namespace="/WorkOrder" action="WorkOrderAdd" method="post" validate="true" onsubmit="return ajaxDatagridSubmit(this,'WorkOrder_list');">
<INPUT TYPE="hidden" NAME="vo.state" value="1">
<div class="container" layoutHeight="36">
<div class="content" >
<p><ww:textfield  name="vo.title" label="%{getText('WorkOrder.title')}" style="width:300px"/></p>



<p><label class="label"><xwohi:i18n text="Class"/>:</label>
		<INPUT  TYPE="text" NAME="vo.workorderClass.id" style="width:50px">
		<INPUT  TYPE="text" NAME="workorderClass" readonly="true" style="width:100px">
		<INPUT  TYPE="text" NAME="classCode" readonly="true">
		<INPUT TYPE="button" value="Sel..." onclick="openDialog('jsp/WorkOrder/WorkOrderClassSelect.jsp','Select WorkOrderClass',true,600,350)">
</p>
<P><label class="label"><xwohi:i18n text="Area"/>:</label>
	<select class="combox" name="vo.area.id" refId="w_combox_wo_province" refUrl="Province/ProvinceSelectList.action?vo.area.id={val}&pageSize=-1">
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
	<select class="combox" name="vo.province.id" id="w_combox_wo_province" refId="w_combox_wo_city" refUrl="City/CitySelectList.action?vo.province.id={val}&pageSize=-1" >
		<option value="-1">----</option>
	</select>
</p>
<p>
	<label class="label"><xwohi:i18n text="City"/>:</label>
	<select class="combox" name="vo.city.id" id="w_combox_wo_city" >
		<option value="-1">----</option>
	</select>
</p>
<p><label class="label" style="vertical-align:top;"><xwohi:i18n text="WorkOrder.content"/>:</label><ww:textarea  name="vo.content" cols="40" rows="7"/></p>
</div>
</div>
<div class="panel" style="height:25px;text-align:center;">
	   <ww:if test="#session.operation_user.isAccess(\"/WorkOrder/WorkOrderDelete.action\")==true">
      <input type="submit"  value="<xwohi:i18n text="save" /> ">
	  </ww:if>
      <input type="reset" value="<xwohi:i18n text="reset" />">
      <input type="button" value="<xwohi:i18n text="close" />" onclick="_window.closeCurrent()">
</div>
</ww:form>
</div>
<script type="text/javascript">  
$(document).ready(function(){
$(".combox").CascadingSelect(); //ÉèÖÃ³õÊ¼ÖµÎª0,1,4 
})

</script>
