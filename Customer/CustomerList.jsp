<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<%String a="A"+(int)(Math.random()*1000);%>
            <ww:form action="CustomerList" method="post" name="Customer_list_form" namespace="/Customer" validate="true" theme="simple">
			   <ww:hidden name="vo.group.id" />
			   <ww:hidden name="vo.group.name" />
               <ww:hidden name="page" />
               <ww:hidden name="pageSize" />
            </ww:form>
	<div id="Customer_list_datagrid_wraper" class="datagrid_wraper" style="border:solid 0px red;height:100%;width:100%;" >
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
				  {"text":"Refresh","btnClass":"Refresh","target":"customer_panel","src":"/Customer/CustomerList.action?vo.group.id=<ww:property value="vo.group.id" />","width":500,"height":300},
				  {"text":"Add Customer","btnClass":"Add","src":"/Customer/CustomerInput.action","width":550,"height":330},
				  {"text":"Edit Customer Info","btnClass":"Edit","src":"/Customer/CustomerInfo.action?vo.id={0}","width":700,"height":450},
				  {"text":"Delete","btnClass":"Delete","target":"customer_panel","src":"/Customer/CustomerDelete.action?vo.id={0}&vo.name={1}&vo.state=2&vo.group.id=<ww:property value="vo.group.id" />"},
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
