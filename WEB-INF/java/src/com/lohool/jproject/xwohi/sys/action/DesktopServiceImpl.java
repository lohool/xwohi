/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lohool.jproject.xwohi.sys.action;


import com.xwohi.framework.common.dao.OperationManagement;
import com.xwohi.framework.common.mapping.XWohiActionMapping;
import com.xwohi.framework.common.security.po.Operator;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 *
 * @author wzvb9m
 */
public class DesktopServiceImpl implements DesktopService 
{

    private List calendarPlanList;
    private List newMailList;
    private OperationManagement dao;

    public String execute(Object vo, Map parameters, String actionName, Class cls, XWohiActionMapping xwohi, Operator loginUser) throws Exception
    {
        String sql = "select obj from CalendarPlan obj where obj.awokeTime >= ? and obj.awokeTime <?";
        ArrayList params = new ArrayList();

        Calendar today = Calendar.getInstance();
        today.set(today.get(Calendar.YEAR), today.get(Calendar.MONTH), today.get(Calendar.DAY_OF_YEAR), 0, 0, 0);
        params.add(today.getTime());
        Date tommorrow = new Date(today.getTimeInMillis() + 24 * 60 * 60 * 1000);

        params.add(tommorrow);
        setCalendarPlanList(getDao().find(sql, params));//query.list() ;
        //����δ�����ʼ�
        String mailSql = "select obj from InBox obj where obj.isRead=0";
        setNewMailList(getDao().find(mailSql));//mailQuery.list() ;
        return "success";

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

    public OperationManagement getDao()
    {
        return dao;
    }

    public void setDao(OperationManagement dao)
    {
        this.dao = dao;
    }
}
