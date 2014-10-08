<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<%String a="A"+(int)(Math.random()*1000);%>
<%
	String name=request.getParameter("vo.name");
	if(name==null)name="";

%>
            <ww:form id="Department_list_form" action="DepartmentSelect" method="post" name="Department_list_form" namespace="/Department" validate="true" theme="simple" onSubmit="return windowSearch(this)">
			   <INPUT TYPE="hidden" NAME="groupId" value="<%=request.getParameter("groupId")%>">
			   Name:<INPUT TYPE="text" NAME="vo.name" value="<%=name%>">
               <ww:hidden name="page" />
               <ww:hidden name="pageSize" />
				<INPUT TYPE="submit" value="search" class="button biground">
				<INPUT TYPE="reset" value="reset" class="button biground">
            </ww:form>
	<div id="datagrid_wraper" class="datagrid_wraper" style="border:solid 0px red;height:100%;width:100%;" layoutHeight="21px">
		<div id="Department_list_<%=a%>" class="datagrid" style="border:solid 0px red;">Loading...</div>
	</div>
<script>
	     $(document).ready(function() {
	          $("#Department_list_<%=a%>").datagrid({
			  callname: 'Department_list_<%=a%>',
			  //width: 200,
			  //height:300,
				//minus_height:40,
			  //multiple:true,
			  columns:[
				  "<xwohi:i18n text="ID" />",
				  "<xwohi:i18n text="Department.name" />",
				  ""
			  ],
			  //colwidth:[30,120,200],
			  pager:
				{
					"total":<ww:property value="resultSize"/>,
					"current_page":<ww:property value="page"/>,
					"pagesize":<ww:property value="pageSize"/>,
					"form":"Department_list_form"
				},
			  data: [
			  <ww:iterator value="objList">
				  [
				  "<ww:property value="id"/>",
				  "<ww:property value="name"/>",
				  "<a href='#' onclick='feedback({departmentId:\"<ww:property value="id"/>\",departmentName:\"<ww:property value="name"/>\"})'>Sel</a>"
				  ],
			   </ww:iterator>
			  ]
			  }
			  );
	     });

</script>
