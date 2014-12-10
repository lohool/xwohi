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
				  "preview":"<img src=\"temp_file/<ww:property value="#session.operation_user.account"/>/<ww:property value="url"/>\" width='120'>",
				  "name":"<ww:property value="name"/>",
				  "uri":"/temp_file/<ww:property value="#session.operation_user.account"/>/<ww:property value="url"/>"
				  }<ww:if test="#list.index < objList.size()-1">,</ww:if>
			   </ww:iterator>
			  ]
}