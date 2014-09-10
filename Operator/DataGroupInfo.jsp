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
                           <xwohi:i18n text="DataGroup.info" />
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
            <ww:form action="DataGroupModify" method="post" name="form1" namespace="/DataGroup" validate="true">
			<ww:hidden name="vo.id" />

               <table align="center" bgcolor="#E3E3E3" cellpadding="0" cellspacing="0" class="sort-table" id="input_table" width="500">
                  <thead>
                     <TR>
                        <TD colspan="2">
                           <xwohi:i18n text="DataGroup.info" />
                        </TD>
                     </TR>
                  </thead>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="DataGroup.name" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.name" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="DataGroup.URI" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.URI" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="DataGroup.dataObjectKeyName" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.dataObjectKeyName" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="DataGroup.dataObjectName" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.dataObjectName" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="DataGroup.groupObjectName" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.groupObjectName" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="DataGroup.groupObjectKeyName" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.groupObjectKeyName" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="DataGroup.nameSpace" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.nameSpace" required="true" />
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
