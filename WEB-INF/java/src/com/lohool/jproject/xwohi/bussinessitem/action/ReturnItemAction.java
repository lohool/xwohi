package com.lohool.jproject.xwohi.bussinessitem.action;



import com.lohool.jproject.xwohi.bussinessitem.po.*;
import com.xbreeze.framework.xwohi.common.action.AbstractAction;
import com.xwohi.framework.common.service.DefaultService;



/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class ReturnItemAction extends AbstractAction
{
    private LoanItem vo = new LoanItem();
    private DefaultService service;

    public String doExecute() throws java.lang.Exception
    {

        getService().execute(vo, this.getParameterMap(), actionURL, LoanItem.class, null, this.getUser());
        return SUCCESS;
    }
    public LoanItem getVo()
    {
        return vo;
    }
    public void setVo(LoanItem vo)
    {
        this.vo = vo;
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
