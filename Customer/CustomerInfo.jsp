<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF8" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
      <div class="page">
            <ww:form action="CustomerModify" method="post" name="form1" namespace="/Customer" validate="true" onsubmit="return sumbitAjaxForm(this,'%{#parameters.targetGrid}')" theme="simple">
			<ww:hidden name="vo.id" />
               <table align="center" bgcolor="#E3E3E3" cellpadding="0" cellspacing="0" class="sort-table" id="input_table" width="500">
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.company" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.company" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.name" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.name" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.birthday" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.birthday" required="true" />
                     </TD>
                  </TR>
				  <!--
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.idCardNo" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.idCardNo" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.phone" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.phone" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.mobile" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.mobile" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.address" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.address" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.job" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.job" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.speciality" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textarea cols="40" name="vo.speciality" required="true" rows="7" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.favorite" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textarea cols="40" name="vo.favorite" required="true" rows="7" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.custom" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textarea cols="40" name="vo.custom" required="true" rows="7" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.personlity" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.personlity" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.accecptProductNews" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.accecptProductNews" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.acceptInfoRemind" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.acceptInfoRemind" required="true" />
                     </TD>
                  </TR>
				  -->
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.group" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:select list="select.group" listKey="id" listValue="name" name="vo.group.id" value="vo.group.id" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.vipCard" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.vipCard" required="true" />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.sex" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.sex" required="true"  />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="center" colspan="2"><input type="submit" value="<xwohi:i18n text="submit" />">
      <input type="reset" value="<xwohi:i18n text="reset" />"></TD>
                  </TR>
               </table>
            </ww:form>
      </div>
