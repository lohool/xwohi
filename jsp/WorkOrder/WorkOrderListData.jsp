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
				  "id":"<ww:property value="id"/>",
				  "workorderClass":"<ww:property value="workorderClass.name"/>",
				  "processor":"<ww:property value="processor.name"/>",
				  "title":"<ww:property value="title"/>",
				  "state":"<ww:if test="state==1">处理中</ww:if><ww:else>已结案</ww:else>"
				  }<ww:if test="#list.index < objList.size()-1">,</ww:if>
			   </ww:iterator>
			  ]
}
			  