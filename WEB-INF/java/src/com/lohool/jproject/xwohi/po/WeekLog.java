package com.lohool.jproject.xwohi.po;
import com.lohool.jproject.xwohi.operator.po.*;
import com.xwohi.framework.common.security.po.LoginUser;
import java.sql.*;

/**
 * @hibernate.class  table="T_WeekLog"  dynamic-update="true"  dynamic-insert="true"
 * <p>������־ </p>
 * <p>���ռ�¼ </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class WeekLog implements LoginUser
{
    private int id;
    private Operator taster;
    /**
     * ����
     */
    private Operator user;
    private Date createTime;
    /**
     * ����
     */
    private String title;
    /**
     * �ܱ�����
     */
    private String content;
    /**
     * �ڼ���
     */
    private int weekNumber;
    /**
     * ���ܵ�һ��(����)������
     */
    private Date beginTime;
    /**
     * ���ܵ����һ��(����)������
     */

    private Date endTime;

    public WeekLog()
    {
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
     * @hibernate.many-to-one
     *       class="com.lohool.jproject.xwohi.operator.po.Operator"
     *       name="user"
     *       column="tasterID"
     *       cascade="none"
     *       lazy="true"
     *       outer-join="false"
     */

    public Operator getTaster()
    {
        return taster;
    }
    public void setTaster(Operator taster)
    {
        this.taster = taster;
    }
    /**
     * @hibernate.many-to-one
     *       class="com.lohool.jproject.xwohi.operator.po.Operator"
     *       name="user"
     *       column="userID"
     *       cascade="none"
     *       lazy="true"
     *       outer-join="false"
     */

    public Operator getUser()
    {
        return user;
    }
    public void setUser(Operator user)
    {
        this.user = user;
    }
    public void setUser(com.xwohi.framework.common.security.po.Operator user)
    {
        this.user = (Operator)user;
    }
    /**
     * @hibernate.property length="60"
     * @return
     */

    public String getTitle()
    {
        return title;
    }
    public void setTitle(String title)
    {
        this.title = title;
    }
    /**
     * @hibernate.property length="2"
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

    public Date getEndTime()
    {
        return endTime;
    }
    public void setEndTime(Date endTime)
    {
        this.endTime = endTime;
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

}
