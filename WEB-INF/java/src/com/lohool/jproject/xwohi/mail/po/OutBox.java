package com.lohool.jproject.xwohi.mail.po;

import com.lohool.jproject.xwohi.operator.po.*;
import com.xwohi.framework.common.security.po.LoginUser;
import java.sql.Timestamp;

/**
 * @hibernate.class  table="T_OutBox"  dynamic-update="true"  dynamic-insert="true"
 * <p>���ͳ�ȥ���ʼ�</p>
 * <p>������ </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class OutBox implements LoginUser,Mail
{
    private long id;
    /**
     * ������
     */
    private Operator user;
    /**
     * �ռ���
     */
    private Operator receiver;
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
    private boolean hasAttach;
    private int userID;
    public OutBox()
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
     *       name="receiver"
     *       column="receiverID"
     *       cascade="none"
     *       lazy="true"
     *       outer-join="false"
     */

    public Operator getReceiver()
    {
        return receiver;
    }
    public void setReceiver(Operator receiver)
    {
        this.receiver = receiver;
    }
    /**
     * @hibernate.many-to-one
     *       class="com.lohool.jproject.xwohi.operator.po.Operator"
     *       name="user"
     *       column="senderID"
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
    public boolean isHasAttach()
    {
        return attachFile!=null && !attachFile.trim() .equals("") ;
    }
    public void setHasAttach(boolean hasAttach)
    {
        this.hasAttach = hasAttach;
    }
    public int getUserID()
    {
        return userID;
    }
    public void setUserID(int userID)
    {
        this.userID = userID;
    }

}
