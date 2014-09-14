<%@ page session="true" %>
<%@ page contentType="text/html;charset=gb2312" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>


      <div class="page">
         <div align="center"><ww:fielderror cssStyle="color:red;"/>
            <ww:form action="CustomerAdd" method="post" name="form1" namespace="/Customer" validate="true" onsubmit="return sumbitDialodForm(this)" theme="simple">
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
                        <ww:textfield name="vo.company" required="true"  />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.name" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.name" required="true"  />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.birthday" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.birthday" required="true"  />
                     </TD>
                  </TR>
				  <!--
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.idCardNo" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.idCardNo" required="true"  />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.phone" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.phone" required="true"  />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.mobile" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.mobile" required="true"  />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.address" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.address" required="true"  />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.job" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.job" required="true"  />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.speciality" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textarea cols="40" name="vo.speciality" required="true" rows="7"  />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.favorite" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textarea cols="40" name="vo.favorite" required="true" rows="7"  />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.custom" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textarea cols="40" name="vo.custom" required="true" rows="7"  />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.personlity" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.personlity" required="true"  />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.accecptProductNews" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.accecptProductNews" required="true"  />
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.acceptInfoRemind" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.acceptInfoRemind" required="true"  />
                     </TD>
                  </TR>
				  -->
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.group" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
						<select name="vo.group.id">
						<ww:action id="cg" name="CustomerGroupList" namespace="/CustomerGroup" executeResult="false" />
						<ww:iterator value="#attr.cg.objList">
							<option value="<ww:property value="id"/>" <ww:if test="vo.group.id==id">selected</ww:if>><ww:property value="name"/></option>
						</ww:iterator>
						</select>
                     </TD>
                  </TR>
                  <TR>
                     <TD align="right" bgColor="#ffffff" width="40%">
                        <xwohi:i18n text="Customer.vipCard" />
                     </TD>
                     <TD bgColor="#ffffff" width="60%">
                        <ww:textfield name="vo.vipCard" required="true"  />
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
      </div>
<script type="text/javascript">
function sumbitDialodForm(form)
{
		$.ajax({ 
			url: form.action, 
			//context: document.body, 
			data :   $(form).find(":input").serialize()  ,
			type:"post",
			dataType:"json",
			success: function(data){
				if(data.code=="200")
				{
					var win =_window.windows[_window.focusWindowId];
					var target=data.target;
					alert(data.forwardUrl)
					if(target && target!="")
					{
						$("#"+target).empty();
						$("#"+target).load(data.forwardUrl,null,function(){reDefineHTMLActions()});
					}
					else
					{
						var parentWin=_window.windows[win.parentWindow];
						if(data.forwardUrl && data.forwardUrl!="")parentWin.SetContent("[url]"+data.forwardUrl);
					}
					if(data.action=="close")win.Close();
				}
				else
				{
					 alert(data.message);
				}

			},
			error: function(XMLHttpRequest, textStatus, errorThrown) 
			{
				//$('#'+id).html(xhr.responseText);
				var win =_window.windows[_window.focusWindowId];
				win.SetContent(XMLHttpRequest.responseText)
					/*
                        alert(XMLHttpRequest.status);
                        alert(XMLHttpRequest.readyState);
                        alert(textStatus);
						alert(XMLHttpRequest.responseText)
						*/
            }
	  });
		
	return false;
}
</script>
