/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lohool.jproject.xwohi.bussinessitem.action;

import com.lohool.jproject.xwohi.bussinessitem.po.ItemApplication;
import com.xwohi.framework.common.dao.OperationManagement;
import com.xwohi.framework.common.mapping.XWohiActionMapping;
import com.xwohi.framework.common.security.po.Operator;
import com.xwohi.framework.common.service.DefaultService;
import java.util.Map;

/**
 *
 * @author wzvb9m
 */
public class ItemApplicationDeleteService implements DefaultService
{
private OperationManagement dao;
private int state;
    public String execute(Object vo, Map parameters, String actionName, Class cls, XWohiActionMapping xwohi, Operator loginUser) throws Exception
    {
//                OperationManagementImpl omi = new OperationManagementImpl(ItemApplication.class);
        ItemApplication obj=(ItemApplication)dao.load(ItemApplication.class,((ItemApplication)vo).getId() ) ;
        if(obj.getDelState() ==0)
        {
            obj.setDelState(getState());
            dao.modify(ItemApplication.class,obj) ;
        }
        else
        {
            dao.delete(ItemApplication.class,obj) ;
        }
        return "success";

    }

    public OperationManagement getDao()
    {
        return dao;
    }

    public void setDao(OperationManagement dao)
    {
        this.dao = dao;
    }

    public int getState()
    {
        return state;
    }

    public void setState(int state)
    {
        this.state = state;
    }

}
