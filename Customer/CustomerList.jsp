<%@ page session="true" %>
<%@ page contentType="text/html;charset=gb2312" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<html xmlns:ww="http://www.opensymphony.com/webwork/" xmlns:xwohi="http://www.lohool.com/wohi/">
   <body leftmargin="0" topmargin="0">
      <div class="page">
         <div id="pageTitle">
            <TABLE cellpadding="0" cellspacing="0" height="30" id="title-table" width="100%">
               <thead>
                  <TR>
                     <TD>
                        <span class="pageTitle-left"><xwohi:i18n text="Customer.list" />
                           <img height="13" src="/images/ico_arrow_title.gif" width="13" />
                        </span>
                        <span class="pageTitle-right">
                           <a href="/Customer/CustomerInput.action">
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
            <ww:form action="CustomerList" method="post" name="form1" namespace="/Customer" validate="true"><ww:hidden name="vo.id" />
               <ww:hidden name="page" />
               <ww:hidden name="pageSize" />
               <table>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.company" />
                     </TD>
                     <TD>
                        <ww:textfield name="vo.company" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.name" />
                     </TD>
                     <TD>
                        <ww:textfield name="vo.name" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.birthday" />
                     </TD>
                     <TD>
                        <ww:textfield name="vo.birthday" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.idCardNo" />
                     </TD>
                     <TD>
                        <ww:textfield name="vo.idCardNo" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.phone" />
                     </TD>
                     <TD>
                        <ww:textfield name="vo.phone" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.mobile" />
                     </TD>
                     <TD>
                        <ww:textfield name="vo.mobile" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.address" />
                     </TD>
                     <TD>
                        <ww:textfield name="vo.address" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.job" />
                     </TD>
                     <TD>
                        <ww:textfield name="vo.job" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.accecptProductNews" />
                     </TD>
                     <TD>
                        <ww:textfield name="vo.accecptProductNews" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.acceptInfoRemind" />
                     </TD>
                     <TD>
                        <ww:textfield name="vo.acceptInfoRemind" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.group" />
                     </TD>
                     <TD>
                        <ww:textfield name="vo.group.name" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.vipCard" />
                     </TD>
                     <TD>
                        <ww:textfield name="vo.vipCard" required="true" />
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
                  <td><xwohi:i18n text="Customer.company" /></td>
                  <td><xwohi:i18n text="Customer.name" /></td>
                  <td><xwohi:i18n text="Customer.birthday" /></td>
                  <td><xwohi:i18n text="Customer.idCardNo" /></td>
                  <td><xwohi:i18n text="Customer.phone" /></td>
                  <td><xwohi:i18n text="Customer.mobile" /></td>
                  <td><xwohi:i18n text="Customer.job" /></td>
                  <td><xwohi:i18n text="Customer.group" /></td>
                  <td><xwohi:i18n text="Customer.vipCard" /></td>
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
                     <td><ww:property value="company"/></td>
                     <td><ww:property value="name"/></td>
                     <td><ww:property value="birthday"/></td>
                     <td><ww:property value="idCardNo"/></td>
                     <td><ww:property value="phone"/></td>
                     <td><ww:property value="mobile"/></td>
                     <td><ww:property value="job"/></td>
                     <td><ww:property value="group.name"/></td>
                     <td><ww:property value="vipCard"/></td>
                     <TD><a href="javascript:doDelete('<ww:property value="id"/>')"><img src="/images/delete.gif" border="0"/></a></TD>
                     <TD><a href="javascript:doLoad('<ww:property value="id"/>')"><img src="/images/detail.gif" border="0" /></a></TD>
                  </TR>
               </ww:iterator>
            </tbody>
         </table>
         <ww:property value="paginateView" escape="false"/>
      </div>
   </body>
</html>
