<%@ page session="true" %>
<%@ page contentType="text/html;charset=utf8" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<style>
.label
{
	text-align:left;
}
</style>
      <div class="page">
            <ww:form action="FileAdd" method="post" name="form1" namespace="/Album" validate="true" onsubmit="return iframeCallback(this,'File_list')"  enctype="multipart/form-data">
         <div class="container" layoutHeight="32"><ww:fielderror cssStyle="color:red;"/>
				<ww:hidden name="vo.album.id" />
				<div style="width:300px;float:left">
					<p><label class="label"><xwohi:i18n text="File.name"/>:</label></p>
					<p><ww:textfield  name="vo.name"  required="true" /></p>
					<p><label class="label"><xwohi:i18n text="File.File"/>:</label></p>
					<p><ww:file  name="vo.url"  required="true" accept="image/*"  onchange="previewLocalImage(this,'divNewPreview')" /></p>
					<p><label class="label"><xwohi:i18n text="File.description"/>:</label></p>
					<p><ww:textarea  name="vo.description" cols="30" rows="7" required="true" /></p>
				</div>
			   <div id="file_img_preview" style="float:right;width:280px;height:280px;border:solid 1px lightgray;"><div id="divNewPreview"></div></div>
         </div>
		 <div  class="floatpanel"   >
			<input type="submit" class="button" value="<xwohi:i18n text="submit" />">
			<input type="reset" class="button" value="<xwohi:i18n text="reset" />">
		</div>

            </ww:form>
      </div>
