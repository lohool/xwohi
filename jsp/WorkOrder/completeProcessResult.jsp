<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<%@ taglib uri="webwork" prefix="ww" %>
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
	"targetType":"",
	"target":"",
	"callback":"",
	"confirmMsg":"",
	"action":"close",
	"processState":"<ww:property value="vo.state" />",
	"processor":"<ww:property value="vo.operator.id" />"
}
