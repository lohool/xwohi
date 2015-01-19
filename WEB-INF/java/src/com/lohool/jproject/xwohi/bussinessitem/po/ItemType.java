package com.lohool.jproject.xwohi.bussinessitem .po;

/**
 * @hibernate.class  table="T_ItemType"  dynamic-update="true"  dynamic-insert="true"
 * <p>办公用户的种类</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class ItemType
{
    private int id;
    private String name;
    public ItemType()
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

}