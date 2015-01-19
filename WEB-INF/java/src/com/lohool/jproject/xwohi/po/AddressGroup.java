package com.lohool.jproject.xwohi.po;

import com.lohool.jproject.xwohi.operator.po.*;
import com.xwohi.framework.common.security.po.LoginUser;
import java.util.Date;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
/**
 * @hibernate.class  table="T_AddressGroup"  dynamic-update="true"  dynamic-insert="true"

 * <p>ͨѶ¼�� </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */


public class AddressGroup
    implements LoginUser
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    /**
     * Ŀ¼��
     */
    private String name;
    private Operator user;

    private Date createTime;
    private java.util.Collection addresss;

    public AddressGroup()
    {
    }

    /**
     * @hibernate.id  generator-class="native"
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
     * @hibernate.property length="30"
     * @return String
     */

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
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
 * @hibernate.set name="addresss" cascade="delete" inverse="true" lazy="true"
 * @hibernate.collection-key column="groupid"
 * @hibernate.collection-one-to-many
 *       class="com.lohool.jproject.xwohi.po.AddressList"
 *       outer-join="false"
 * @return java.util.Set
 */

    public java.util.Collection getAddresss()
    {
        return addresss;
    }
    public void setAddresss(java.util.Collection addresss)
    {
        this.addresss = addresss;
    }

}
