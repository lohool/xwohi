<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF8" %> 
<%@ taglib uri="webwork" prefix="ww" %>

<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<script type="text/javascript">
function form_submit(form,type)
{
		
		$.ajax({ 
			url: form.action, 
			//context: document.body, 
			data :   $(form).find(":input").serialize()  ,
			type:"post",
			dataType:"json",
			success: function(data){
				if(data.code=="200")
				{
					alert("current window id:"+_window.focusWindowId)
					var win =_window.windows[_window.focusWindowId];
					alert("parent window id:"+win.parentWindow)
					var parentWin=_window.windows[win.parentWindow];
					if(data.forwardUrl && data.forwardUrl!="")parentWin.SetContent("[url]"+data.forwardUrl);
					win.Close();
				}

			}
	  });
		
	return false;
}
</script>

<div align="center">
<ww:form name="operator_add_form" namespace="/Operator" action="OperatorAdd" method="post" validate="true" onsubmit="return form_submit(this,'window')">
<table bgcolor="#E3E3E3" width="500" align="center" cellspacing="0" cellpadding="0" id="input_table" class="sort-table">
<thead>
<TR>
<TD colspan="2">
<xwohi:i18n text="Operator.info"/>
</TR>
</thead>
<TR>
<TD bgColor="#ffffff" align="right" width="40%"><xwohi:i18n text="Operator.account" />:</TD><TD bgColor="#ffffff" width="60%">
             <ww:textfield  name="vo.account" required="true"/>     
	  </TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" width="40%"><xwohi:i18n text="Operator.name" />:</TD><TD bgColor="#ffffff" width="60%">
             <ww:textfield  name="vo.name" required="true"/>     
	  </TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" width="40%"><xwohi:i18n text="Operator.password" />:</TD><TD bgColor="#ffffff" width="60%">
             <ww:password  name="vo.password" required="true"/>     
	  </TD>
</TR>
<TR>
	<TD bgColor="#ffffff" align="right" width="40%">
	<xwohi:i18n text="Operator.password2" />
	</TD>
	<TD bgColor="#ffffff" width="60%">
       <ww:password  name="vo.password2" required="true"/>     
	</TD>
</TR>
<TR>
	<TD bgColor="#ffffff" align="right" width="40%">
	<xwohi:i18n text="Job" />:
	</TD>

<TD bgColor="#ffffff"  width="40%">
	<ww:select name="vo.job.id" listKey="id" listValue="name" list="select.job" value="vo.job.id"/>
</TD>
</TR>

<TR>
	<TD bgColor="#ffffff"  align="right" width="40%">
	<xwohi:i18n text="Department" />:
	</TD>

<TD bgColor="#ffffff" width="40%">
	<ww:select name="vo.department.id" listKey="id" listValue="name" list="select.department" value="vo.department.id"/>
</TD>
</TR>
<TR>
<TD align="center" colspan="2"> 
      <input type="submit" value="<xwohi:i18n text="submit" />">
      <input type="reset" value="<xwohi:i18n text="reset" />">
       </TD>
</TR>
</table>
</ww:form>
