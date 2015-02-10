<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="struts2" prefix="ww" %>
<%@ page import="com.opensymphony.xwork2.ognl.OgnlValueStack"  %>
<%@ page import="java.util.*"  %>
<%@ page import="com.lohool.jproject.crm.po.*"  %>
<%
OgnlValueStack stack = (OgnlValueStack) request.getAttribute("struts.valueStack");

Object obj=stack.findValue("objList");
%>
<%!
String listChild(Collection children,int level)
{
	level++;
	String htmlCode="";
	if(children!=null && children.size()>0)
	{
		Object[] childArray=children.toArray();
		for(int i=0;i<childArray.length;i++)
		{
			Department child=(Department)childArray[i];
			htmlCode+="<li target=\"sid_obj\" rel=\""+child.getId()+"\"><a href=\"Operator/OperatorSelectList.action?vo.department.id="+child.getId()+"\" target=\"ajax\" rel=\"OPSelect_Box\">"+child.getName()+"</a>";
			if(child.getChildren()==null || child.getChildren().size()==0)
			{
				htmlCode+="</li>";
			}
			else
			{
				htmlCode+="<ul>";
				htmlCode+=listChild(child.getChildren(),level);
				htmlCode+="</ul>";
				htmlCode+="</li>";
			}
		}
	}
	
	return htmlCode;
}
%>
<div class="divider"></div>
<ul class="tree treeFolder">
<%
if(obj!=null)
{
	Collection list=(Collection)obj;
	Iterator iter=list.iterator();
	out.println(listChild(list,-1));
}
%>
</ul>
