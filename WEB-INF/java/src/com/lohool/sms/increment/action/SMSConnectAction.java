package com.lohool.sms.increment.action;


import com.lohool.sms.increment.*;
import com.lohool.jsms.*;
import com.xbreeze.framework.xwohi.common.action.AbstractAction;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class SMSConnectAction extends AbstractAction
{
    private SMSDispatcher dispatcher;
    DeviceInfo deviceInfo;
    public SMSConnectAction()
    {
    }
    public String doExecute() throws java.lang.Exception
    {
//        setDispatcher(SMSManager.getSMSDispatcher()) ;
        if(getDispatcher().connect() )
        {
            deviceInfo=getDispatcher().getDeviceInfo() ;
            return SUCCESS;
        }else
        {
            return ERROR;
        }
    }
    public DeviceInfo getDeviceInfo()
    {
        return deviceInfo;
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