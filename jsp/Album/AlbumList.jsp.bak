<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
	<ww:form id="Album_list_form" name="operator_info_form" namespace="/Album"  action="AlbumList" method="post"   onsubmit="return panelSearch(this,'Album_panel');">
		<INPUT TYPE="hidden" name="page" value="0">
		<INPUT TYPE="hidden" name="pageSize" value="-1">
	</ww:form>

	<div class="datagrid_wraper" style="border:solid 0px red;height:100%;width:100%;" >
		<div id="Album_list" class="datagrid" style="border:solid 0px red;">Loading...</div>
	</div>
<script>
	     $(document).ready(function() {
	          $("#Album_list").datagrid({
			  callname: 'Album_list',
			  width: 200,
			  //height:300,
				//minus_height:40,
			  //multiple:true,
			  toolbar:[
				  {"text":"Refresh","btnClass":"Refresh"},
				  {"text":"Add Album","btnClass":"Add","src":"Album/AlbumInput.action","width":550,"height":230},
				  {"text":"Edit Album Info","btnClass":"Edit","src":"Album/AlbumInfo.action?vo.AlbumID={0}","width":700,"height":450},
				  {"text":"Delete","btnClass":"Delete","src":"Album/AlbumDelete.action?vo.id={0}&vo.name={1}&vo.state=2"},
				  ],
			  columns:[
				  "<xwohi:i18n text="Album.name" />"
			  ],
			  //colwidth:[30,120,200],
			  pager:
				{
					"total":0,
					"current_page":0,
					"pagesize":-1
				},
			  linkedForm:"Album_list_form",
			  data: [
			  <ww:iterator value="objList">
				  [
				  "<a href='jsp/Album/FileList.jsp?albumId=<ww:property value="id" />&vo.album.name=<ww:property value="name" />' target='File_panel' ><ww:property value="name"/></a>"
				  ],
			   </ww:iterator>
			  ]
			  }
			  );
	     });


</script>
