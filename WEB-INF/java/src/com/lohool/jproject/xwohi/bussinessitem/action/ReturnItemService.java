/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lohool.jproject.xwohi.bussinessitem.action;

import com.lohool.jproject.xwohi.bussinessitem.po.BussinessItem;
import com.lohool.jproject.xwohi.bussinessitem.po.LoanItem;
import com.xwohi.framework.common.dao.OperationManagement;
import com.xwohi.framework.common.mapping.XWohiActionMapping;
import com.xwohi.framework.common.security.po.Operator;
import com.xwohi.framework.common.service.DefaultService;

import java.util.Map;

/**
 *
 * @author wzvb9m
 */
public class ReturnItemService implements DefaultService
{
private OperationManagement dao;
    public String execute(Object vo, Map parameters, String actionName, Class cls, XWohiActionMapping xwohi, Operator loginUser) throws Exception
    {
//                OperationManagementImpl omi2 = new OperationManagementImpl(LoanItem.class);
        LoanItem lt=(LoanItem)vo;
        LoanItem loanItem=(LoanItem)getDao().load(LoanItem.class,lt.getId() ) ;

        //reduce the count the returned
//        OperationManagementImpl omi = new OperationManagementImpl(BussinessItem.class);
//        omi.setSession(omi2.getSession() ) ;
        BussinessItem item=(BussinessItem)getDao().load(BussinessItem.class,loanItem.getItem() .getId() ) ;
        item.setLoanCount(item.getLoanCount() -loanItem.getCount() ) ;
        getDao().modify(BussinessItem.class,item) ;

        getDao().delete(LoanItem.class,loanItem) ;
//        omi2.close() ;
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

}
