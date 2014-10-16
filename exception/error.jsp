<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="webwork" prefix="ww" %>
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
</HEAD>

<BODY>
<br>
	<%
	try{
	Exception ex=(Exception)session.getAttribute("action.exception");
	ex.printStackTrace() ;
	}catch(Exception ee)
	{}
	%>


</BODY>
</HTML>
