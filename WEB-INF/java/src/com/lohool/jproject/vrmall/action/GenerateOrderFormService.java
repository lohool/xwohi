/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lohool.jproject.vrmall.action;


import com.lohool.jproject.vrmall.po.OrderForm;
import com.lohool.jproject.vrmall.po.ShoppingCar;

import com.lohool.sms.increment.po.Customer;
import com.xwohi.framework.common.dao.OperationManagement;
import com.xwohi.framework.common.mapping.XWohiActionMapping;
import com.xwohi.framework.common.security.po.Operator;
import com.xwohi.framework.common.service.DefaultService;
import com.xwohi.framework.util.StringUtil;
import java.util.Calendar;
import java.util.List;
import java.util.Map;


/**
 *
 * @author wzvb9m
 */
public class GenerateOrderFormService implements DefaultService
{
private OperationManagement dao;
    public String execute(Object vo, Map parameters, String actionName, Class cls, XWohiActionMapping xwohi, Operator loginUser) throws Exception
    {
//                Customer user=(Customer)this.getUser() ;
//        OperationManagementImpl omi=new OperationManagementImpl(ShoppingCar.class);
        Customer user=(Customer)loginUser;
        List shoppingCars=getDao().find("select obj from ShoppingCar obj where obj.user.id="+user.getId()) ;
        for (int i=0;i<shoppingCars.size();i++)
        {
            ShoppingCar sc=(ShoppingCar)shoppingCars.get(i) ;
            OrderForm of=new OrderForm();
            of.setGoods(sc.getGoods() ) ;
            Calendar cal=Calendar.getInstance() ;
            of.setOrderFormNumber("VR"+cal.get(cal.YEAR )+cal.get(cal.MONTH)+StringUtil.format(sc.getId(),5)) ;
            of.setPrice(sc.getGoods() .getPrice() ) ;
            of.setQuantity(sc.getQuantity() ) ;
            of.setUser(sc.getUser()) ;
            getDao().add(of) ;
            getDao().delete(ShoppingCar.class,sc) ;

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

}
