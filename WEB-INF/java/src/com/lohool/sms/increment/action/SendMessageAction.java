package com.lohool.sms.increment.action;

import com.lohool.sms.increment.*;

import com.lohool.sms.increment.po.*;
import com.xbreeze.framework.xwohi.common.action.AbstractAction;
import com.xwohi.framework.common.dao.OperationManagementImpl;
import com.xwohi.framework.util.Toolkit;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class SendMessageAction extends AbstractAction
{
    SentSMS vo;
    public SendMessageAction()
    {
    }
    private SMSDispatcher dispatcher;

    public String doExecute() throws java.lang.Exception
    {
//        setDispatcher(SMSManager.getSMSDispatcher()) ;
        if(getDispatcher().isConnected() && getDispatcher().send(vo.getRecipient() ,Toolkit.toGBK(vo.getContent()) ))
        {
            OperationManagementImpl omi = new OperationManagementImpl(SentSMS.class);

            vo.setOperator((com.lohool.jproject.xwohi.operator.po.Operator)getUser() ) ;
            omi.add(vo) ;
            omi.close() ;
            return SUCCESS;
        }else
        {
            return ERROR;
        }
    }
    public SentSMS getVo()
    {
        return vo;
    }
    public void setVo(SentSMS vo)
    {
        this.vo = vo;
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