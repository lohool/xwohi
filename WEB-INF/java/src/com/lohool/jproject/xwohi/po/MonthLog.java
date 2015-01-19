package com.lohool.jproject.xwohi.po;
import com.lohool.jproject.xwohi.operator.po.*;
import com.xwohi.framework.common.security.po.LoginUser;
import java.util.*;
import java.sql.*;

/**
 * @hibernate.class  table="T_MonthLog"  dynamic-update="true"  dynamic-insert="true"
 * <p>������־ </p>
 * <p>���ռ�¼ </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class MonthLog implements LoginUser
{
    private int id;
    private Operator taster;
    /**
     * ����
     */
    private Operator user;
    private Timestamp createTime;
    /**
     * ����
     */
    private String title;
    /**
     * �±�����
     */
    private String content;
    /**
     * ����
     */
    private int month;


    public MonthLog()
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

    public Timestamp getCreateTime()
    {
        return createTime;
    }
    public void setCreateTime(Timestamp createTime)
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

    public int getMonth()
    {
        return month;
    }
    public void setMonth(int month)
    {
        this.month = month;
    }

}
