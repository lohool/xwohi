package com.lohool.jproject.xwohi.mail.action;


import java.io.File;
import java.util.*;

import org.apache.struts2.*;
import org.apache.struts2.dispatcher.multipart.*;

import com.lohool.jproject.xwohi.operator.po.Operator;
import com.lohool.jproject.xwohi.mail.po.*;
import com.xbreeze.framework.xwohi.common.action.AbstractAction;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class SentMailAction
    extends AbstractAction
{
    InBox vo=new InBox();
    int receiverID;
    private SentMailService service;

    public String doExecute() throws java.lang.Exception
    {

        MultiPartRequestWrapper multiWrapper =
            (MultiPartRequestWrapper) ServletActionContext.getRequest();
        if (multiWrapper.hasErrors())
        {
            Collection errors = multiWrapper.getErrors();
            Iterator i = errors.iterator();
            while (i.hasNext())
            {
                addActionError( (String) i.next());
            }
            return ERROR;
        }
        File[] files=multiWrapper.getFiles("vo.attachFile");
        File file=null;
        if(files.length>0)
        {
            file=files[0];
        }
        getService().execute(file, vo, (Operator)getUser(), receiverID);
        

        return SUCCESS;
    }
    public InBox getVo()
    {
        return vo;
    }
    public void setVo(InBox vo)
    {
        this.vo = vo;
    }
    public int getReceiverID()
    {
        return receiverID;
    }
    public void setReceiverID(int receiverID)
    {
        this.receiverID = receiverID;
    }

    public SentMailService getService()
    {
        return service;
    }

    public void setService(SentMailService service)
    {
        this.service = service;
    }

}
