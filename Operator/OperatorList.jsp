<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<script type="text/javascript">
function form_submit(form)
{
		alert(this.id)
		var win =_window.windows[_window.focusWindowId];
		win.SetContent("[url]"+src);

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
<style>
.panelBar { display:block; overflow:hidden; height:25px; border-style:solid; border-width:1px red; background-repeat:repeat-x; }

</style>
<div class="panelBar" style="left:0;top:0; height:40px;">
	<ww:form id="operator_list_form" name="operator_info_form" namespace="/Operator"  action="OperatorList" method="post" validate="true"  onsubmit="return form_submit(this);">
	<ww:hidden name="page"></ww:hidden>
	<ww:hidden name="pageSize"></ww:hidden> 
	<INPUT TYPE="text" NAME="vo.name">
	<INPUT TYPE="submit">
	</ww:form>
</div>
<div id="operator_list" class="datagrid" >Loading
</div>
<!--
<TEXTAREA id="text" NAME="text" ROWS="15" COLS="70"></TEXTAREA>
-->

<script>
var i=0;
	     $(document).ready(function() {
	          $("#operator_list").datagrid({
			  callname: 'operator_list',
			  //width: 300,
			  //height:400,
				minus_height:40,
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
					"total":201,
					"current_page":3,
					"pagesize":10,
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
