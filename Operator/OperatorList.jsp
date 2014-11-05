<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<div class="page">
<div id="aa" class="panel">
	<ww:form id="operator_list_form" name="operator_info_form" namespace="/Operator"  action="OperatorList" method="post"   onsubmit="return datagridSearch(this,'operator_list');">
		<INPUT TYPE="hidden" name="page" value="<ww:property value="page" />">
		<INPUT TYPE="hidden" name="pageSize" value="<ww:property value="pageSize" />">
		<INPUT TYPE="hidden" name="vo.state" value="1">
		Name:<INPUT TYPE="text" NAME="vo.name" />
		<INPUT TYPE="submit" value="search" class="button biground">
		<INPUT TYPE="reset" value="reset" class="button biground">
		<INPUT TYPE="button" value="Refresh" class="button biground" onclick='$("#operator_list").datagrid("refresh")'>
		<INPUT TYPE="button" value="selected rows" class="button biground" onclick='alert($("#operator_list").datagrid("select"))'>
		<INPUT TYPE="button" value="resize datagrid" class="button biground" onclick='$("#operator_list").datagrid("resize",500,300)'>
	</ww:form>
</div>
<div id="operator_list_datagrid_wraper" class="datagrid_wraper" style="border:solid 0px red;width:100%;padding:0px" layoutHeight="34px">
<div id="operator_list" class="datagrid" >Loading...</div>
</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
	          $("#operator_list").datagrid({
			  callname: 'operator_list',
			  multiple:true,
		      showToolbarText:true,
			  toolbar:[
				  {"text":"Home","btnClass":"Home","target":"self","src":"Operator/OperatorList.jsp"},
				  {"text":"Refresh","btnClass":"Refresh"},
				  {"text":"Separator","btnClass":"Separator"},
				  {"text":"添加用户","btnClass":"Add","src":"Operator/OperatorInput.action","width":550,"height":330},
				  {"text":"Edit Operator","btnClass":"Edit","src":"Operator/OperatorInfo.action?vo.id={0}","width":600,"height":400},
				  {"text":"Delete","btnClass":"Delete","src":"Operator/OperatorDelete.action?vo.id={0}&vo.name={1}&vo.state=2"},
				  {"text":"Delete Test","btnClass":"Delete","src":"Operator/OperatorDelete.action?vo.id={0}&ids={0}&vo.state=1"},
				  {"text":"Separator","btnClass":"Separator"},
				  {"text":"Printer","btnClass":"Printer","src":"Operator/OperatorInput.action","width":500,"height":300},
				  {"text":"Help","btnClass":"Help","target":"window","src":"Operator/OperatorInfo.action?vo.id=1","width":300,"height":200},
				  {"text":"Separator","btnClass":"Separator"},
				  {"text":"Win Test","display":"text","btnClass":"test1","target":"window","src":"Operator/OperatorInfo.action?vo.id={0}"},
				  {"text":"JS Test","display":"text","btnClass":"test1","target":"window","src":"javascript:alert('Operator/OperatorInfo.action?vo.id={0}')"}
				  ],
			  colwidth:[40,80,100,100,400,300],
			  columns:[
				  "<xwohi:i18n text="id" />",
				  "<xwohi:i18n text="Operator.account" />",
				  "<xwohi:i18n text="Operator.name" />",
				  "<xwohi:i18n text="Department" />",
				  "<xwohi:i18n text="Job" />"
			  ],
			  linkedForm:"operator_list_form",
			  params:"vo.name=<ww:property value="vo.name" />",
			  url:"Operator/OperatorList.action?vo.state=1"
			  }
			  );
	     });

</script>
