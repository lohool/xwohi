package com.lohool.jproject.xwohi.mail.po;

import com.lohool.jproject.xwohi.operator.po.*;
import com.xwohi.framework.common.security.po.LoginUser;
import java.sql.Timestamp;

/**
 * @hibernate.class  table="T_TrashBox"  dynamic-update="true"  dynamic-insert="true"
 * <p>�����ʼ�</p>
 * <p>������ </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class TrashBox implements LoginUser,Mail
{
    private long id;
    /**
     * ������
     */
    private Operator sender;
    /**
     * �ռ���
     */
    private Operator user;
    /**
     * �ʼ�����
     */
    private String title ;
    /**
     * �ʼ�����
     */
    private String content;
    /**
     * ����ʱ��
     */
    private Timestamp createTime;
    /**
     * �ʼ�����
     */
    private String attachFile;
    private int isRead;
    public TrashBox()
    {
    }
    /**
     * @hibernate.id  generator-class="native" length="8"
     * @return
     */

    public long getId()
    {
        return id;
    }
    public void setId(long id)
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

    public Timestamp getCreateTime()
    {
        return createTime;
    }
    public void setCreateTime(Timestamp createTime)
    {
        this.createTime = createTime;
    }
    /**
     * @hibernate.many-to-one
     *       class="com.lohool.jproject.xwohi.operator.po.Operator"
     *       name="user"
     *       column="receiverID"
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
     * @hibernate.many-to-one
     *       class="com.lohool.jproject.xwohi.operator.po.Operator"
     *       name="sender"
     *       column="senderID"
     *       cascade="none"
     *       lazy="true"
     *       outer-join="false"
     */

    public Operator getSender()
    {
        return sender;
    }
    public void setSender(Operator sender)
    {
        this.sender = sender;
    }
    public void setAttachFile(String attachFile)
    {
        this.attachFile = attachFile;
    }
    /**
     * @hibernate.property length="50"
     * @return
     */

    public String getAttachFile()
    {
        return attachFile;
    }
    /**
     * @hibernate.property length="3"
     * @return
     */

    public int getIsRead()
    {
        return isRead;
    }
    public void setIsRead(int isRead)
    {
        this.isRead = isRead;
    }

}
