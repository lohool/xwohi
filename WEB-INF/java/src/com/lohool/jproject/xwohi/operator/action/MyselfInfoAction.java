package com.lohool.jproject.xwohi.operator.action;

import com.lohool.jproject.xwohi.operator.po.Operator;
import com.xbreeze.framework.xwohi.common.action.BasicInfoAction;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: lohool.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class MyselfInfoAction extends BasicInfoAction
{
    public MyselfInfoAction()
    {
    }
        public void preAction()
    {
        this.setVo((Operator)this.getUser());
    }

    public Object keyValue()
    {
        Operator user=(Operator)this.getUser() ;
        return new Integer(user.getId()) ;
    }


}