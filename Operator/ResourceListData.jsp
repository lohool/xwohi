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
				  "<xwohi:i18n text="ID" />":"<ww:property value="resourceID"/>",
				  "<xwohi:i18n text="Resource.name" />":"<ww:property value="getText(name)"/>",
				  "<xwohi:i18n text="Resource.nameCode" />":"<ww:property value="name"/>",
				  "<xwohi:i18n text="userType" />":"<ww:property value="userType"/>",
				  "<xwohi:i18n text="Resource.description" />":"<ww:property value="description"/>"
				  }<ww:if test="#list.index < objList.size()-1">,</ww:if>
			   </ww:iterator>
			  ]
}