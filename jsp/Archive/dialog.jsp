<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>

<div class="page">
<FORM METHOD=POST name="selForm" >
<table width="100%" cellspacing="0" id="sort-table" >
<tbody>
<TR>
<td align="right">Directory:</td>
<td>
<INPUT TYPE="text" NAME="selField" readonly size="80" value="Root" style="width:99%"><INPUT TYPE="hidden" NAME="selValue" value="1">
</td>
</TR>
<TR>
</tr>
<tr>
<td width="70" rowspan="2" style="background-color:#999999;border:	1px solid;border-color: ButtonShadow	ButtonHighlight ButtonHighlight ButtonShadow;">
<img src="images/pic-1.gif" width="70" height="220">
</td>
<td width="100%" height="300" valign="top">
<iframe width="99%" height="99%" id="myFrame"  name="myFrame"  src=""  scrolling='auto' frameBorder='0' style="border:solid 1px #ccc"></iframe>
</td>
</TR>

<TR>
	<TD colspan="2" align="right">
	<INPUT TYPE="button" style="width:60px" value=" <xwohi:i18n text="Open" /> " onclick="returnValues()">	
	&nbsp;&nbsp;
	<INPUT TYPE="button" style="width:60px" value=" <xwohi:i18n text="Cancel" /> " onclick="windowClose()">
	&nbsp;
	</TD>

</TR>
</tbody>
</table>
</form>

</div>
<script language="jscript">
document.getElementById("myFrame").src="Archive/ArchiveCatalogueSelectDialog.action?vo.parent.id="+<%=request.getParameter("cataId")%>;
 function returnValues()
 {
  feedback({"vo.catalogue.id":selForm.selValue.value,"cataPath":selForm.selField.value},"ArchiveSearch_form");
  windowClose();
 }
 function windowClose()
 {
	 _window.closeCurrent();
 }

function setSelected(text,value)
{
	document.selForm.selField.value=text;
    document.selForm.selValue.value=value;

}
</script>
