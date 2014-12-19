<%@ page session="true" %>
<%@ page contentType="text/html;charset=utf8" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<%@ page import="com.opensymphony.xwork2.util.ValueStack"  %>
<%@ page import="java.util.*"  %>
<%@ page import="com.lohool.jproject.xwohi.common.*"  %>
<%@ page import="com.lohool.jproject.xwohi.archive.po.*"  %>
<div class="page">

<ww:form name="ArchiveAdd_form" namespace="/Archive" action="ArchiveAdd" method="post" enctype="multipart/form-data" validate="true" onsubmit="return iframeCallback(this,'Archive_list')">
<INPUT TYPE="hidden" NAME="vo.catalogue.id" value="<ww:property value="vo.id" />">
<INPUT TYPE="hidden" NAME="vo.editor" value="<ww:property value="getUser().account" />">
<%
ValueStack stack = (ValueStack) request.getAttribute("struts.valueStack");

Object obj=stack.findValue("vo");
%>

<%!
String listChild2(ArchiveCatalogue parent)
{
	String htmlCode="";
	if(parent!=null && parent.getId()!=0)
	{
		htmlCode=parent.getId()+htmlCode+"/";
		htmlCode=listChild2(parent.getParent())+htmlCode;
	}
	
	return htmlCode;
}
%>
<%
		ArchiveCatalogue job=(ArchiveCatalogue)obj;
		String abPath="/1/"+listChild2(job);
%>
<INPUT TYPE="hidden" NAME="vo.absolutePath" value="<%=abPath%>">
<div class="container" layoutHeight="38">

<table class="sort-table" style="width:100%" id="input_table" cellpadding="0" cellspacing="0" align="center" >
<TR>
<TD align="right" >
<xwohi:i18n text="Archive.serialNumber"/></TD><TD >
<ww:textfield name="vo.serialNumber"  required="true"/></TD>
<TD align="right" >
<xwohi:i18n text="Archive.timeLimit"/></TD><TD >
<SELECT NAME="vo.timeLimit">
<option value="1"><xwohi:i18n text="ArchiveCatalogue.time_limit.forever"/></option>
<option value="2"><xwohi:i18n text="ArchiveCatalogue.time_limit.long"/></option>
<option value="3"><xwohi:i18n text="ArchiveCatalogue.time_limit.short"/></option>
</SELECT>
</TD>
<TD align="right" >
<xwohi:i18n text="Archive.pageCount"/></TD><TD >
<ww:textfield name="vo.pageCount" required="true"/></TD>
</TR>
<TR>
<TD align="right" >
<xwohi:i18n text="Archive.title"/></TD><TD colspan="5">
<ww:textfield name="vo.title" size="100" cssStyle="width:100%;" required="true"/></TD>
</TR>
<TR>
<TD align="right" >
<xwohi:i18n text="Archive.file"/></TD><TD colspan="5">
<INPUT TYPE="file" NAME="vo.file" size="100" cssStyle="width:100%;">
</TD>
</TR>

<TR >
<TD align="right" colspan="6">

<textarea class="editor" style="height:368px;width:100%" id="content" name="vo.content" wrap="off"></textarea>
</TD>
</TR>
</table>
</div>
<div class="panel" style="height:25px;text-align:center;">
	   <ww:if test="#session.operation_user.isAccess(\"/Operator/OperatorDelete.action\")==true">
      <input type="submit"  value="<xwohi:i18n text="submit" /> ">
	  </ww:if>
      <input type="reset" value="<xwohi:i18n text="reset" />">
      <input type="button" value="<xwohi:i18n text="close" />" onclick="_window.closeCurrent()">
</div>

</ww:form>
</div>
<!-- TinyMce 3.X-->
<!--
<script type="text/javascript" src="/win/editor/tinymce/jscripts/tiny_mce/jquery.tinymce.js"></script>
<script type="text/javascript">
        $(function() {
                $('textarea.editor').tinymce({
                        // Location of TinyMCE script
                        script_url : '/win/editor/tinymce/jscripts/tiny_mce/tiny_mce_jquery.js',

                        // General options
                        theme : "advanced",
                        plugins : "pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",

                        // Theme options
                        theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
                        theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
                        theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
                        theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
                        theme_advanced_toolbar_location : "top",
                        theme_advanced_toolbar_align : "left",
                        theme_advanced_statusbar_location : "bottom",
                        theme_advanced_resizing : true,

                        // Example content CSS (should be your site CSS)
                        content_css : "css/content.css",
						//theme_advanced_fonts:"黑体=黑体",
						style_formats: [
								{title: 'Bold text', inline: 'b'},
								{title: 'Red text', inline: 'span', styles: {color: '#ff0000'}},
								{title: 'Red header', block: 'h1', styles: {color: '#ff0000'}},
								{title: 'Example 1', inline: 'span', classes: 'example1'},
								{title: 'Example 2', inline: 'span', classes: 'example2'},
								{title: 'Table styles'},
								{title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
						],

                        // Drop lists for link/image/media/template dialogs
                        template_external_list_url : "lists/template_list.js",
                        external_link_list_url : "lists/link_list.js",
                        external_image_list_url : "lists/image_list.js",
                        media_external_list_url : "lists/media_list.js",

                        // Replace values for the template plugin
                        template_replace_values : {
                                username : "Some User",
                                staffid : "991234"
                        }
                });
        });
</script>
-->
<!--
<form method="post" action="somepage">

        <a href="javascript:;" onmousedown="$('#content').tinymce().show();">[Show]</a>
        <a href="javascript:;" onmousedown="$('#content').tinymce().hide();">[Hide]</a>
        <a href="javascript:;" onmousedown="$('#content').tinymce().execCommand('Bold');">[Bold]</a>
        <a href="javascript:;" onmousedown="alert($('#content').html());">[Get contents]</a>
        <a href="javascript:;" onmousedown="alert($('#content').tinymce().selection.getContent());">[Get selected HTML]</a>
        <a href="javascript:;" onmousedown="alert($('#content').tinymce().selection.getContent({format : 'text'}));">[Get selected text]</a>
        <a href="javascript:;" onmousedown="alert($('#content').tinymce().selection.getNode().nodeName);">[Get selected element]</a>
        <a href="javascript:;" onmousedown="$('#content').tinymce().execCommand('mceInsertContent',false,'<b>Hello world!!</b>');">[Insert HTML]</a>
        <a href="javascript:;" onmousedown="$('#content').tinymce().execCommand('mceReplaceContent',false,'<b>{$selection}</b>');">[Replace selection]</a>
</form>
-->


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
		toolbar1: "newdocument fullpage | code preview | undo redo restoredraft | cut copy paste | searchreplace | ",
		toolbar2: "bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect | bullist numlist | outdent indent blockquote | link unlink anchor image media  | insertdatetime  | forecolor backcolor",
		toolbar3: "table | hr removeformat | subscript superscript | charmap emoticons | print | ltr rtl | spellchecker | visualchars visualblocks nonbreaking template pagebreak ",

		menubar: false,
		toolbar_items_size: 'small',
		font_formats:"黑体=黑体;宋体=宋体",
		//image_list:"jsp/Archive/image.json",//function(){alert("aaa")},//"/Album/AlbumList.action",
		image_advtab:true,
		image_list_src:"Album/FileList.action",
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
