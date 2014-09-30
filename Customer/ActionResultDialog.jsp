<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<%
Object currentPage=request.getParameter("page");
if(currentPage==null)currentPage="";
Object pageSize=request.getParameter("pageSize");
if(pageSize==null)pageSize="";

%>
{
	"code":"200",
	"message":"Successful",
	"forwardUrl":"",
	"targetType":"parent",
	"target":"",
	"callback":"",
	"confirmMsg":"",
	"action":"close"
}
