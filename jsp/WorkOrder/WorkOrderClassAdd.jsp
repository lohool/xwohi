<%@ page session="true" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
      <div class="page">
            <ww:form action="WorkOrderClassAdd" method="post" name="form1" namespace="/WorkOrderClass" validate="true" onsubmit="return ajaxDatagridSubmit(this,'WorkOrderClass_list');">
			<div class="container" layoutHeight="38">
               <table align="center" bgcolor="#E3E3E3" cellpadding="0" cellspacing="0" class="sort-table" id="input_table" height="180">
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="WorkOrderClass.parent" />:
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
						<INPUT TYPE="hidden" NAME="vo.parent.id" value="<ww:property value="vo.id" />">
						<ww:property value="vo.parent.name" />
						<br>
						<ww:property value="vo.parent.description" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="WorkOrderClass.name" />:
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
