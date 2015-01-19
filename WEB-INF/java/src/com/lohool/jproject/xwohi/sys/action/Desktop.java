package com.lohool.jproject.xwohi.sys.action;


import com.xbreeze.framework.xwohi.common.action.AbstractAction;
import java.util.*;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class Desktop extends AbstractAction
{
    List calendarPlanList;
    List newMailList;
    private DesktopService service;
    public Desktop()
    {
    }
    public String doExecute() throws Exception
    {
        service.execute(null, null, actionURL, null, null, this.getUser());
        calendarPlanList= service.getCalendarPlanList();
        newMailList=service.getNewMailList();
        return SUCCESS;
    }
    public List getCalendarPlanList()
    {
        return calendarPlanList;
    }
    public void setCalendarPlanList(List calendarPlanList)
    {
        this.calendarPlanList = calendarPlanList;
    }
    public List getNewMailList()
    {
        return newMailList;
    }
    public void setNewMailList(List newMailList)
    {
        this.newMailList = newMailList;
    }

    public DesktopService getService()
    {
        return service;
    }

    public void setService(DesktopService service)
    {
        this.service = service;
    }



}