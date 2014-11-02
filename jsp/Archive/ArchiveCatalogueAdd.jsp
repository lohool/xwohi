<%@ page session="true" %>
<%@ page contentType="text/html;charset=gb2312" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>

<div class="page">
<div align="center">
<ww:form name="form1" namespace="/Archive" action="ArchiveCatalogueAdd" method="post" validate="true" onsubmit="return ajaxDatagridSubmit(this)">
<INPUT TYPE="hidden" NAME="vo.parent.id" value="<ww:property value="vo.id" />">

<table class="sort-table" id="input_table" cellpadding="0" cellspacing="0" align="center" width="500" bgcolor="#E3E3E3">
<thead>
<TR>
<TD colspan="2">
<xwohi:i18n text="ArchiveCatalogue.info"/></TD>
</TR>
</thead>
<TR>
<TD bgColor="#ffffff" align="right" >
<xwohi:i18n text="ArchiveCatalogue.name"/></TD><TD bgColor="#ffffff" >
<INPUT TYPE="text" NAME="vo.name">
</TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" >
<xwohi:i18n text="Archive.serialNumber"/></TD><TD bgColor="#ffffff" >
<ww:textfield name="vo.serialNumber"  required="true"/></TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" >
<xwohi:i18n text="Archive.year"/></TD><TD bgColor="#ffffff" >
<INPUT TYPE="text" NAME="vo.year" value="<%=java.util.Calendar.getInstance().get(java.util.Calendar.YEAR)%>">

</TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" >
<xwohi:i18n text="Archive.depositary"/></TD><TD bgColor="#ffffff" >
<ww:textfield name="vo.depositary"  required="true"/></TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" >
<xwohi:i18n text="Archive.timeLimit"/></TD><TD bgColor="#ffffff" >
<SELECT NAME="vo.timeLimit">
<option value="1"><xwohi:i18n text="ArchiveCatalogue.time_limit.forever"/></option>
<option value="2"><xwohi:i18n text="ArchiveCatalogue.time_limit.long"/></option>
<option value="3"><xwohi:i18n text="ArchiveCatalogue.time_limit.short"/></option>
</SELECT>
</TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" >
<xwohi:i18n text="ArchiveCatalogue.description"/></TD><TD bgColor="#ffffff" >

<TEXTAREA name="vo.description" cols="40" rows="7"></TEXTAREA>
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
</div>
