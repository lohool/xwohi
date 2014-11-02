<%@ page session="true" %>
<%@ page contentType="text/html;charset=gb2312" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<script>
  function selectCatalogue(selField)
  {
	  //alert(getSelectedOption("ArchiveSearch_form",selField))
	var returned=openModalWindow('/jsp/Archive/dialog.jsp',ArchiveSearch_form.cataID.value,500,300);
    //returned=window.open('dialog.jsp','','');
	if(returned)
	{
		removeAllOptions('ArchiveSearch_form',selField);
		ArchiveSearch_form[selField].add(new Option(returned[0],returned[1]));  
	}
  }
</script>


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
<ww:form name="ArchiveSearch_form" namespace="/Archive" action="ArchiveSearch" method="post">

<table class="sort-table" id="input_table" cellpadding="0" cellspacing="0" align="center" width="500" bgcolor="#E3E3E3">
<thead>
<TR>
<TD colspan="2">
<xwohi:i18n text="Archive.info"/></TD>
</TR>
</thead>
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Archive.title"/></TD><TD bgColor="#ffffff" width="60%">
<ww:textfield name="vo.title" size="40" required="true"/><br>(<xwohi:i18n text="user_wildcard"/>)
</TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Archive.catalogue"/></TD><TD bgColor="#ffffff" width="60%">
<SELECT NAME="cataID" readonly style="width=200px">
<option value="1">Root$></option>
</SELECT>
<INPUT TYPE="button" value="Sel.." onclick="selectCatalogue('cataID');">
<INPUT TYPE="hidden" NAME="vo.catalogue.id">
<INPUT TYPE="hidden" NAME="vo.absolutePath">
<br>
<INPUT TYPE="checkbox" NAME="isSearchSub" class="normal" >
<xwohi:i18n text="search_sub_archioveCatalogue"/>
</TD>
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
<option value="">--</option>
<option value="1" ><xwohi:i18n text="ArchiveCatalogue.time_limit.forever"/></option>
<option value="2" ><xwohi:i18n text="ArchiveCatalogue.time_limit.long"/></option>
<option value="3" ><xwohi:i18n text="ArchiveCatalogue.time_limit.short"/></option>
</SELECT>
</TD>
</TR>

<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Archive.content"/></TD><TD bgColor="#ffffff" width="60%">
<ww:textfield name="vo.content"/><br>(<xwohi:i18n text="user_wildcard"/>)</TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Archive.editor"/></TD><TD bgColor="#ffffff" width="60%">
<ww:textfield name="vo.editor"/>
</TD>
</TR>
<TR>
<TD bgColor="#ffffff" align="right" width="40%">
<xwohi:i18n text="Archive.createTime"/></TD>
<TD bgColor="#ffffff" width="60%">
<ww:textfield name="beginTime"/>--<ww:textfield name="endTime"/>
</TD>
</TR>
<TR>
<TD align="center" colspan="2"> 
      <input type="button"  value="<xwohi:i18n text="submit" />" onclick="form_submit()">
      <input type="reset"  value="<xwohi:i18n text="reset" />">
</TD>
</TR>
</table>
</ww:form>
</div>
</div>
<script>
function form_submit()
{
	if(ArchiveSearch_form.isSearchSub.checked)
	{
		ArchiveSearch_form["vo.catalogue.id"].disabled=ArchiveSearch_form.cataID.value;;
		ArchiveSearch_form["vo.absolutePath"].value="%/"+ArchiveSearch_form.cataID.value+"/%";
	}
	else
	{
		ArchiveSearch_form["vo.absolutePath"].value="";
		//ArchiveSearch_form["vo.absolutePath"].disabled=true;
		ArchiveSearch_form["vo.catalogue.id"].value=ArchiveSearch_form.cataID.value;
	}
	ArchiveSearch_form.submit();
}
</script>
