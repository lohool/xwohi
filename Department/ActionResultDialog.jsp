<%@ page contentType="text/html;charset=utf-8" %> 
<%
String url=request.getParameter("url");
if(url==null || url.trim().equals(""))url="";
String targetPanel=request.getParameter("targetPanel");
if(targetPanel==null || targetPanel.trim().equals(""))targetPanel="";
%>
{
	"code":"200",
	"message":"保存成功！",
	"forwardUrl":"",
	"refresh":"<%=targetPanel%>",
	"targetType":"parent",
	"target":"",
	"callback":"",
	"confirmMsg":"",
	"action":"close"
}
