<%@ page session="true" %>
<%@ page contentType="text/html;charset=gb2312" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
      <div class="page">
            <ww:form action="CustomerGroupAdd" method="post" name="form1" namespace="/CustomerGroup" validate="true">
			<div class="container" layoutHeight="38">
               <table align="center" bgcolor="#E3E3E3" cellpadding="0" cellspacing="0" class="sort-table" id="input_table" height="180">
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="CustomerGroup.name" />:
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.name" required="true"/>
                     </TD>
                  </TR>
               </table>
				</div>
				<div class="panel" style="height:25px;text-align:center;">
					  <input type="submit"  value="<xwohi:i18n text="submit" /> ">
					  <input type="reset" value="<xwohi:i18n text="reset" />">
					  <input type="button" value="<xwohi:i18n text="close" />" onclick="_window.closeCurrent()">
				</div>
            </ww:form>
      </div>
