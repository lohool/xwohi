<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<div class="page">
	<div id="aa" class="panel" >
		<ww:form id="Role_list_form" name="Role_list_form" namespace="/Role"  action="RoleList" method="post"   onsubmit="return windowSearch(this);">
		<ww:hidden name="page"></ww:hidden>
		<ww:hidden name="pageSize"></ww:hidden>
		<xwohi:i18n text="Role.name"/>:<input  type="text" name="vo.name" value="" id="Role_list_form_vo_name"/>
		<INPUT TYPE="submit" value="search" class="button">
		<INPUT TYPE="reset" value="reset" class="button">
		</ww:form>
	</div>
	<div class="datagrid_wraper"layoutHeight="32px">
		<div id="Role_list" class="datagrid" >Loading...</div>
	</div>
</div>
<script>
	     $(document).ready(function() {
	          $("#Role_list").datagrid({
			  callname: 'Role_list',
			  //width: 300,
			  //height:300,
				//minus_height:40,
			  //multiple:true,
			  toolbar:[
				  {"text":"Home","btnClass":"Home","src":"Role/RoleList.action"},
				  {"text":"Refresh","btnClass":"Refresh"},
				  {"text":"Separator","btnClass":"Separator"},
				  {"text":"Add User","btnClass":"Add","src":"Role/RoleInput.action","width":550,"height":330},
				  {"text":"Edit Role Info","btnClass":"Edit","src":"Operator/RoleInfoTab.jsp?vo.roleID={0}","width":700,"height":450},
				  {"text":"Delete","btnClass":"Delete","src":"Role/RoleDelete.action?vo.roleID={0}&vo.name={1}&vo.state=2"},
				  {"text":"Delete Test","btnClass":"Delete","src":"Role/RoleDelete.action?vo.roleID={0}"},
				  {"text":"Separator","btnClass":"Separator"},
				  {"text":"Printer","btnClass":"Printer","src":"Role/RoleInput.action","width":500,"height":300},
				  {"text":"Help","btnClass":"Help","target":"window","src":"Role/RoleInfo.action?vo.id=1","width":300,"height":200}
				  ],
			  columns:[
				  "<xwohi:i18n text="ID" />",
				  "<xwohi:i18n text="Role.name" />",
				  "<xwohi:i18n text="description" />"
			  ],
			  linkedForm:"Role_list_form",
			  colwidth:[40,150],
			  pager:
				{
					"total":<ww:property value="resultSize"/>,
					"current_page":<ww:property value="page"/>,
					"pagesize":<ww:property value="pageSize"/>,
					"form":""
				},
			  data: [
			  <ww:iterator value="objList">
				  [
				  "<ww:property value="roleID"/>",
				  "<ww:property value="name"/>",
				  "<ww:property value="description"/>"
				  ],
			   </ww:iterator>
			  ]
			  }
			  );
	     });

</script>
