<%@ page session="true" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>

<div class="page" >
<ww:form name="form1" namespace="/Department" action="DepartmentAdd" method="post" validate="true" onsubmit="return ajaxDatagridSubmit(this,'Department_list');">
	<div class="container" layoutHeight="38">
		<div class="content" >
			<br>
			<br>
			<br>
			<p><ww:textfield  name="vo.name" label="%{getText('Department.name')}" /></p>
		</div>
	</div>
	<div class="panel" style="height:25px;text-align:center;">
		   <ww:if test="#session.operation_user.isAccess(\"/Department/DepartmentDelete.action\")==true">
		  <input type="submit"  value="<xwohi:i18n text="submit" /> ">
		  </ww:if>
		  <input type="reset" value="<xwohi:i18n text="reset" />">
		  <input type="button" value="<xwohi:i18n text="close" />" onclick="_window.closeCurrent()">
	</div>
</ww:form>
</div>
