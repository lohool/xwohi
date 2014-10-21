<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<div class="page" style="left:0;top:0;width:100%; height:100%;">
<ww:form id="Department_list_form" name="Department_list_form" namespace="/Department"  action="DepartmentList" method="post"  onsubmit="return windowSearch(this);">
		<INPUT TYPE="hidden" name="page" value="<ww:property value="page" />">
		<INPUT TYPE="hidden" name="pageSize" value="<ww:property value="pageSize" />">
</ww:form>
	<div class="datagrid_wraper" style="border:solid 0px red;height:100%;width:100%;" >
		<div id="Department_list" class="datagrid" style="border:solid 0px red;">Loading...</div>
	</div>
</div>
<script>
	     $(document).ready(function() {
	          $("#Department_list").datagrid({
			  callname: 'Department_list',
			  toolbar:[
				  {"text":"Refresh","btnClass":"Refresh"},
				  {"text":"添加部门","btnClass":"Add","src":"/Department/DepartmentInput.action","width":550,"height":150},
				  {"text":"编辑部门信息","btnClass":"Edit","src":"/Department/DepartmentInfo.action?vo.id={0}&targetGrid=Department_list","width":550,"height":150},
				  {"text":"Delete","btnClass":"Delete","src":"/Department/DepartmentDelete.action?vo.id={0}&vo.state=2"},
				  {"text":"Delete","btnClass":"Delete","src":"/Department/DepartmentDelete.action?vo.id={0}&vo.state=1"},
				  ],
			  columns:[
				  "<xwohi:i18n text="ID" />",
				  "<xwohi:i18n text="Department.name" />",
				  "<xwohi:i18n text="Department.state" />"
			  ],
			  linkedForm:"Department_list_form",
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
				  "<ww:property value="state"/>"
				  ],
			   </ww:iterator>
			  ]
			  }
			  );
	     });


</script>
