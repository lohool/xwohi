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
				  "id":"<ww:property value="resourceID"/>",
				  "name":"<ww:property value="getText(name)"/>",
				  "nameCode":"<ww:property value="name"/>",
				  "userType":"<ww:property value="userType"/>",
				  "description":"<ww:property value="description"/>"
				  }<ww:if test="#list.index < objList.size()-1">,</ww:if>
			   </ww:iterator>
			  ]
}