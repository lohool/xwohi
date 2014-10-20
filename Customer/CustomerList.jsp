<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%String a="A"+(int)(Math.random()*1000);%>
<%
	String name=request.getParameter("vo.name");
	if(name==null)name="";
%>
<ww:form id="Customer_list_form" action="CustomerList" method="post" name="Customer_list_form" namespace="/Customer" onSubmit="return panelSearch(this,'customer_panel')">
   <INPUT TYPE="hidden" NAME="groupId" value="<%=request.getParameter("groupId")%>">
   <INPUT TYPE="hidden" NAME="vo.name" value="<%=name%>">
   <ww:hidden name="page" />
   <ww:hidden name="pageSize" />
</ww:form>
<div id="datagrid_wraper" class="datagrid_wraper" style="border:solid 0px red;height:100%;width:100%;" >
	<div id="Customer_list_<%=a%>" class="datagrid" style="border:solid 0px red;">Loading...</div>
	</div>
<script>

	     $(document).ready(function() {
	          $("#Customer_list_<%=a%>").datagrid({
			  callname: 'Customer_list_<%=a%>',
			  //width: 200,
			  //height:300,
				//minus_height:40,
			  //multiple:true,
			  toolbar:[
				  {"text":"Refresh","btnClass":"Refresh"},
				  {"text":"Add Customer","btnClass":"Add","src":"/Customer/CustomerInput.action?targetGrid=Customer_list_<%=a%>","width":550,"height":330},
				  {"text":"Edit Customer Info","btnClass":"Edit","src":"/Customer/CustomerInfo.action?vo.id={0}&targetGrid=Customer_list_<%=a%>","width":550,"height":330},
				  {"text":"Delete","btnClass":"Delete","target":"customer_panel","src":"/Customer/CustomerDelete.action?vo.id={0}&vo.state=2&groupId=<%=request.getParameter("groupId")%>"},
				  {"text":"Delete","btnClass":"Delete","target":"customer_panel","src":"/Customer/CustomerDelete.action?vo.id={0}&vo.state=1&groupId=<%=request.getParameter("groupId")%>"},
				  {"text":"Customer Group:<ww:property value="vo.group.name"/>","btnClass":"text"},
				  ],
			  columns:[
				  "<xwohi:i18n text="ID" />",
				  "<xwohi:i18n text="Customer.company" />",
				  "<xwohi:i18n text="Customer.name" />",
				  "<xwohi:i18n text="Customer.birthday" />",
				  "<xwohi:i18n text="Customer.idCardNo" />",
				  "<xwohi:i18n text="Customer.phone" />",
				  "<xwohi:i18n text="Customer.mobile" />",
				  "<xwohi:i18n text="Customer.job" />",
				  "<xwohi:i18n text="Customer.group" />",
				  "<xwohi:i18n text="Customer.state" />"
			  ],
			  linkedForm:"Customer_list_form",
			  //colwidth:[30,120,200],
			  pager:
				{
					"total":<ww:property value="resultSize"/>,
					"current_page":<ww:property value="page"/>,
					"pagesize":<ww:property value="pageSize"/>,
					"form":"Customer_list_form"
				},
			  data: [
			  <ww:iterator value="objList">
				  [
				  "<ww:property value="id"/>",
				  "<ww:property value="company"/>",
				  "<ww:property value="name"/>",
				  "<ww:property value="birthday"/>",
				  "<ww:property value="idCardNo"/>",
				  "<ww:property value="phone"/>",
				  "<ww:property value="mobile"/>",
				  "<ww:property value="job"/>",
				  "<ww:property value="group.name"/>",
				  "<ww:property value="state"/>"
				  ],
			   </ww:iterator>
			  ]
			  }
			  );
	     });

</script>
