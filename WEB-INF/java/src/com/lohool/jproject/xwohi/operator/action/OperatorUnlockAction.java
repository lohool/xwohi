package com.lohool.jproject.xwohi.operator.action;


import com.lohool.jproject.xwohi.operator.OperatorManagement;
import com.xbreeze.framework.xwohi.common.action.AbstractAction;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: lohool.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class OperatorUnlockAction extends AbstractAction
{
    private int ID;
    @javax.annotation.Resource
    private OperatorManagement service;
    public OperatorUnlockAction()
    {
    }
    public void addLimit()
    {
    }
    public String doExecute() throws java.lang.Exception
    {
//        OperatorManagement om= new OperatorManagement();
        service.unLock(getID());
//        om.close() ;
        return SUCCESS;
    }
    public int getID()
    {
        return ID;
    }
    public void setID(int ID)
    {
        this.ID = ID;
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
