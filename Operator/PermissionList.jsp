

<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<%String a="A"+(int)(Math.random()*1000);%>
<div class="page" >
<div class="panel" >
	<ww:form id="Permission_list_form" name="Permission_list_form" namespace="/Permission"  action="PermissionList" method="post" validate="true"  onsubmit="return windowSearch(this);">
		<INPUT TYPE="hidden" name="page" value="<ww:property value="page" />">
		<INPUT TYPE="hidden" name="pageSize" value="<ww:property value="pageSize" />">
		Name:<ww:textfield name="vo.name" />
		<INPUT TYPE="submit" value="search" class="button biground">
		<INPUT TYPE="reset" value="reset" class="button biground">
	</ww:form>
</div>
	<div class="datagrid_wraper" layoutHeight="34px">
		<div id="Permission_list_<%=a%>" class="datagrid" >Loading...</div>
	</div>
</div>
<script>
	     $(document).ready(function() {
	          $("#Permission_list_<%=a%>").datagrid({
			  callname: 'Permission_list_<%=a%>',
			  columns:[
				  "<xwohi:i18n text="ID" />",
				  "<xwohi:i18n text="Permission.name" />",
				  "<xwohi:i18n text="Permission.value" />",
				  "<xwohi:i18n text="Permission.uri" />",
				  "<xwohi:i18n text="Permission.dataObjectName" />",
				  "<xwohi:i18n text="Permission.dataGroup" />"
			  ],
			  linkedForm:"Permission_list_form",
			  pager:
				{
					"total":<ww:property value="resultSize"/>,
					"current_page":<ww:property value="page"/>,
					"pagesize":<ww:property value="pageSize"/>
				},
			  colwidth:[40],
			  data: [
			  <ww:iterator value="objList">
				  [
				  "<ww:property value="id"/>",
				  "<ww:property value="name"/>",
				  "<ww:property value="value"/>",
				  "<ww:property value="uri"/>",
				  "<ww:property value="dataGroup.dataObjectName"/>",
				  "<ww:property value="dataGroup.name"/>"
				  ],
			   </ww:iterator>
			  ]
			  }
			  );
	     });


</script>
