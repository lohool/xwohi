<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<%@ page import="com.opensymphony.xwork2.util.ValueStack "  %>
<%@ page import="java.util.*"  %>
<%@ page import="com.lohool.jproject.xwohi.common.*"  %>
<%@ page import="com.lohool.jproject.xwohi.po.*"  %>
<%
ValueStack  stack = (ValueStack ) request.getAttribute("struts.valueStack");

Object obj=stack.findValue("vo");
%>
<%!
String listChild2(KnowledgeCatalogue parent)
{
	String htmlCode="";
	if(parent!=null && parent.getId()!=0)
	{
		htmlCode="<a href='/Knowledge/KnowledgeCatalogueList.action?vo.parent.id="+parent.getId()+"' target='self'>"+parent.getName()+"</a>"+htmlCode+"/";
		htmlCode=listChild2(parent.getParent())+htmlCode;
	}
	return htmlCode;
}
%>
<%
if(obj!=null)
{
		KnowledgeCatalogue job=(KnowledgeCatalogue)obj;
		out.println(listChild2(job));
}
%>

