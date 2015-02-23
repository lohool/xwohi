<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<%@ page import="com.opensymphony.xwork2.util.ValueStack"  %>
<%@ page import="java.util.*"  %>
<%@ page import="com.lohool.jproject.xwohi.common.*"  %>
<%@ page import="com.lohool.jproject.xwohi.po.*"  %>
<%@ page import="java.util.*"  %>
<%@ page import="net.sf.json.JSONArray"  %>
<%!String URL;%>
<%
ValueStack stack = (ValueStack) request.getAttribute("struts.valueStack");

Object obj=stack.findValue("objList");
%>
<%!
String listChild(Collection woc)
{
	String htmlCode=" ";
	for(Object o: woc)
	{
		WorkOrderClass wo=(WorkOrderClass)o;
		if(wo!=null && wo.getId()!=0)
		{
			htmlCode+="{";
			htmlCode+="\"name\":\""+wo.getName()+"\",";
			htmlCode+="\"creator\":\""+wo.getCreator().getName()+"\",";
			htmlCode+="\"description\":\""+wo.getDescription()+"\",";
			htmlCode+="\"state\":\""+wo.getState()+"\",";
			htmlCode+="\"Select\":\"<a href='#' onclick='feedback({\\\"vo.workorderClass.id\\\":\\\""+wo.getId()+"\\\",workorderClass:\\\""+wo.getName()+"\\\",classCode:\\\""+wo.getClassCode()+"/"+wo.getId()+"\\\"})'>Sel</a>\",";
			htmlCode+="\"id\":\""+wo.getId()+"\",";			
			htmlCode+="\"classCode\":\""+wo.getClassCode()+"\"";			
			if(wo.getChildren()!=null && wo.getChildren().size()>0)
			{
				htmlCode+=",\"children\":["+listChild(wo.getChildren())+"]";
			}
			htmlCode+="}";
			htmlCode+=",";
		}
	}
	return htmlCode.substring(0,htmlCode.length()-1);
}
%>
<%
Collection woc=null;
if(obj!=null)
{
	String code="";
	woc=(Collection)obj;
	//System.out.println(listChild(woc));
}
%>
{
			  "pager":
				{
					"total":<ww:property value="resultSize"/>,
					"current_page":<ww:property value="page"/>,
					"pagesize":<ww:property value="pageSize"/>
				},
			  "data": [
					{"name":"Root","Creator":"Admin","description":"Root--uneditable","state":"Active","Select":"","id":"1","classCode":"/1",
						"children":[<%=listChild(woc)%>]
					}
			  ]
}

