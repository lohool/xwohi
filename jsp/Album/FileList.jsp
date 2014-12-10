<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
	String name=request.getParameter("vo.name");
	if(name==null)name="";
%>
<ww:form id="File_list_form" action="FileList" method="post" name="File_list_form" namespace="/Album" onSubmit="return datagridSearch(this,'File_list')">
   <INPUT TYPE="hidden" NAME="albumId" value="<%=request.getParameter("albumId")%>">
   <INPUT TYPE="hidden" NAME="vo.name" value="<%=name%>">
   <ww:hidden name="page" />
   <ww:hidden name="pageSize" />
</ww:form>
<div id="datagrid_wraper" class="datagrid_wraper" style="border:solid 0px red;height:100%;width:100%;" >
	<div id="File_list" class="datagrid" style="border:solid 0px red;">Loading...</div>
	</div>
<script>

	     $(document).ready(function() {
	          $("#File_list").datagrid({
			  callname: 'File_list',
			  //width: 200,
			  //height:300,
				//minus_height:40,
			  //multiple:true,
			  toolbar:[
				  {"text":"Refresh","btnClass":"Refresh"},
				  {"text":"Add File","btnClass":"Add","src":"Album/FileInput.action?targetGrid=File_list&vo.album.id=<%=request.getParameter("albumId")%>","width":600,"height":330},
				  {"text":"Edit File Info","btnClass":"Edit","src":"Album/FileInfo.action?vo.id={0}&targetGrid=File_list","width":550,"height":330},
				  {"text":"Delete","btnClass":"Delete","target":"File_panel","src":"Album/FileDelete.action?vo.id={0}&vo.state=2&albumId=<%=request.getParameter("albumId")%>"},
				  {"text":"Delete","btnClass":"Delete","target":"File_panel","src":"Album/FileDelete.action?vo.id={0}&vo.state=1&albumId=<%=request.getParameter("albumId")%>"},
				  ],
			  columns:[
				  "<xwohi:i18n text="ID" />",
				  "<xwohi:i18n text="File.img" />",
				  "<xwohi:i18n text="File.name" />",
				  "<xwohi:i18n text="File.url" />"
			  ],
			  linkedForm:"File_list_form",
			  colwidth:[30,120,200,400],
			  url:"Album/FileList.action?albumId=<%=request.getParameter("albumId")%>",
			  onmouseover:function(row,data){showImage(data[3])}
			  }
			  );
	     });

</script>
