<%@ page session="true" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
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
