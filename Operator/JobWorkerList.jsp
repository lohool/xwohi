<%@ page contentType="text/html; charset=gb2312" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<table>
<ww:iterator value="objList">
	<tr>
		<td><ww:property value="id"/></td>
		<td><ww:property value="account"/></td>
	</tr>
</ww:iterator>
</table>
