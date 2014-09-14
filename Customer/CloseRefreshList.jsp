<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
{
	"code":"200",
	"message":"Successful",
	"forwardUrl":"Customer/CustomerList.action?vo.group.id=<ww:property value="vo.group.id"/>&vo.group.name=<ww:property value="vo.group.name"/>",
	"navWinId":"customer_panel",
	"target":"customer_panel",
	"callbackAction":"closeCurrent",
	"confirmMsg":"",
	"action":"close"
}
