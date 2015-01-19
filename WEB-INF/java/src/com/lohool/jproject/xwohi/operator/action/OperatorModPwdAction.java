package com.lohool.jproject.xwohi.operator.action;


import com.lohool.jproject.xwohi.operator.po.Operator;
import com.lohool.jproject.xwohi.operator.OperatorManagement;
import static com.opensymphony.xwork2.Action.INPUT;
import com.xbreeze.framework.xwohi.common.action.AbstractAction;



/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: lohool.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class OperatorModPwdAction extends AbstractAction
{
    private String password;
    private String oldPwd;
    private String password2;
    @javax.annotation.Resource
    private OperatorManagement service;
    public OperatorModPwdAction()
    {
    }

    public String doExecute() throws Exception
    {
        //OperatorManagement.assertLimit(getUser().getID(),OperatorManagement.ADD);
        Operator user=(Operator)getUser();

        if(!this.password.equals(this.password2))
        {
            super.addFieldError("password","Invalid_new_passowrd");
            return INPUT;
        }
        
        if(!user.matchPassword(this.getOldPwd()))
        {
            super.addFieldError("oldPwd","Invalid_old_password");
            return INPUT;
        }

//        OperatorManagement om= new OperatorManagement();

        Operator op=(Operator)service.load(user.getId() )  ;

        op.setPassword(this.getPassword() ) ;
        //op.setAccount(this.getAccount() ) ;
        
            service.modify(op) ;

        user.setPassword(this.getPassword()) ;
        return SUCCESS ;
    }
    public String getPassword()
    {
        return password;
    }
    public void setPassword(String password)
    {
        this.password = password;
    }
    public String getOldPwd()
    {
        return oldPwd;
    }
    public void setOldPwd(String oldPwd)
    {
        this.oldPwd = oldPwd;
    }
    public String getPassword2()
    {
        return password2;
    }
    public void setPassword2(String password2)
    {
        this.password2 = password2;
    }

    public OperatorManagement getService()
    {
        return service;
    }

    public void setService(OperatorManagement service)
    {
        this.service = service;
    }

}
