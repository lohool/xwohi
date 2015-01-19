package com.lohool.jproject.xwohi.operator.action;

/**
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: lohool.com</p>
 * <p>mail:lohool@hotmail.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */
import com.lohool.jproject.xwohi.operator.OperatorManagement;
import com.lohool.jproject.xwohi.operator.po.Operator;
import com.lohool.jproject.xwohi.operator.po.Role;
import com.opensymphony.xwork2.*;
import java.io.IOException;
import java.util.Collection;
import javax.servlet.http.*;
import org.apache.struts2.ServletActionContext;

public class LoginAction
    extends ActionSupport{

    private String account;
    private String password;
    private String phone;
    
    @javax.annotation.Resource
    private OperatorManagement service;
    
    private String securityCode;

    
    @Override
    public String execute() throws Exception
    {
        
        HttpServletRequest request = ServletActionContext.getRequest();

        String CONTENT_TYPE=request.getContentType();

        String remoteAddr = request.getRemoteAddr();
        HttpSession session = request.getSession();
        
        String serverCode = (String)session.getAttribute("SESSION_SECURITY_CODE");
         if(serverCode==null || !serverCode.equalsIgnoreCase(securityCode)){
             //super.addActionError(getText("invalid_security_code")) ;
             addFieldError("account", "invalid_security_code");
             return INPUT;
         }

        
        Operator user = null;
//        OperatorManagement om = new OperatorManagement();
        user = getService().authorize(account, password);
//        om.close();
        
        if (user != null)
        {
            if(user.getState() !=1)
            {
                super.addActionError(getText("User_is_inactive")) ;
                service.writeLoginLog(user.getId(), account, remoteAddr, 1, false);
                return INPUT;
            }
            else
            {                
                //web session
                session.setAttribute("softphone", phone);
                session.setAttribute("operation_user", user);
                
                //unlazy roles and resources
                Collection<Role> roles=user.getRoles();
                for(Role role:roles)
                {
                   Collection<com.lohool.jproject.xwohi.operator.po.Resource> resources= role.getResources();
                   for(com.lohool.jproject.xwohi.operator.po.Resource resource:resources)
                   {
                       resource.getPrivileges();
                   }
                }
                service.writeLoginLog(user.getId(), account, remoteAddr, 1, true);
                return SUCCESS;
            }
        }
        else
        {
            addFieldError("account", "Invalid_user_account_or_password");
            service.writeLoginLog(0, account, remoteAddr, 1, false);
            return INPUT;
        }
    }
    @Override
   public String getText(String text)
   {

       String i18nText = com.xwohi.framework.util.I18n.getLocalizedString(text);

       if (i18nText == null || i18nText.trim().equals(""))
       {
           i18nText = text;
       }

       try
       {
           return com.xwohi.framework.util.StringUtil.
                   convertUTF8String2Unicode(i18nText);
       }
       catch (IOException ex)
       {
           return i18nText;
       }
       
   }
    public String getAccount()
    {
        return account;
    }

    public void setAccount(String account)
    {
        this.account = account;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public OperatorManagement getService()
    {
        return service;
    }

    public void setService(OperatorManagement service)
    {
        this.service = service;
    }

    /**
     * @return the phone
     */
    public String getPhone()
    {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    /**
     * @return the securityCode
     */
    public String getSecurityCode()
    {
        return securityCode;
    }

    /**
     * @param securityCode the securityCode to set
     */
    public void setSecurityCode(String securityCode)
    {
        this.securityCode = securityCode;
    }
}