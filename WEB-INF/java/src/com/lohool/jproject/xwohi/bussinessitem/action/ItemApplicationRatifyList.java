package com.lohool.jproject.xwohi.bussinessitem.action;

import java.util.*;


import com.lohool.jproject.xwohi.bussinessitem.po.*;
import com.lohool.jproject.xwohi.operator.po.Operator;
import com.xbreeze.framework.xwohi.common.action.BasicListAction;



/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class ItemApplicationRatifyList
    extends BasicListAction
{
//    private Collection objList;
//    BasicListService service;

    @Override
    public String doExecute() throws java.lang.Exception
    {
        
//        OperationManagementImpl omi = new OperationManagementImpl(
//            ItemApplication.class);
        Operator user = (Operator)this.getUser();
//        String countSql =
//            "select count(obj) from ItemApplication obj where obj.delState!=2 and obj.ratifier=" +
//            user.getId() + " order by obj.state,obj.createTime desc";
//        String listSql = "select obj from ItemApplication obj where obj.delState!=2 and obj.ratifier=" +
//            user.getId() + " order by obj.state,obj.createTime desc";
//
//        this.setResultSize(omi.count(countSql));
//        objList = omi.findByPage(this.getPage(), this.getPageSize(), listSql);
//
//        omi.close();
        Map parameters= this.getParameterMap();
        parameters.put("ratifier", Integer.toString(user.getId()));
        this.getService().execute(getVo(), parameters, actionURL, ItemApplication.class, xwohi, user);
         this.setResultSize(getService().getResultSize());

          this.setObjList(getService().getObjList());
        return SUCCESS;
    }

}