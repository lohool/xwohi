<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF8" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<div class="page">
	<div id="tabs" class="tabs" layoutHeight="38">
		<ul>
			<li><a href="WorkOrderClass/WorkOrderClassInfo.action?vo.id=<%=request.getParameter("vo.id")%>">Basic Info</a></li>
			<li><a href="jsp/WorkOrder/WorkFlowList.jsp?vo.workorderClass.id=<%=request.getParameter("vo.id")%>">Work Flow</a></li>
			<li><a href="#tabs-1">Help</a></li>
		</ul>
		<div id="tabs-1">
				Work flow should be added from 1 to N, and the sequence must not be interupted.<br>
				While a Work Order was created, its class should not be changed, or its work flow <br>maybe has some confusion.
		</div>
	</div>
				<div class="panel" style="height:25px;text-align:center;">
					  <input type="button"  value="<xwohi:i18n text="Save" />" onclick="modifyWOClass()">
					  <input type="reset" value="<xwohi:i18n text="reset" />">
					  <input type="button" value="<xwohi:i18n text="close" />" onclick="_window.closeCurrent()">
				</div>
</div>
	<script>
	$(function() {
		$( "#tabs" ).tabs({
			cache: false,
			beforeLoad: function( event, ui ) {
				ui.jqXHR.error(function() {
					ui.panel.html(
						"Couldn't load this tab. We'll try to fix this as soon as possible. "  );
				});
			}
		});
	});
	function modifyWOClass()
	{
		$("#WorkOrderClassModify_form").submit();
	}
	</script>
