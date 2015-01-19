package com.lohool.jproject.xwohi.po;

import com.lohool.jproject.xwohi.operator.po.*;
import com.xwohi.framework.common.security.po.LoginUser;
import java.util.*;
import java.sql.Date;

/**
 * @hibernate.class  table="T_WeekScheme"  dynamic-update="true"  dynamic-insert="true"
 * <p>�ܹ����ƻ�</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class WeekScheme implements LoginUser
{
    private int id;
    private Date createTime;
    private int weekNumber;
    private Date beginTime;
    private Date endTime;
    private com.lohool.jproject.xwohi.operator.po.Operator taster;
    private int tasterID;
    private com.lohool.jproject.xwohi.operator.po.Operator user;
    private int executorID;
    private String content;
    private String result;
    private int state;
    private Set daySchemes;
    public WeekScheme()
    {
    }
    /**
     * @hibernate.id  generator-class="native" length="8"
     * @return
     */

    public int getId()
    {
        return id;
    }
    public void setId(int id)
    {
        this.id = id;
    }
    /**
     * @hibernate.property
     * @return
     */

    public Date getCreateTime()
    {
        return createTime;
    }
    public void setCreateTime(Date createTime)
    {
        this.createTime = createTime;
    }
    /**
     * @hibernate.property length="3"
     * @return
     */

    public int getWeekNumber()
    {
        return weekNumber;
    }
    public void setWeekNumber(int weekNumber)
    {
        this.weekNumber = weekNumber;
    }
    /**
     * @hibernate.property
     * @return
     */

    public Date getBeginTime()
    {
        return beginTime;
    }
    public void setBeginTime(Date beginTime)
    {
        this.beginTime = beginTime;
    }
    /**
     * @hibernate.property
     * @return
     */

    public Date getEndTime()
    {
        return endTime;
    }
    public void setEndTime(Date endTime)
    {
        this.endTime = endTime;
    }
    /**
     * @hibernate.many-to-one
     *       class="com.lohool.jproject.xwohi.operator.po.Operator"
     *       name="taster"
     *       column="tasterID"
     *       cascade="none"
     *       lazy="true"
     *       outer-join="false"
     */

    public com.lohool.jproject.xwohi.operator.po.Operator getTaster()
    {
        return taster;
    }
    public void setTaster(com.lohool.jproject.xwohi.operator.po.Operator taster)
    {
        this.taster = taster;
    }
    /**
     * @hibernate.many-to-one
     *       class="com.lohool.jproject.xwohi.operator.po.Operator"
     *       name="user"
     *       column="executorID"
     *       cascade="none"
     *       lazy="true"
     *       outer-join="false"
     */

    public com.lohool.jproject.xwohi.operator.po.Operator getUser()
    {
        return user;
    }
    public void setUser(com.lohool.jproject.xwohi.operator.po.Operator user)
    {
        this.user = user;
    }
    public void setUser(com.xwohi.framework.common.security.po.Operator user)
    {
        this.user = (Operator)user;
    }
    /**
     * @hibernate.property length="255"
     * @return
     */

    public String getContent()
    {
        return content;
    }
    public void setContent(String content)
    {
        this.content = content;
    }
    /**
     * @hibernate.property length="50"
     * @return
     */

    public String getResult()
    {
        return result;
    }
    public void setResult(String result)
    {
        this.result = result;
    }
    /**
     * @hibernate.property length="2"
     * @return
     */

    public int getState()
    {
        return state;
    }
    public void setState(int state)
    {
        this.state = state;
    }
    public int getExecutorID()
    {
        return executorID;
    }
    public void setExecutorID(int executorID)
    {
        this.executorID = executorID;
    }
    public int getTasterID()
    {
        return tasterID;
    }
    public void setTasterID(int tasterID)
    {
        this.tasterID = tasterID;
    }
    public String toString()
    {
        return "Week ID("+id+")";
    }

    /**
 * @hibernate.set name="daySchemes" cascade="all"
 * @hibernate.collection-key column="weekSchemeID"
 * @hibernate.collection-one-to-many
 *       class="com.lohool.jproject.xwohi.po.DayScheme"
 *       outer-join="false"
 * @return java.util.collection
 */

    public Set getDaySchemes()
    {
        return daySchemes;
    }
    public void setDaySchemes(Set daySchemes)
    {
        this.daySchemes =daySchemes;
    }

}