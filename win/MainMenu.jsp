<%@ page session="true" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<h3>知识库</h3>
<div>
<a href="#" onclick="openWorkWindow('jsp/Archive/Archive.jsp','案卷管理')">案卷管理</a><br />
<a href="#" onclick="openWorkWindow('Document/DocumentWaitingForPigeonhole.action','公文归档')">公文归档</a><br />
<a href="#" onclick="openWorkWindow('Knowledge/KnowledgeCatalogueList.action?vo.parent.id=1','个人资料库')">个人资料库</a><br />

<a href="#" onclick="openWorkWindow('jsp/Album/Album.jsp','Album')">Album</a><br />

</div>

<h3>个人事务</h3>
<div>
<a href="#" onclick="openWorkWindow('/NotePad/NotePadList.action','记事本')">记事本</a><br />
<a href="#" onclick="openWorkWindow('/Joke/JokeList.action','Joke')">Joke</a><br />
<a href="#" onclick="openWorkWindow('/CalendarPlan/CalendarPlanList.action','个人日程')">个人日程</a><br />
<a href="#" onclick="openWorkWindow('WeekScheme/WeekSchemeList.action','我的工作计划')">我的工作计划</a><br />
<a href="#" onclick="openWorkWindow('/WorkLog/WorkLogList.action','工作日志')">工作日志</a><br />
<a href="#" onclick="openWorkWindow(null,'工作周报')">工作周报</a><br />
<a href="#" onclick="openWorkWindow(null,'工作月报')">工作月报</a><br />

<a href="#" onclick="openWorkWindow('/WeekScheme/WeekSchemeUnderlingsList.action','工作计划/日志审阅')">工作计划/日志审阅</a><br />
<a href="#" onclick="openWorkWindow('/ItemApplication/ItemApplicationRatifyList.action','设备申请批复')">设备申请批复</a><br />

<a href="#" onclick="openWorkWindow('/AddressList/AddressListList.action','联系人')">联系人</a><br />
<a href="#" onclick="openWorkWindow('/AddressGroup/AddressGroupList.action','群组管理')">通讯录群组管理</a><br />
</div>


<h3>内部邮件</h3>

<div>

subMenu6.addItem(new MenuItem("WeekScheme","/images/open.gif","新发邮件","/InBox/InBoxInput.action?mailBox=inbox"')">
subMenu6.addItem(new MenuItem("WeekScheme","/images/open.gif","发件箱","/OutBox/OutBoxList.action"')">
subMenu6.addItem(new MenuItem("WeekScheme","/images/open.gif","收件箱","/InBox/InBoxList.action?page=0&mailBox=inbox"')">
subMenu6.addItem(new MenuItem("WeekScheme","/images/open.gif","草稿箱",""')">
subMenu6.addItem(new MenuItem("WeekScheme","/images/open.gif","垃圾箱","/TrashBox/TrashBoxList.action"')">
</div>

<h3>工单</h3>
<div>
<a href="#" onclick="openWorkWindow('jsp/WorkOrder/WorkOrderTab.jsp','工单')">工单</a><br />
<a href="#" onclick="openWorkWindow('jsp/WorkOrder/WorkOrderClassList.jsp','工单类别')">工单类别</a><br />
</div>



<h3>Maintenance</h3>
<div>

<a href="#" onclick="openWorkWindow('Operator/OperatorList.jsp','Users','images/png/user.png')"><img src="images/png/user.png" border=0>Users</a><br />
<a href="#" onclick="openWorkWindow('Role/RoleList.action','Roles','images/png/user_business.png')"><img src="images/png/user_business.png" border=0>Roles</a><br />
<a href="#" onclick="openWorkWindow('Operator/ResourceList.jsp','资源管理')">Resource</a><br />
<a href="#" onclick="openWorkWindow('Privilege/PrivilegeList.action','资源权管理')">Privileges</a><br />
<a href="#" onclick="openWorkWindow('SysParam/SysParamList.action','系统参数')">Sys Parameters</a><br />
<a href="#" onclick="openWorkWindow('DataGroup/DataGroupList.action','数据组')">Data Group</a><br />
<a href="#" onclick="openWorkWindow('Permission/PermissionList.action','数据组权限')">Permissions</a><br />

<a href="#" onclick="openWorkWindow('Department/DepartmentList.action','部门管理')">Department</a><br />

<ww:if test="#session.operation_user.isAccess(\"/Job/JobList.action\")==true">
--------------<br>
<a href="#" onclick="openWorkWindow('Job/JobList.action','职务管理')">Jobs</a><br />
</ww:if>
--------------<br>

<a href="#" onclick="openWorkWindow('Operator/MyselfInfo.action','个人资料')">My Profile</a><br />
<a href="#" onclick="openDialog('Operator/OperatorPwd.action','修改密码')">Change Password</a><br />

<a href="#" onclick="openWorkWindow('Customer/Customer.jsp','Customers')">Customers</a><br />
<ul>
		<ww:action id="cl" name="CustomerGroupList" namespace="/CustomerGroup" executeResult="false" />
		<ww:property value="#attr.c1" />
		<ww:iterator value="#attr.cl.objList">
			<ww:if test="#session.operation_user.isPermitted(\"CustomerGroup\",id,1)==true">
			<li>
	         <a href="#" onclick="openWorkWindow('Customer/Customer.jsp?groupId=<ww:property value="id"/>','<ww:property value="name"/>')"><ww:property value="name"/></a><br />
			 </li>
			 </ww:if>
        </ww:iterator>
</ul>
</div>

