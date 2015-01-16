<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<div class="page">
		<ww:form id="Archive_list_form" name="Archive_list_form" namespace="/Archive"  action="ArchiveList" method="post"  onSubmit="return panelSearch(this,'Archive_panel')">
		<ww:hidden name="page"></ww:hidden>
		<ww:hidden name="pageSize"></ww:hidden>
		<ww:hidden name="vo.catalogue.id"></ww:hidden>
		</ww:form>
	<div class="datagrid_wraper" >
		<div id="Archive_list" class="datagrid" >Loading...</div>
	</div>
</div>
<script>
	     $(document).ready(function() {
	          $("#Archive_list").datagrid({
			  callname: 'Archive_list',
			  //width: 300,
			  //height:300,
				//minus_height:40,
			  //multiple:true,
			  toolbar:[
				  {"text":"Refresh","btnClass":"Refresh"},
				  {"text":"Separator","btnClass":"Separator"},
				  {"text":"Add Archive","btnClass":"Add","target":"window","src":"Archive/ArchiveInput.action?vo.id=<ww:property value="vo.catalogue.id"/>","width":550,"height":330},
				  {"text":"Edit Archive Info","btnClass":"Edit","src":"Archive/ArchiveInfo.action?vo.id={0}","width":700,"height":450},
				  {"text":"View Archive Info","btnClass":"Full_page","src":"Archive/ArchiveInfo.action?vo.id={0}","width":700,"height":450},
				  {"text":"Delete","btnClass":"Delete","src":"Archive/ArchiveDelete.action?vo.id={0}&vo.name={1}&vo.state=2"},
				  {"text":"Delete Test","btnClass":"Delete","src":"Archive/ArchiveDelete.action?vo.id={0}"},
				  {"text":"Separator","btnClass":"Separator"},
				  {"text":"Printer","btnClass":"Printer","src":"Archive/ArchiveInput.action","width":500,"height":300},
				  {"text":"Help","btnClass":"Help","src":"Archive/ArchiveInfo.action?vo.id=1","width":300,"height":200}
				  ],
			  columns:[
				  "<xwohi:i18n text="ID" />",
				  "<xwohi:i18n text="title" />",
				  "<xwohi:i18n text="editor.name" />",
				  "<xwohi:i18n text="createTime" />"
			  ],
			  linkedForm:"Archive_list_form",
			  colwidth:[40],
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
				  "<ww:property value="id"/>",
				  "<ww:property value="title"/>",
				  "<ww:property value="editor.name"/>",
				  "<ww:property value="createTime"/>"
				  ],
			   </ww:iterator>
			  ]
			  }
			  );
	     });

</script>
