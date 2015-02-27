<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<div class="page">
<div id="aa" class="panel">
	<ww:form id="operator_sel_list_form" name="operator_info_form" namespace="/Operator"  action="OperatorSelectList" method="post"   onsubmit="return datagridSearch(this,'operator_Sel_list');">
		<INPUT TYPE="hidden" name="page" value="<ww:property value="page" />">
		<INPUT TYPE="hidden" name="pageSize" value="<ww:property value="pageSize" />">
		<INPUT TYPE="hidden" name="vo.state" value="1">
		Name:<INPUT TYPE="text" NAME="vo.name" />
		<span>
		<INPUT TYPE="submit" value="search" class="button biground">
		<INPUT TYPE="reset" value="reset" class="button biground">
		</span>
	</ww:form>
</div>
<div id="operator_Sel_list_datagrid_wraper" class="datagrid_wraper" style="border:solid 0px red;width:100%;padding:0px" layoutHeight="30px">
<div id="operator_Sel_list" class="datagrid" >Loading...</div>
</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
	          $("#operator_Sel_list").datagrid({
			  callname: 'operator_Sel_list',
			  //multiple:true,
		      showToolbarText:true,
			  colwidth:[40,80,100,100,100,80],
			  columns:[
				  "<xwohi:i18n text="id" />",
				  "<xwohi:i18n text="Operator.account" />",
				  "<xwohi:i18n text="Operator.name" />",
				  "<xwohi:i18n text="Department" />",
				  "<xwohi:i18n text="Job" />",
				  "<xwohi:i18n text="Sel" />"
			  ],
			  linkedForm:"operator_sel_list_form",
			  //params:"vo.name=<ww:property value="vo.name" />",
			  url:"Operator/OperatorSelectList.action?vo.state=1"
			  }
			  );
	     });

</script>
