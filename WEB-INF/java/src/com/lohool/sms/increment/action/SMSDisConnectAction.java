package com.lohool.sms.increment.action;


import com.lohool.sms.increment.*;
import com.xbreeze.framework.xwohi.common.action.AbstractAction;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class SMSDisConnectAction extends AbstractAction
{
    private SMSDispatcher dispatcher;
    public SMSDisConnectAction()
    {
    }
    public String doExecute() throws java.lang.Exception
    {
//        setDispatcher(SMSManager.getSMSDispatcher()) ;
        getDispatcher().close();

        return SUCCESS;
    }

    public SMSDispatcher getDispatcher()
    {
        return dispatcher;
    }

    public void setDispatcher(SMSDispatcher dispatcher)
    {
        this.dispatcher = dispatcher;
    }

}
