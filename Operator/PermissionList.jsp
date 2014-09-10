<%@ page session="true" %>
<%@ page contentType="text/html;charset=gb2312" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<?xml version="1.0" encoding="UTF-8"?>
<html xmlns:ww="http://www.opensymphony.com/webwork/" xmlns:xwohi="http://www.lohool.com/wohi/">
   <head>   </head>
   <body leftmargin="0" topmargin="0">
      <div class="page">
         <div id="pageTitle">
            <TABLE cellpadding="0" cellspacing="0" height="30" id="title-table" width="100%">
               <thead>
                  <TR>
                     <TD>
                        <span class="pageTitle-left"><xwohi:i18n text="Permission.list" />
                           <img height="13" src="/images/ico_arrow_title.gif" width="13" />
                        </span>
                        <span class="pageTitle-right">
                           <a href="/Permission/PermissionInput.action">
                              <xwohi:i18n text="new" />
                           </a>
                        </span>
                     </TD>
                  </TR>
               </thead>
            </TABLE>
         </div>
         <table border="0" cellpadding="0" cellspacing="0" width="98%">
            <tr>
               <td>
                  <a href="#" onclick="OpenAndCloseSeach(document.all.seachdiv);return false;">
                     <font color="red">>>>
                        <xwohi:i18n text="search" />
                     </font>
                  </a>
                  <hr color="red" style="height:1px;" />
               </td>
            </tr>
         </table>
         <div align="left" id="seachdiv" style="display:none">
            <ww:form action="PermissionList" method="post" name="form1" namespace="/Permission" validate="true"><ww:hidden name="vo.id" />
               <ww:hidden name="page" />
               <ww:hidden name="pageSize" />
               <table>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Permission.name" />
                     </TD>
                     <TD>
                        <ww:textfield name="vo.name" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Permission.URI" />
                     </TD>
                     <TD>
                        <ww:textfield name="vo.uri" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Permission.dataGroup" />
                     </TD>
                     <TD>
                        <ww:textfield name="vo.dataGroup" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="center" colspan="2"><input type="submit" value="<xwohi:i18n text="search" />">
      <input type="reset" value="<xwohi:i18n text="reset" />"></TD>
                  </TR>
               </table>
            </ww:form>
         </div>
         <table cellspacing="0" class="sort-table" id="sort-table" width="100%">
            <thead>
               <tr>
                  <td><xwohi:i18n text="Permission.name" /></td>
                  <td><xwohi:i18n text="Permission.value" /></td>
                  <td><xwohi:i18n text="Permission.URI" /></td>
                  <td><xwohi:i18n text="Permission.dataGroup" /></td>
                  <TD width="30">
                     <xwohi:i18n text="delete" />
                  </TD>
                  <TD width="30">
                     <xwohi:i18n text="modify" />
                  </TD>
               </tr>
            </thead>
            <tbody>
               <ww:iterator value="objList">
                  <TR>
                     <td><ww:property value="name"/></td>
                     <td><ww:property value="value"/></td>
                     <td><ww:property value="uri"/></td>
                     <td><ww:property value="dataGroup.name"/></td>
                     <TD><a href="javascript:doDelete('<ww:property value="id"/>')"><img src="/images/delete.gif" border="0"/></a></TD>
                     <TD><a href="javascript:doLoad('<ww:property value="id"/>')"><img src="/images/detail.gif" border="0" /></a></TD>
                  </TR>
               </ww:iterator>
            </tbody>
         </table>
         <ww:property escape="false" value="paginateView" />
      </div>
   </body>
</html>
