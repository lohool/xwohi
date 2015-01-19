package com.lohool.jproject.xwohi.document.action;


import java.util.*;
import java.io.File;

import com.lohool.jproject.xwohi.po.*;
import com.lohool.jproject.xwohi.operator.po.Operator;
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
public class DocumentDeleteAction
    extends AbstractAction
{

    private Document vo;
    private int state;
    private DefaultService service;

    public String doExecute() throws java.lang.Exception
    {
        DocumentDeleteService ds = (DocumentDeleteService) getService();
        ds.setState(state);
        ds.execute(vo, this.getParameterMap(), actionURL, Document.class, null, getUser());
        return SUCCESS;
    }

    public Object keyValue()
    {
        return null;
    }

    public String sql()
    {
        return null;
    }

    public Document getVo()
    {
        return vo;
    }

    public void setVo(Document vo)
    {
        this.vo = vo;
    }

    public int getState()
    {
        return state;
    }

    public void setState(int state)
    {
        this.state = state;
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
