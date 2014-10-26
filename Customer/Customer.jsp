<%@ page session="true" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<div class="page" style="height:100%">
	<div class="panel" style="height:30px">
	        <ww:form action="CustomerList" method="post" name="Customer_list_form" namespace="/Customer" validate="true" theme="simple" onsubmit="return panelSearch(this,'customer_panel');">
			Name:<INPUT TYPE="text" NAME="vo.name">
			Group:
			<ww:action id="cg0" name="CustomerGroupList" namespace="/CustomerGroup" executeResult="false">
			<ww:param name="pageSize" value="100" />
			</ww:action>
			<select name="groupId">
					<option value=""><xwohi:i18n text="All" /></option>
				<ww:iterator value="#attr.cg0.objList">
				  <ww:if test="#session.operation_user.isPermitted(\"CustomerGroup\",id,1)==true">
					<option value="<ww:property value="id"/>" <ww:if test="vo.group.id==id">selected</ww:if>><ww:property value="name"/></option>
				  </ww:if>
				</ww:iterator>
			</select>
			<INPUT TYPE="submit" class="button biground">
            </ww:form>
	</div>
	<div id="customer_group_panel" class="panel" style="position:absolute;left:0px;top:30px;width:200px;height:100%;border:solid 0px red" layoutHeight="40"> 
		<ww:action id="cg" name="CustomerGroupList" namespace="/CustomerGroup" executeResult="true">
			<ww:param name="pageSize" value="100" />
		</ww:action>
	</div>
	<div id="customer_panel" class="panel" style="position:absolute;left:211px;top:30px;width:100%;height:100%;border:solid 0px red" layoutWidth="222" layoutHeight="40"> 
		<div  style="top:0px;width:100%;height:100%;border:solid 1px #CAE4FF;background-color:#FFFFFF" > </div>
	</div>
</div>
