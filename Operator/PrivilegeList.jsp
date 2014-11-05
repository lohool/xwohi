<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<div class="page">
<div class="panel">
	<ww:form id="Privilege_list_form" name="Privilege_list_form" namespace="/Privilege"  action="PrivilegeList" method="post" validate="true"  onsubmit="return windowSearch(this);">
		<INPUT TYPE="hidden" name="page" value="<ww:property value="page" />">
		<INPUT TYPE="hidden" name="pageSize" value="<ww:property value="pageSize" />">
		Name:<ww:textfield name="vo.name" />
		<INPUT TYPE="submit" value="search" class="button biground">
		<INPUT TYPE="reset" value="reset" class="button biground">
	</ww:form>
</div>
	<div class="datagrid_wraper" layoutHeight="34px">
		<div id="Privilege_list" class="datagrid">Loading...</div>
	</div>
</div>
<script>
	     $(document).ready(function() {
	          $("#Privilege_list").datagrid({
			  callname: 'Privilege_list',
			  columns:[
				  "<xwohi:i18n text="ID" />",
				  "<xwohi:i18n text="Privilege.name" />",
				  "<xwohi:i18n text="Privilege" />",
				  "<xwohi:i18n text="URL" />"
			  ],
			  linkedForm:"Privilege_list_form",
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
				  "<ww:property value="PrivilegeID"/>",
				  "<ww:property value="name"/>",
				  "<ww:property value="getText(resource.name)"/>",
				  "<ww:property value="url"/>"
				  ],
			   </ww:iterator>
			  ]
			  }
			  );
	     });


</script>
