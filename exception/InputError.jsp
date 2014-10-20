<%@ page contentType="text/html; charset=utf8" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="webwork" prefix="ww" %>
{
	"code":"201",
	"fields": [
			  <ww:if test="errors!=null && errors.size()>0">
			  <ww:iterator value="errors" status="list">
				  {
					"key":"<ww:property value="key"/>",
					"keyText":"<ww:property value="getText(key)"/>",
					"value":"<ww:property value="getText(value[0])"/>"
				  }<ww:if test="#list.index < errors.size()-1">,</ww:if>
			   </ww:iterator>
			   </ww:if>
			  ]
}
