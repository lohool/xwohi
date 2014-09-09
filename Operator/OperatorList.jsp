<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>

<script>
var primaryKeyName="vo.id";
var homeAction="/Operator/OperatorList.action";

var inputAction="/Operator/OperatorInput.action";
var deleteAction="OperatorDelete.action";
var loadAction="/Operator/OperatorInfo.action";
var thisAction="/Operator/OperatorList.action";
var showInfoAction="/Operator/OperatorShow.action";
var helpAction="";
</script>
<div id="operator_list" class="datagrid" style="height:100%;">
</div>
<TEXTAREA id="text" NAME="text" ROWS="15" COLS="70"></TEXTAREA>

<script>
var i=0;
	     $(document).ready(function() {
	          $("#operator_list").datagrid({
			  callname: 'operator_list',
			 // width: 300,
			  //height:300,
			  //multiple:true,
			  toolbar:[
				  {"text":"Home","btnClass":"Home","src":"/Operator/OperatorList.action","width":500,"height":300},
				  {"text":"Refresh","btnClass":"Refresh","src":"/Operator/OperatorList.action","width":500,"height":300},
				  {"text":"Separator","btnClass":"Separator"},
				  {"text":"Add User","btnClass":"Add","src":"/Operator/OperatorInput.action","width":500,"height":300},
				  {"text":"Edit","btnClass":"Edit","src":"/Operator/OperatorInfo.action?vo.id={0}","width":500,"height":300},
				  {"text":"Delete","btnClass":"Delete","src":"/Operator/OperatorDelete.action?vo.id={0}&vo.name={1}&vo.state=2","width":500,"height":300},
				  {"text":"Separator","btnClass":"Separator"},
				  {"text":"Printer","btnClass":"Printer","src":"/Operator/OperatorInput.action","width":500,"height":300},
				  {"text":"Help","btnClass":"Help","winType":"window","src":"/Operator/OperatorInfo.action?vo.id=1","width":300,"height":200}
				  ],
			  columns:[
				  "<xwohi:i18n text="id" />",
				  "<xwohi:i18n text="Operator.account" />",
				  "<xwohi:i18n text="Operator.name" />",
				  "<xwohi:i18n text="Department" />",
				  "<xwohi:i18n text="Job" />"
			  ],
			  colwidth:[200,50,100,100],
			  pager:
				{
					"total":201,
					"current_page":3,
					"pagesize":10
				},
			  data: [
			  <ww:iterator value="objList">
				  [

				  "<ww:property value="id"/>",
				  "<ww:property value="account"/>",
				  "<ww:property value="name"/>",
				  "<ww:property value="department.name"/>",
				  "<ww:property value="job.name"/>"
				  ],
			   </ww:iterator>
			  ]
			  }
			  );
	     });

</script>
<form name="form1" action="/Operator/OperatorList.action">
<ww:hidden name="page"></ww:hidden>
<ww:hidden name="pageSize"></ww:hidden> 
	<ww:hidden name="vo.id" /> 
	<ww:hidden name="id" /> 
</form>
