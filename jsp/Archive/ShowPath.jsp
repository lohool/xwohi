<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<%@ page import="com.opensymphony.xwork2.util.ValueStack"  %>
<%@ page import="java.util.*"  %>
<%@ page import="com.lohool.jproject.xwohi.common.*"  %>
<%@ page import="com.lohool.jproject.xwohi.archive.po.*"  %>
<%!String URL;%>
<%
URL=request.getParameter("URL");
if(URL==null || URL.trim().equals(""))URL="/Archive/ArchiveCatalogueList.action";
ValueStack stack = (ValueStack) request.getAttribute("struts.valueStack");

Object obj=stack.findValue("vo");
%>
<%!
String listChild2(ArchiveCatalogue parent)
{
	String htmlCode="";
	if(parent!=null && parent.getId()!=0)
	{
		htmlCode="<a href="+URL+"?vo.parent.id="+parent.getId()+">"+parent.getName()+"</a>"+htmlCode+"/";
		htmlCode=listChild2(parent.getParent())+htmlCode;
	}
	
	return htmlCode;
}
%>
<%
if(obj!=null)
{
		ArchiveCatalogue job=(ArchiveCatalogue)obj;
		out.println("<a href=\""+URL+"?vo.parent.id=1\">Root$</a>>"+listChild2(job));
}
%>

