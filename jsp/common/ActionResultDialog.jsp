<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<%
String url=request.getParameter("url");
if(url==null || url.trim().equals(""))url="";
String targetPanel=request.getParameter("targetPanel");
if(targetPanel==null || targetPanel.trim().equals(""))targetPanel="";
%>
{
	"code":"200",
	"message":"<xwohi:i18n text="SaveSuccessful"/>",
	"forwardUrl":"",
	"refresh":"<%=targetPanel%>",
	"targetType":"parent",
	"target":"",
	"callback":"",
	"confirmMsg":"",
	"action":"close"
}
