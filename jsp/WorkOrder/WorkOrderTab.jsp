<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF8" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<div class="page">
	<div id="tabs" class="tabs" layoutHeight="38">
		<ul class="header">
			<li><a href="jsp/WorkOrder/WorkOrderList.jsp?action=MyOpened">My Tasks</a></li>
			<li><a href="jsp/WorkOrder/WorkOrderList.jsp?action=AllOpened">All Opened Tasks</a></li>
			<li><a href="jsp/WorkOrder/WorkOrderList.jsp?action=AllMy">All My Tasks</a></li>
			<li><a href="jsp/WorkOrder/WorkOrderList.jsp?action=All">All Tasks</a></li>
			<li><a href="#tabs-1">Help</a></li>
		</ul>
		<div id="tabs-1">
				Work flow should be added from 1 to N, and the sequence must not be interupted.<br>
				While a Work Order was created, its class should not be changed, or its work flow <br>maybe has some confusion.
		</div>
	</div>
</div>
	<script>
	$(function() {
	});
	function modifyWOClass()
	{
		$("#WorkOrderClassModify_form").submit();
	}
	</script>
