package com.lohool.jproject.xwohi.po;


/**
 * @hibernate.class  table="T_BBSCatalogue"  dynamic-update="true"  dynamic-insert="true"
 * <p>Title: </p>
 * <p></p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class BBSCatalogue
{
    private int id;
    /**
     * 目录名
     */
    private String name;
    /**
     * 父目录
     */
    private BBSCatalogue parent;
    /**
     * 子目录
     */
    private java.util.Set children;

    private String description;

    public BBSCatalogue()
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
    * @hibernate.set name="children" cascade="delete"
    * @hibernate.collection-key column="parentID"
    * @hibernate.collection-one-to-many
    *       class="com.lohool.jproject.xwohi.po.BBSCatalogue"
    *       outer-join="false"
    *       lazy="false"
    *
    * @return java.util.collection
    */
   /**
    *
    * @return
    */
    public java.util.Set getChildren()
    {
        return children;
    }
    public void setChildren(java.util.Set children)
    {
        this.children = children;
    }
    /**
     * @hibernate.property length="255"
     * @return String
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
     * @hibernate.many-to-one
     *       class="com.lohool.jproject.xwohi.po.BBSCatalogue"
     *       name="parent"
     *       column="parentID"
     *       cascade="none"
     *       outer-join="false"
     *
     * @return java.util.collection
     */
    /**
     *
     * @return
     */
    public BBSCatalogue getParent()
    {
        return parent;
    }
    public void setParent(BBSCatalogue parent)
    {
        this.parent = parent;
    }

}
