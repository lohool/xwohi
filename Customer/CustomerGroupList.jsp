<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<%String a="A"+(int)(Math.random()*1000);%>
	<ww:form id="CustomerGroup_list_form" name="CustomerGroup_list_form" namespace="/CustomerGroup"  action="CustomerGroupList" method="post"   onsubmit="return panelSearch(this,'customer_group_panel');">
		<INPUT TYPE="hidden" name="page" value="0">
		<INPUT TYPE="hidden" name="pageSize" value="-1">
	</ww:form>
	<div class="datagrid_wraper" style="border:solid 0px red;height:100%;width:100%;" >
		<div id="CustomerGroup_list" class="datagrid" style="border:solid 0px red;">Loading...</div>
	</div>
<script>
	     $(document).ready(function() {
	          $("#CustomerGroup_list").datagrid({
			  callname: 'CustomerGroup_list',
			  width: 200,
			  //height:300,
				//minus_height:40,
			  //multiple:true,
			  toolbar:[
				  {"text":"Refresh","btnClass":"Refresh"},
				  {"text":"Add User","btnClass":"Add","src":"CustomerGroup/CustomerGroupInput.action","width":550,"height":230},
				  {"text":"Edit CustomerGroup Info","btnClass":"Edit","src":"CustomerGroup/CustomerGroupInfo.action?vo.id={1}","width":550,"height":230},
				  {"text":"Delete","btnClass":"Delete","src":"CustomerGroup/CustomerGroupDelete.action?vo.id={0}&vo.name={1}&vo.state=2"},
				  ],
			  columns:[
				  "<xwohi:i18n text="CustomerGroup.name" />"
			  ],
			  //colwidth:[30,120,200],
			  pager:
				{
					"total":0,
					"current_page":0,
					"pagesize":-1
				},
			  linkedForm:"CustomerGroup_list_form",
			  data: [
			  <ww:iterator value="objList">
				  [
				  "<a href='Customer/CustomerList.action?groupId=<ww:property value="id" />&vo.group.name=<ww:property value="name" />' target='customer_panel' ><ww:property value="name"/></a>",
				  "<ww:property value="id"/>"
				  ],
			   </ww:iterator>
			  ],
			  onclick:function(row,data)
			  {
			  }
			  }
			  );
	     });


</script>
