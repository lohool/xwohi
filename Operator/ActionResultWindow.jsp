<%@ page contentType="text/html;charset=utf-8" %> 
<%
String url=request.getParameter("url");
if(url==null || url.trim().equals(""))url="";
%>
{
	"code":"200",
	"message":"Successful",
	"forwardUrl":"<%=url%>",
	"targetType":"self",
	"target":"",
	"callback":"",
	"confirmMsg":"",
	"action":""
}
