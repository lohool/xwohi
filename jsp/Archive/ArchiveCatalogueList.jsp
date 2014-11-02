<%@ page contentType="application/json; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>

<%System.out.println(request.getParameter("parentId"));%>
<%Object parentId=request.getParameter("parentId");%>
<%if(parentId==null || parentId.equals("1")){%>
[
	{"id":1,"text":"Root","children":
<%}%>
		[
		<ww:iterator value="objList" status="list">
		{"id":<ww:property value="id"/>,"parentId":<ww:property value="id"/>,"text":"<ww:property value="name"/>","type":"folder","children":true}<ww:if test="#list.index < objList.size()-1">,</ww:if>
		</ww:iterator>
		]

<%if(parentId==null || parentId.equals("1")){%>
	}
]
<%}%>
