<%@ page contentType="text/html; charset=gb2312" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>

<ww:iterator value="objList">
<TR onmouseover=checkedTableRow(this); onclick=checkedTableRow(this); ondblclick="doDblClick(<ww:property value="id"/>)" valueOfId="<ww:property value="id"/>" valueOfChecked="">
<td width=7 class="headID">&nbsp;</td>
<td>
			<a href="javascript:doDblClick('<ww:property value="id"/>')">
			<img src="/images/icon/Manual4.gif" border=0> <ww:property value="title"/>
			</a>
			</td><td>
			<ww:property value="editor"/>
			</td><td>
			<ww:property value="createTime"/>
			</td>
			<TD>
			<a href="javascript:doDeleteKnowledge('<ww:property value="id"/>')"><img src="/images/delete.gif" border="0"/></a>
			</TD><TD>
			<a href="javascript:doLoadKnowledge('<ww:property value="id"/>')"><img src="/images/detail.gif" border="0" /></a>
			</TD>
</TR>
</ww:iterator>
<ww:property value="paginateView" escape="false"/>
</div>
<form name="form2" action="/Knowledge/KnowledgeList.action">
<ww:hidden name="page"/>
<ww:hidden name="pageSize"/> 
<ww:hidden name="vo.id" /> 
<INPUT TYPE="hidden" NAME="vo.parent.id" value="<ww:property value="vo.catalogue.id"/>">

</form>
<script type="text/javascript">

function doDeleteKnowledge(n)
{
	var r=confirm("Are you sure to delete it?");
	if(r)
	{
		form2.action="KnowledgeDelete.action";
		form2["vo.id"].value=n;
		form2.submit();
	}
}
function doLoadKnowledge(n)
{
		form2.action="KnowledgeInfo.action";
		form2["vo.id"].value=n;
		form2.submit();
}
function doDblClick(n)
{
	window.location="/Knowledge/KnowledgeShow.action?vo.id="+n;
}



</script>

