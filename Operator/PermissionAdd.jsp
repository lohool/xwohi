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
                           <xwohi:i18n text="Permission.info" />
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
            <ww:form action="PermissionAdd" method="post" name="form1" namespace="/Permission" validate="true">
               <table align="center" bgcolor="#E3E3E3" cellpadding="0" cellspacing="0" class="sort-table" id="input_table" width="500">
                  <thead>
                     <TR>
                        <TD colspan="2">
                           <xwohi:i18n text="Permission.info" />
                        </TD>
                     </TR>
                  </thead>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Permission.name" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.name" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Permission.value" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.value" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Permission.URI" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.uri" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Permission.dataGroup" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:select list="select.dataGroup" listKey="id" listValue="name" name="vo.dataGroup.id" value="vo.dataGroup.id" />
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
