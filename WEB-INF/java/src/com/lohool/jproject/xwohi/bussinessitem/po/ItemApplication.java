package com.lohool.jproject.xwohi.bussinessitem.po;
import com.lohool.jproject.xwohi.operator.po.Operator;
import com.xwohi.framework.common.security.po.LoginUser;

/**
 * @hibernate.class  table="T_ItemApplication"  dynamic-update="true"  dynamic-insert="true"
 * <p>Title: </p>
 * <p>�����豸����</p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class ItemApplication  implements LoginUser
{
    private int id;
    private BussinessItem item;
    /**
     * ������
     */
    private Operator user;
    /**
     * ����
     */
    private Operator ratifier;
    /**
     * ��������
     */
    private int quantity;
    /**
     * ����ʱ��
     */
    private java.sql.Timestamp createTime;
    /**
     * ���ÿ�ʼʱ��
     */
    private java.sql.Timestamp beginTime;
    /**
     * ���ý���/�黹ʱ��
     */
    private java.sql.Timestamp endTime;
    /**
     * ����ԭ��˵��
     */
    private String description;
    /**
     * ����״̬��0--����,1--ͬ����ã�2--��������,3--�ѷ�
     */
    private int state;
    /**
     * �����
     */
    private String opinion;
    /**
     * ɾ��״̬��0--δɾ��1--������ɾ��2--����ɾ��
     */
    private int delState;

    public ItemApplication()

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
     * @hibernate.many-to-one
     *     class="com.lohool.jproject.xwohi.bussinessitem.po.BussinessItem"
     *     name="item"
     *     column="itemID"
     *     cascade="none"
     *     out-join="false"
     *
     * @return
     */

    public BussinessItem getItem()
    {
        return item;
    }
    public void setItem(BussinessItem item)
    {
        this.item = item;
    }
    /**
     * @hibernate.property length="8"
     * @return
     */

    public int getQuantity()
    {
        return quantity;
    }
    public void setQuantity(int quantity)
    {
        this.quantity = quantity;
    }
    /**
     * @hibernate.many-to-one
     *     class="com.lohool.jproject.xwohi.operator.po.Operator"
     *     name="user"
     *     column="userID"
     *     cascade="none"
     *     out-join="false"
     *
     * @return
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
     *     class="com.lohool.jproject.xwohi.operator.po.Operator"
     *     name="ratifier"
     *     column="ratifierID"
     *     cascade="none"
     *     out-join="false"
     *
     * @return
     */

    public Operator getRatifier()
    {
        return ratifier;
    }
    public void setRatifier(Operator ratifier)
    {
        this.ratifier = ratifier;
    }
    /**
     * @hibernate.property
     * @return
     */

    public java.sql.Timestamp getCreateTime()
    {
        return createTime;
    }
    public void setCreateTime(java.sql.Timestamp createTime)
    {
        this.createTime = createTime;
    }
    /**
     * @hibernate.property
     * @return
     */

    public java.sql.Timestamp getBeginTime()
    {
        return beginTime;
    }

    public void setBeginTime(java.sql.Timestamp beginTime)
    {
        this.beginTime = beginTime;
    }
    /**
     * @hibernate.property
     * @return
     */

    public java.sql.Timestamp getEndTime()
    {
        return endTime;
    }
    public void setEndTime(java.sql.Timestamp endTime)
    {
        this.endTime = endTime;
    }
    /**
     * @hibernate.property length="1000"
     * @return
     */

    public String getDescription()
    {
        return description;
    }
    public void setDescription(String description)
    {
        this.description = description;
    }
    /**
     * @hibernate.property length=2
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
    /**
     * @hibernate.property length="500"
     * @return
     */

    public String getOpinion()
    {
        return opinion;
    }
    public void setOpinion(String opinion)
    {
        this.opinion = opinion;
    }
    /**
     * @hibernate.property length="2"
     * @return
     */
    public int getDelState()
    {
        return delState;
    }
    public void setDelState(int delState)
    {
        this.delState = delState;
    }

}