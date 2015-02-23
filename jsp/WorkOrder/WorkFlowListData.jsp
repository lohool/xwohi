<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
{
			  "pager":
				{
					"total":<ww:property value="resultSize"/>,
					"current_page":<ww:property value="page"/>,
					"pagesize":<ww:property value="pageSize"/>
				},
			  "data": [
			  <ww:iterator value="objList" status="list">
				  {
				  "sequence":"<ww:property value="sequence"/>",
				  "name":"<ww:property value="name"/>",
				  "type":"<ww:if test="type==0">顺序</ww:if><ww:else>审批</ww:else>",
				  "workorderClass":"<ww:property value="workorderClass.name"/>",
				  "next":"<ww:property value="next"/>",
				  "newProcessor":"<ww:property value="newProcessor"/>",
				  "currentProcessor":"<ww:property value="currentProcessor"/>",
				  "description":"<ww:property value="description"/>",
				  "id":"<ww:property value="description"/>",
				  "state":"<ww:property value="state"/>"
				  }<ww:if test="#list.index < objList.size()-1">,</ww:if>
			   </ww:iterator>
			  ]
}