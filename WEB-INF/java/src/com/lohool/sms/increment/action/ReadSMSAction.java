package com.lohool.sms.increment.action;

import com.lohool.sms.increment.*;

import com.lohool.sms.increment.po.*;
import com.xbreeze.framework.xwohi.common.action.AbstractAction;
import java.util.*;

/**
 * <p>Title: </p>
 * <p>���ֻ��еĶ���Ϣ</p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class ReadSMSAction
    extends AbstractAction
{
    public ReadSMSAction()
    {
    }

    private SMSDispatcher dispatcher;
    List objectList;
    public String doExecute() throws java.lang.Exception
    {
//        setDispatcher(SMSManager.getSMSDispatcher());
        if (getDispatcher().isConnected())
        {
            objectList = getDispatcher().read();
            return SUCCESS;
        }
        else
        {
            return ERROR;
        }
    }

    public List getObjectList()
    {
        return objectList;
    }

    public

    SMSDispatcher getDispatcher()
    {
        return dispatcher;
    }

    public void setDispatcher(SMSDispatcher dispatcher)
    {
        this.dispatcher = dispatcher;
    }

}