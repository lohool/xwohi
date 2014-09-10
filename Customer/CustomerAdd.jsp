<%@ page session="true" %>
<%@ page contentType="text/html;charset=gb2312" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
<?xml version="1.0" encoding="UTF-8"?>
<html xmlns:ww="http://www.opensymphony.com/webwork/" xmlns:xwohi="http://www.lohool.com/wohi/">
   <link href="/css/style.css" rel="stylesheet" />
   <link href="/css/sortabletable.css" rel="StyleSheet" type="text/css" />
   <body leftmargin="0" topmargin="0">
      <div class="page">
         <div id="pageTitle">
            <TABLE cellpadding="0" cellspacing="0" height="30" id="title-table" width="100%">
               <thead>
                  <TR>
                     <TD>
                        <span class="pageTitle-left">
                           <img height="13" src="/images/ico_arrow_title.gif" width="13" />
                           <xwohi:i18n text="Customer.info" />
                        </span>
                        <span class="pageTitle-right" />
                     </TD>
                  </TR>
               </thead>
            </TABLE>
         </div>
         <br />
         <br />
         <div align="center">
            <ww:form action="CustomerAdd" method="post" name="form1" namespace="/Customer" validate="true">
               <table align="center" bgcolor="#E3E3E3" cellpadding="0" cellspacing="0" class="sort-table" id="input_table" width="500">
                  <thead>
                     <TR>
                        <TD colspan="2">
                           <xwohi:i18n text="Customer.info" />
                        </TD>
                     </TR>
                  </thead>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.company" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.company" required="true" value="" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.name" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.name" required="true" value="" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.birthday" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.birthday" required="true" value="" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.idCardNo" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.idCardNo" required="true" value="" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.phone" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.phone" required="true" value="" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.mobile" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.mobile" required="true" value="" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.address" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.address" required="true" value="" />
                     </TD>
                  </TR>
				  <!--
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.tradeLog" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:select list="select.tradeLog" listKey="id" listValue="id" name="vo.tradeLog.id" value="vo.tradeLog.tradeLog.id" />
                     </TD>
                  </TR>
				  -->
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.job" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.job" required="true" value="" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.speciality" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textarea cols="40" name="vo.speciality" required="true" rows="7" value="" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.favorite" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textarea cols="40" name="vo.favorite" required="true" rows="7" value="" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.custom" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textarea cols="40" name="vo.custom" required="true" rows="7" value="" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.personlity" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.personlity" required="true" value="" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.accecptProductNews" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.accecptProductNews" required="true" value="" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.acceptInfoRemind" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.acceptInfoRemind" required="true" value="" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.group" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:select list="select.group" listKey="id" listValue="name" name="vo.group.id" value="vo.group.name" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.vipCard" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.vipCard" required="true" value="" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.sex" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.sex" required="true" value="" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="center" colspan="2"><input type="submit" value="<xwohi:i18n text="submit" />">
      <input type="reset" value="<xwohi:i18n text="reset" />"></TD>
                  </TR>
               </table>
            </ww:form>
         </div>
      </div>
   </body>
</html>
