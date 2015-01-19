package com.lohool.jproject.xwohi.po;

import com.lohool.jproject.xwohi.operator.po.*;
import com.xwohi.framework.common.security.po.LoginUser;
import java.sql.*;
/**
 * @hibernate.class  table="T_CalendarPlan"  dynamic-update="true"  dynamic-insert="true"
 * <p>�ճ̰��� </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright  (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class CalendarPlan  implements LoginUser
{
    private int id;
    /**
     * ����
     */
    private String title;
    /**
     * �����
     */
    private String content;
    /**
     * �ʱ��
     */
    private Date activeTime;
    /**
     * ����ʱ��
     */
    private Date awokeTime;
    /**
     * �ճ̴�����
     */
    private com.lohool.jproject.xwohi.operator.po.Operator user;

    public CalendarPlan()
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
     * @hibernate.property length="50"
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

    public Date getActiveTime()
    {
        return activeTime;
    }
    public void setActiveTime(Date activeTime)
    {
        this.activeTime = activeTime;
    }
    /**
     * @hibernate.property
     * @return
     */

    public Date getAwokeTime()
    {
        return awokeTime;
    }
    public void setAwokeTime(Date awokeTime)
    {
        this.awokeTime = awokeTime;
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


}