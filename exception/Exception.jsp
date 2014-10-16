
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.io.*" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<%
	Exception e=((Exception)request.getAttribute("action.exception"));
	//e.printStackTrace(new PrintWriter(out));
 %>
{
	"code":"500",
	"message":"对不起！系统发生错误，请联系管理员。<br><%=e.toString()%>",
	"forwardUrl":"",
	"targetType":"self",
	"target":"",
	"callback":"",
	"confirmMsg":"",
	"action":"close"
}

