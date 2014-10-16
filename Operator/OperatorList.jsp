<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<div class="page" style="left:0;top:0;width:100%; height:100%;">
<div class="panel" style="left:0;top:0; height:25px;">
	<ww:form id="operator_list_form" name="operator_info_form" namespace="/Operator"  action="OperatorList" method="post" validate="true"  onsubmit="return datagridSearch(this,'operator_list');">
		<INPUT TYPE="hidden" name="page" value="<ww:property value="page" />">
		<INPUT TYPE="hidden" name="pageSize" value="<ww:property value="pageSize" />">
		<INPUT TYPE="hidden" name="vo.state" value="1">
		Name:<INPUT TYPE="text" NAME="vo.name">
		<INPUT TYPE="submit" value="search" class="button biground">
		<INPUT TYPE="reset" value="reset" class="button biground">
		<INPUT TYPE="button" value="Refresh" class="button biground" onclick='$("#operator_list").datagrid("refresh")'>
		<INPUT TYPE="button" value="select" class="button biground" onclick='alert($("#operator_list").datagrid("select"))'>
	</ww:form>
</div>
<div id="operator_list_datagrid_wraper" class="datagrid_wraper" style="border:solid 0px red;width:100%;" layoutHeight="37px">
<div id="operator_list" class="datagrid" >Loading...</div>
</div>
</div>
<script>
var i=0;
	     $(document).ready(function() {
	          $("#operator_list").datagrid({
			  callname: 'operator_list',
			  //width: 300,
			  //height:300,
				//minus_height:40,
			  multiple:true,
			  toolbar:[
				  {"text":"Home","btnClass":"Home","target":"self","src":"/Operator/OperatorList.jsp"},
				  {"text":"Refresh","btnClass":"Refresh"},
				  {"text":"Separator","btnClass":"Separator"},
				  {"text":"添加用户","btnClass":"Add","src":"/Operator/OperatorInput.action","width":550,"height":330},
				  {"text":"Edit Operator","btnClass":"Edit","src":"/Operator/OperatorInfo.action?vo.id={0}","width":600,"height":400},
				  {"text":"Delete","btnClass":"Delete","src":"/Operator/OperatorDelete.action?vo.id={0}&vo.name={1}&vo.state=2"},
				  {"text":"Delete Test","btnClass":"Delete","src":"/Operator/OperatorDelete.action?vo.id={0}&ids={0}&vo.state=1"},
				  {"text":"Separator","btnClass":"Separator"},
				  {"text":"Printer","btnClass":"Printer","src":"/Operator/OperatorInput.action","width":500,"height":300},
				  {"text":"Help","btnClass":"Help","target":"window","src":"/Operator/OperatorInfo.action?vo.id=1","width":300,"height":200},
				  {"text":"Win Test","display":"text","btnClass":"test1","target":"window","src":"/Operator/OperatorInfo.action?vo.id={0}"},
				  {"text":"JS Test","display":"text","btnClass":"test1","target":"window","src":"javascript:alert('/Operator/OperatorInfo.action?vo.id={0}')"}
				  ],
			  colwidth:[40,80,100,100],
			  columns:[
				  "<xwohi:i18n text="id" />",
				  "<xwohi:i18n text="Operator.account" />",
				  "<xwohi:i18n text="Operator.name" />",
				  "<xwohi:i18n text="Department" />",
				  "<xwohi:i18n text="Job" />",
				  "<xwohi:i18n text="State" />"
			  ],
			  linkedForm:"operator_list_form",
			  params:"vo.name=<ww:property value="vo.name" />",
			  url:"/Operator/OperatorList.action?vo.state=1"
			  }
			  );
	     });

</script>
