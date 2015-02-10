<%@ page contentType="text/html;charset=UTF8" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<%@ page import="com.xwohi.framework.util.*" %>
<script>
function saveWorkLog(form)
{
	return ajaxDatagridSubmit(form,'worklog_list_<%=request.getParameter("s")%>');
}
</script>
<div class="page">
<ww:form id="WorkOrderInfo_form" namespace="/WorkOrder" action="WorkOrderProcessAction" method="post" validate="true" onsubmit="return saveWorkLog(this)">
	<ww:hidden name="callInUniqueId" />
	<INPUT TYPE="hidden" NAME="event" value="2">
	<INPUT TYPE="hidden" NAME="workorderId" value="<ww:property value="workorderId" />">
	<INPUT TYPE="hidden" NAME="workorderClassId" value="<ww:property value="workorderClassId" />">
	<INPUT TYPE="hidden" NAME="number" value="">
		<div class="pageFormContent nowrap" layoutHeight="36">
			<div class="tabsContent">
				<p>
					<label>操作人：</label>
					<input name="processer" type="text" size="30" value="<ww:property value="user.name" />" readonly="readonly"/>
				</p>
				<p>
					<label>操作时间：</label>
					<input name="process_time" type="text" size="30" value="<%=TimeUtil.currentTime()%>" readonly="readonly"/>
				</p>
				<!-- 
				<p>
					<label>处理类型：</label>
					<ww:if test='callInUniqueId==null || callInUniqueId==""'>
					<input name="process_type" type="text" size="30" value="<ww:property value="taskFlow.processType.name" />" readonly="readonly"/>
					<INPUT TYPE="hidden" NAME="vo.processType.id" value="<ww:property value="taskFlow.processType.id" />">
					</ww:if>
					<ww:else>
					<input name="process_type" type="text" size="30" value="来电追加" readonly="readonly"/>
					</ww:else>
				</p>
				 -->
				<p>
					<label>流程环节：</label>
					<input name="flow_step" type="text" size="30" value="<ww:property value="taskFlow.name" />" readonly="readonly"/>
				</p>
				<ww:if test='vo.taskFlowType==1 && (callInUniqueId==null || callInUniqueId=="")'>
				<p>
					<label>审批：</label>
					<SELECT NAME="vo.checkResult">
						<OPTION VALUE="2">通过
						<OPTION VALUE="3" SELECTED>驳回
					</SELECT>
				</p>
				</ww:if>
			</div>
			<div class="divider"></div>
			<p>
				<label>处理内容：</label>
				<textarea name="vo.content" cols="50" rows="8" class="required"></textarea>
			</p>
		</div>
	<div class="panel" style="height:25px;text-align:center;">
		  <input type="submit"  value="<xwohi:i18n text="save" /> ">
		  <input type="reset" value="<xwohi:i18n text="reset" />">
		  <input type="button" value="<xwohi:i18n text="close" />" onclick="_window.closeCurrent()">
	</div>
</ww:form>
</div>
