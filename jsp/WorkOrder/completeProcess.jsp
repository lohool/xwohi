<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF8" %> 
<%@ taglib uri="webwork" prefix="ww" %>

<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>

<div class="page">
	<form method="post" name="operator_sel_form" id="operator_sel_form" action="jsp/WorkOrder/completeProcessResult.jsp" class="pageForm required-validate" onsubmit="return ajaxSubmit(this)">
	<INPUT TYPE="hidden" NAME="vo.id" value="<ww:property value="vo.id"/>">
	<INPUT TYPE="hidden" NAME="workorderId" value="<%=request.getParameter("workorderId")%>">
<div class="container" layoutHeight="36">
<div class="content" >
<p><label class="label">The Work Flow was finished.</label>
</p>
</div>
</div>
<div class="panel" style="height:25px;text-align:center;">
      <input type="button" value="<xwohi:i18n text="OK" />" onclick="_window.closeCurrent()">
</div>
</form>
</div>

