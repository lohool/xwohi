<%@ page session="true" %>
<%@ page contentType="text/html;charset=gb2312" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>

<body topmargin="0" leftmargin="0">
<div class="page">
<div id="pageTitle">
<TABLE id="title-table" cellpadding="0" cellspacing="0" height="30" width="100%">
<thead>
<TR>
<TD><span class="pageTitle-left"><img src="/images/ico_arrow_title.gif" width="13" height="13">
<xwohi:i18n text="Archive.info"/></span><span class="pageTitle-right"></span></TD>
</TR>
</thead>
</TABLE>
</div>
<br>
<div align="center">
<ww:form name="form1" namespace="/Archive" action="ArchiveModify" method="post" validate="true">
<INPUT TYPE="hidden" NAME="vo.parent.id" value="<ww:property value="vo.catalogue.id" />">
<ww:hidden name="vo.id" />

<table class="sort-table" id="input_table" cellpadding="0" cellspacing="0" align="center"  bgcolor="#E3E3E3">
<thead>
<TR>
<TD colspan="2">
<xwohi:i18n text="Archive.info"/></TD>
</TR>
</thead>
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Archive.title"/></TD><TD bgColor="#ffffff" width="60%">
<ww:textfield name="vo.title" size="40" required="true"/></TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Archive.file"/></TD><TD bgColor="#ffffff" width="60%">
<ww:property value="vo.file" /></TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Archive.serialNumber"/></TD><TD bgColor="#ffffff" width="60%">
<ww:textfield name="vo.serialNumber" size="40" required="true"/></TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Archive.timeLimit"/></TD><TD bgColor="#ffffff" width="60%">
<SELECT NAME="vo.timeLimit">
<option value="1" <ww:if test="vo.timeLimit==1">selected</ww:if>><xwohi:i18n text="ArchiveCatalogue.time_limit.forever"/></option>
<option value="2" <ww:if test="vo.timeLimit==2">selected</ww:if>><xwohi:i18n text="ArchiveCatalogue.time_limit.long"/></option>
<option value="3" <ww:if test="vo.timeLimit==3">selected</ww:if>><xwohi:i18n text="ArchiveCatalogue.time_limit.short"/></option>
</SELECT>
</TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Archive.pageCount"/></TD><TD bgColor="#ffffff" width="60%">
<ww:textfield name="vo.pageCount" size="40" required="true"/></TD>
</TR>

<TR>
<TD bgColor="#ffffff" align="center" colspan="2">
<xwohi:i18n text="Archive.content"/></TD>
<tr>
<TD bgColor="#ffffff" width="100%" colspan="2">
<div id="editor_tab_two" style="display:none;"> 
<textarea class="wpHtmlEditArea" style="height:268px;" id="editor" name="vo.content" wrap="off"><ww:property value="vo.content"/></textarea>
</div>

</TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Archive.editor"/></TD><TD bgColor="#ffffff" width="60%">
<ww:property value="vo.editor"/></TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Archive.createTime"/></TD><TD bgColor="#ffffff" width="60%">
<ww:property value="vo.createTime"/></TD>
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
