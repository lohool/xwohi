package com.lohool.jproject.xwohi.po;

import com.lohool.jproject.xwohi.operator.po.*;
import com.xwohi.framework.common.security.po.LoginUser;

/**
 * @hibernate.class  table="T_AddressList"  dynamic-update="true"  dynamic-insert="true"
 * <p>ͨѶ¼ </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class AddressList implements LoginUser
{

    private int id;
    /**
     * ����
     */
    private String name;
    /**
     * �绰
     */
    private String phone;
    /**
     * �ֻ�
     */
    private String mobile;
    /**
     * �����ʼ���ַ
     */
    private String email;
    /**
     * ��¼��
     */
    private Operator user;
    /**
     * ͨ�ŵ�ַ
     */
    private String address;
    private String zip;
    private String fax;
    private String description;
    private AddressGroup group;


    public AddressList()
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
     * @hibernate.property length="30"
     * @return
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
     * @hibernate.property length="20"
     * @return
     */

    public String getPhone()
    {
        return phone;
    }
    public void setPhone(String phone)
    {
        this.phone = phone;
    }
    /**
     * @hibernate.property length="20"
     * @return
     */

    public String getMobile()
    {
        return mobile;
    }
    public void setMobile(String mobile)
    {
        this.mobile = mobile;
    }
    /**
     * @hibernate.property length="50"
     * @return
     */

    public String getEmail()
    {
        return email;
    }
    public void setEmail(String email)
    {
        this.email = email;
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
     * @hibernate.property length="50"
     * @return
     */

    public String getAddress()
    {
        return address;
    }
    public void setAddress(String address)
    {
        this.address = address;
    }
    /**
     * @hibernate.property length="10"
     * @return
     */

    public String getZip()
    {
        return zip;
    }
    public void setZip(String zip)
    {
        this.zip = zip;
    }
    /**
     * @hibernate.property length="20"
     * @return
     */

    public String getFax()
    {
        return fax;
    }
    public void setFax(String fax)
    {
        this.fax = fax;
    }
    /**
     * @hibernate.property length="200"
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
     * @hibernate.many-to-one
     *       class="com.lohool.jproject.xwohi.po.AddressGroup"
     *       name="group"
     *       column="groupID"
     *       cascade="none"
     *       outer-join="false"
     *
     * @return java.util.collection
     */

    public AddressGroup getGroup()
    {
        return group;
    }
    public void setGroup(AddressGroup group)
    {
        this.group = group;
    }

}
