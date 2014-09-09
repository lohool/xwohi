<%@ page session="true" %>
<%@ page contentType="text/html;charset=gb2312" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<!DOCTYPE HTML>
<html>
<link href="/css/style.css" rel="stylesheet">
<link href="/css/sortabletable.css" rel="StyleSheet" type="text/css">

<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<script type="text/javascript">
var homeAction="/Operator/OperatorList.action";
var inputAction="/Operator/OperatorInput.action";
var deleteAction="OperatorDelete.action";
var primaryKeyName="vo.id";
var loadAction="/Operator/OperatorInfo.action";
var thisAction="/Operator/OperatorInput.action";
var showInfoAction="/Operator/OperatorShow.action";
var helpAction="";
</script>

<body leftmargin="0" topmargin="0" >
<div class="page">
<div id="pageTitle">
		<jsp:include page="/editMenu.jsp" /> 	
</div>

<div align="center">
<ww:form name="form1" namespace="/Operator" action="OperatorAdd" method="post" validate="true">
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
<TD align="center" colspan="2"> 
      <input type="submit" value="<xwohi:i18n text="submit" />">
      <input type="reset" value="<xwohi:i18n text="reset" />">
       </TD>
</TR>
</table>
</ww:form>
</div>
</html>

