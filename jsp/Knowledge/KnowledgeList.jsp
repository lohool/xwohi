<%@ page contentType="text/html; charset=gb2312" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>

<ww:iterator value="objList">
<div class="Folder" >
	<a href="JavaScript:openWorkWindow('Knowledge/KnowledgeShow.action?vo.id=<ww:property value="id"/>','Knowledge Content')" >
		<img src="images/icon/Osx24.jpg" border=0 width="64px"> 
		<br><div class="Text"><ww:property value="title"/></div>
	</a>
</div>
</ww:iterator>
<form name="form2" action="Knowledge/KnowledgeList.action">
<ww:hidden name="page"/>
<ww:hidden name="pageSize"/> 
<ww:hidden name="vo.id" /> 
<INPUT TYPE="hidden" NAME="vo.parent.id" value="<ww:property value="vo.catalogue.id"/>">

</form>


