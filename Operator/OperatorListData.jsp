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
				  "account":"<ww:property value="account"/>",
				  "name":"<ww:property value="name"/>",
				  "department.name":"<ww:property value="department.name"/>",
				  "job.name":"<ww:property value="job.name"/>",
				  "state":"<ww:property value="state"/>"
				  }<ww:if test="#list.index < objList.size()-1">,</ww:if>
			   </ww:iterator>
			  ]
}