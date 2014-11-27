<%@ page session="true" %>
<%@ page contentType="text/html;charset=gb2312" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>

<div class="page">
<br>
<div align="center">
<ww:form name="form1" namespace="/Archive" action="ArchiveModify" method="post" validate="true">
<INPUT TYPE="hidden" NAME="vo.parent.id" value="<ww:property value="vo.catalogue.id" />">
<ww:hidden name="vo.id" />

<table class="sort-table" id="input_table" cellpadding="0" cellspacing="0" align="center"  bgcolor="#E3E3E3">
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

<textarea class="editor" style="height:368px;width:100%" id="content" name="vo.content" wrap="off"><ww:property value="vo.content"/></textarea>

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

<script type="text/javascript" src="win/editor/tinymce4/js/tinymce/jquery.tinymce.min.js"></script>
<script type="text/javascript" src="win/editor/tinymce4/js/tinymce/tinymce.min.js"></script>
<script type="text/javascript">
	$('textarea.editor').tinymce({
		theme: "modern",
		plugins: [
						"advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
						"searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
						"table contextmenu directionality emoticons template textcolor paste fullpage textcolor colorpicker textpattern"
				 ],
		toolbar1: "newdocument fullpage | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect",
		toolbar2: "cut copy paste | searchreplace | bullist numlist | outdent indent blockquote | undo redo | link unlink anchor image media code | insertdatetime preview | forecolor backcolor",
		toolbar3: "table | hr removeformat | subscript superscript | charmap emoticons | print fullscreen | ltr rtl | spellchecker | visualchars visualblocks nonbreaking template pagebreak restoredraft",

		menubar: false,
		toolbar_items_size: 'small',
		font_formats:"黑体=黑体;宋体=宋体",

		style_formats: [
				{title: 'Bold text', inline: 'b'},
				{title: 'Red text', inline: 'span', styles: {color: '#ff0000'}},
				{title: 'Red header', block: 'h1', styles: {color: '#ff0000'}},
				{title: 'Example 1', inline: 'span', classes: 'example1'},
				{title: 'Example 2', inline: 'span', classes: 'example2'},
				{title: 'Table styles'},
				{title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
		],
		templates: [
			{title: 'Test template 1', content: 'Test 1'},
			{title: 'Test template 2', content: 'Test 2'}
		]
	});
</script>
