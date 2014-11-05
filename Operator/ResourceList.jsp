<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<div class="page" >
<div class="panel" >
	<ww:form id="Resource_list_form" name="Resource_info_form" namespace="/Resource"  action="ResourceList" method="post" validate="true"  onsubmit="return datagridSearch(this,'Resource_list');">
		<INPUT TYPE="hidden" name="page" value="<ww:property value="page" />">
		<INPUT TYPE="hidden" name="pageSize" value="<ww:property value="pageSize" />">
		Name:<INPUT TYPE="text" NAME="vo.name">
		<INPUT TYPE="submit" value="search" class="button biground">
		<INPUT TYPE="reset" value="reset" class="button biground">
	</ww:form>
</div>
<div id="Resource_list_datagrid_wraper" class="datagrid_wraper" layoutHeight="34px">
<div id="Resource_list" class="datagrid" >Loading...</div>
</div>
</div>
<script>
var i=0;
	     $(document).ready(function() {
	          $("#Resource_list").datagrid({
			  callname: 'Resource_list',
			  colwidth:[40,100,120,120],
			  columns:[
				  "<xwohi:i18n text="ID" />",
				  "<xwohi:i18n text="Resource.name" />",
				  "<xwohi:i18n text="Resource.nameCode" />",
				  "<xwohi:i18n text="userType" />",
				  "<xwohi:i18n text="Resource.description" />"
			  ],
			  linkedForm:"Resource_list_form",
			  url:"Resource/ResourceList.action"
			  }
			  );
	     });

</script>
