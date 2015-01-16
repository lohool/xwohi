<%@ page contentType="text/html; charset=utf8" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>

<div class="page">
<ww:form name="operator_mod_pwd" id="operator_mod_pwd" namespace="/Operator" action="OperatorModPwd" method="post"  validate="true" onsubmit="return ajaxSubmit(this);">
<div class="container" layoutHeight="38">
<p><label class="label"><xwohi:i18n text="oldPwd"/>:</label><ww:password  name="oldPwd"  /></p>
<p><label class="label"><xwohi:i18n text="password"/>:</label><ww:password  name="password"  onchange="validateForm_operator_mod_pwd()"/></p>
<p><label class="label"><xwohi:i18n text="password2"/>:</label><ww:password  name="password2"  /></p>
</div>
<div class="panel" style="height:25px;text-align:center;">
      <input type="submit"  value="<xwohi:i18n text="submit" /> ">
      <input type="reset" value="<xwohi:i18n text="reset" />">
      <input type="button" value="<xwohi:i18n text="close" />" onclick="_window.closeCurrent()">
</div>
</ww:form>
</div>
<script>
function test()
{
	var getFieldValue = function(field) {
            var type = field.type ? field.type : field[0].type;
            if (type == 'select-one' || type == 'select-multiple') {
                return (field.selectedIndex == -1 ? "" : field.options[field.selectedIndex].value);
            } else if (type == 'checkbox' || type == 'radio') {
                if (!field.length) {
                    field = [field];
                }
                for (var i = 0; i < field.length; i++) {
                    if (field[i].checked) {
                        return field[i].value;
                    }
                }
                return "";
            }
            return field.value;
        }
var continueValidation=true;
	form = document.getElementById("operator_mod_pwd");
	    if (form.elements['password']) 
		{
            field = form.elements['password'];

            var errors = "test passed";
            var fieldValue = getFieldValue(field);
            
            if (continueValidation && fieldValue != null && !fieldValue.match("(?=(?:.*?\\d){2})(?=.*[a-z])(?=.*[A-Z])")) {
                errors = "test failed";
				alert("hehe")
                addError(field, errors);
                
            }
        }
		alert(errors)
}
</script>

