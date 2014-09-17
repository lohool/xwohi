<%@ page contentType="text/html;charset=utf-8" %> 
<%
String url=request.getParameter("url");
if(url==null || url.trim().equals(""))url="";
%>
{
	"code":"200",
	"message":"保存成功！",
	"forwardUrl":"<%=url%>",
	"targetType":"parent",
	"target":"",
	"callback":"",
	"confirmMsg":"",
	"action":"close"
}
