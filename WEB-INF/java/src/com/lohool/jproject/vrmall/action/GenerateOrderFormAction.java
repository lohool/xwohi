package com.lohool.jproject.vrmall.action;


import com.xbreeze.framework.xwohi.common.action.*;
import com.xwohi.framework.common.service.DefaultService;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class GenerateOrderFormAction extends AbstractAction
{
    private DefaultService service;
    public String doExecute() throws java.lang.Exception
    {
       // getService().execute(null, this.getParameterMap(), actionURL, null, null, this.getUser());

        return SUCCESS;
    }

    public DefaultService getService()
    {
        return service;
    }

    public void setService(DefaultService service)
    {
        this.service = service;
    }

}