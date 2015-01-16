
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<%String a="A"+(int)(Math.random()*1000);%>
<div class="page">
	<div class="datagrid_wraper">
		<div id="DataGroup_list_<%=a%>" class="datagrid">Loading...</div>
	</div>
</div>
<script>
	     $(document).ready(function() {
	          $("#DataGroup_list_<%=a%>").datagrid({
			  callname: 'DataGroup_list_<%=a%>',
			  columns:[
				  "<xwohi:i18n text="ID" />",
				  "<xwohi:i18n text="DataGroup.name" />",
				  "<xwohi:i18n text="DataGroup.URI" />",
				  "<xwohi:i18n text="DataGroup.dataObjectKeyName" />",
				  "<xwohi:i18n text="DataGroup.dataObjectName" />",
				  "<xwohi:i18n text="DataGroup.groupObjectName" />",
				  "<xwohi:i18n text="DataGroup.groupObjectKeyName" />",
				  "<xwohi:i18n text="DataGroup.nameSpace" />"
			  ],
			  toolbar:[
				  {"text":"Home","btnClass":"Home","src":"/Role/RoleList.action"},
				  {"text":"Refresh","btnClass":"Refresh"},
				  {"text":"Separator","btnClass":"Separator"},
				  {"text":"Add User","btnClass":"Add","src":"/Role/RoleInput.action","width":550,"height":330},
				  {"text":"Edit Role Info","btnClass":"Edit","target":"window","src":"/Operator/RoleInfoTab.jsp?vo.roleID={0}","width":700,"height":450},
				  {"text":"Delete","btnClass":"Delete","src":"/Role/RoleDelete.action?vo.roleID={0}&vo.name={1}&vo.state=2"},
				  {"text":"Delete Test","btnClass":"Delete","src":"/Role/RoleDelete.action?vo.roleID={0}"},
				  {"text":"Separator","btnClass":"Separator"},
				  {"text":"Printer","btnClass":"Printer","src":"/Role/RoleInput.action","width":500,"height":300},
				  {"text":"Help","btnClass":"Help","target":"window","src":"/Role/RoleInfo.action?vo.id=1","width":300,"height":200}
				  ],
			  linkedForm:"DataGroup_list_form",
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
				  "<ww:property value="URI"/>",
				  "<ww:property value="dataObjectKeyName"/>",
				  "<ww:property value="dataObjectName"/>",
				  "<ww:property value="groupObjectName"/>",
				  "<ww:property value="groupObjectKeyName"/>",
				  "<ww:property value="nameSpace"/>"
				  ],
			   </ww:iterator>
			  ]
			  }
			  );
	     });


</script>
