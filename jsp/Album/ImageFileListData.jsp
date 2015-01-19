<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
data[
			  <ww:iterator value="objList" status="list">
				  {
				  "name":"<ww:property value="name"/>",
				  "uri":"temp_file/<ww:property value="#session.operation_user.account"/>/<ww:property value="url"/>"
				  }<ww:if test="#list.index < objList.size()-1">,</ww:if>
			   </ww:iterator>
			  ]
