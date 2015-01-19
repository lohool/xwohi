package com.lohool.jproject.xwohi.bussinessitem.action;



import java.util.*;
import java.io.File;

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

public class ItemApplicationDelete
    extends AbstractAction
{
    private ItemApplication vo;
    private int state;
    private DefaultService service;

    public String doExecute() throws java.lang.Exception
    {
        ItemApplicationDeleteService s =(ItemApplicationDeleteService)service;
        s.setState(state);
        s.execute(vo, this.getParameterMap(), actionURL, vo.getClass(), null, this.getUser());
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
    public ItemApplication getVo()
    {
        return vo;
    }
    public void setVo(ItemApplication vo)
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
