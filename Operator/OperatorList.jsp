<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<script type="text/javascript">
function form_submit(form)
{
		var win =_window.windows[_window.focusWindowId];
		win.SetContent("[url]"+form.action,$(form).find(":input").serialize());

			/*
		$.ajax({ 
			url: form.action, 
			//context: document.body, 
			data :   unescape($(form).find(":input").serialize()),
			type:"POST",
			dataType:"json",
			error: function(XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest.status);
                        alert(XMLHttpRequest.readyState);
                        alert(textStatus);
                    },
			success: function(data){
				if(data.code=="200")
				{
					var win =_window.windows[_window.focusWindowId];
					alert("parent window id:"+win.parentWindow)
					var parentWin=_window.windows[win.parentWindow];
					if(data.forwardUrl && data.forwardUrl!="")parentWin.SetContent("[url]"+data.forwardUrl);
				}
				else
				{
					alert(data)
				}

			}
	  });
		*/
	return false;
}
</script>
<div class="page" style="left:0;top:0;width:100%; height:100%;">
<div class="panel" style="left:0;top:0; height:40px;">
	<ww:form id="operator_list_form" name="operator_info_form" namespace="/Operator"  action="OperatorList" method="post" validate="true"  onsubmit="return form_submit(this);">
	<ww:hidden name="page"></ww:hidden>
	<ww:hidden name="pageSize"></ww:hidden>
	<INPUT TYPE="text" NAME="vo.name">
	<INPUT TYPE="submit" class="button">
	</ww:form>
</div>
<div class="datagrid_wraper" style="border:solid 0px red;width:100%;" minus_height="52px">
<div id="operator_list" class="datagrid" >Loading...</div>
</div>
<!--
<TEXTAREA id="text" NAME="text" ROWS="15" COLS="70"></TEXTAREA>
-->
</div>
<script>
var i=0;
	     $(document).ready(function() {
	          $("#operator_list").datagrid({
			  callname: 'operator_list',
			  //width: 300,
			  //height:300,
				//minus_height:40,
			  //multiple:true,
			  toolbar:[
				  {"text":"Home","btnClass":"Home","src":"/Operator/OperatorList.action","width":500,"height":300},
				  {"text":"Refresh","btnClass":"Refresh","src":"/Operator/OperatorList.action","width":500,"height":300},
				  {"text":"Separator","btnClass":"Separator"},
				  {"text":"Add User","btnClass":"Add","src":"/Operator/OperatorInput.action","width":550,"height":330},
				  {"text":"Edit","btnClass":"Edit","src":"/Operator/OperatorInfo.action?vo.id={0}","width":600,"height":400},
				  {"text":"Delete","btnClass":"Delete","src":"/Operator/OperatorDelete.action?vo.id={0}&vo.name={1}&vo.state=2"},
				  {"text":"Delete Test","btnClass":"Delete","src":"/Operator/OperatorDelete.action?vo.id={0}&vo.name={1}&vo.state=1"},
				  {"text":"Separator","btnClass":"Separator"},
				  {"text":"Printer","btnClass":"Printer","src":"/Operator/OperatorInput.action","width":500,"height":300},
				  {"text":"Help","btnClass":"Help","winType":"window","src":"/Operator/OperatorInfo.action?vo.id=1","width":300,"height":200}
				  ],
			  columns:[
				  "<xwohi:i18n text="id" />",
				  "<xwohi:i18n text="Operator.account" />",
				  "<xwohi:i18n text="Operator.name" />",
				  "<xwohi:i18n text="Department" />",
				  "<xwohi:i18n text="Job" />",
				  "<xwohi:i18n text="State" />"
			  ],
			  colwidth:[200,50,100,100],
			  pager:
				{
					"total":<ww:property value="resultSize"/>,
					"current_page":<ww:property value="page"/>,
					"pagesize":<ww:property value="pageSize"/>,
					"form":"operator_list_form"
				},
			  data: [
			  <ww:iterator value="objList">
				  [

				  "<ww:property value="id"/>",
				  "<ww:property value="account"/>",
				  "<ww:property value="name"/>",
				  "<ww:property value="department.name"/>",
				  "<ww:property value="job.name"/>",
				  "<ww:property value="state"/>"
				  ],
			   </ww:iterator>
			  ]
			  }
			  );
	     });

</script>
