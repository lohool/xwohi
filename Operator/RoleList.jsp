<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<script type="text/javascript">
function form_submit(form)
{
		var win =_window.windows[_window.focusWindowId];
		win.SetContent("[url]"+form.action,$(form).find(":input").serialize());
		return false;
}
</script>
<div class="page" style="left:0;top:0;width:100%; height:100%;">
	<div class="panel" style="left:0;top:0; height:40px;">
		<ww:form id="Role_list_form" name="Role_list_form" namespace="/Role"  action="RoleList" method="post" validate="true"  onsubmit="return form_submit(this);">
		<ww:hidden name="page"></ww:hidden>
		<ww:hidden name="pageSize"></ww:hidden>
		<INPUT TYPE="text" NAME="vo.name">
		<INPUT TYPE="submit" class="button">
		</ww:form>
	</div>
	<div class="datagrid_wraper" style="border:solid 0px red;width:100%;" minus_height="52px">
		<div id="Role_list" class="datagrid" >Loading...</div>
	</div>
</div>
<script>
var i=0;
	     $(document).ready(function() {
	          $("#Role_list").datagrid({
			  callname: 'Role_list',
			  //width: 300,
			  //height:300,
				//minus_height:40,
			  //multiple:true,
			  toolbar:[
				  {"text":"Home","btnClass":"Home","src":"/Role/RoleList.action","width":500,"height":300},
				  {"text":"Refresh","btnClass":"Refresh","src":"/Role/RoleList.action","width":500,"height":300},
				  {"text":"Separator","btnClass":"Separator"},
				  {"text":"Add User","btnClass":"Add","src":"/Role/RoleInput.action","width":550,"height":330},
				  {"text":"Edit Role Info","btnClass":"Edit","src":"/Operator/RoleInfoTab.jsp?vo.roleID={0}","width":700,"height":450},
				  {"text":"Delete","btnClass":"Delete","src":"/Role/RoleDelete.action?vo.id={0}&vo.name={1}&vo.state=2"},
				  {"text":"Delete Test","btnClass":"Delete","src":"/Role/RoleDelete.action?vo.id={0}&vo.name={1}&vo.state=1"},
				  {"text":"Separator","btnClass":"Separator"},
				  {"text":"Printer","btnClass":"Printer","src":"/Role/RoleInput.action","width":500,"height":300},
				  {"text":"Help","btnClass":"Help","winType":"window","src":"/Role/RoleInfo.action?vo.id=1","width":300,"height":200}
				  ],
			  columns:[
				  "<xwohi:i18n text="ID" />",
				  "<xwohi:i18n text="name" />",
				  "<xwohi:i18n text="description" />"
			  ],
			  //colwidth:[30,120,200],
			  pager:
				{
					"total":<ww:property value="resultSize"/>,
					"current_page":<ww:property value="page"/>,
					"pagesize":<ww:property value="pageSize"/>,
					"form":"Role_list_form"
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
