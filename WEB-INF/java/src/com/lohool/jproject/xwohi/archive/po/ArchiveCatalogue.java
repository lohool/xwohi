package com.lohool.jproject.xwohi.archive.po;

import javax.persistence.*;


/**
 * @hibernate.class  table="T_ArchiveCatalogue"  dynamic-update="true"  dynamic-insert="true"
 * <p>Title: </p>
 * <p>按中图法分类</p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */
@Entity
@Table(name = "T_ArchiveCatalogue")
public class ArchiveCatalogue
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    /**
     * 目录名
     */
    private String name;
    /**
     * 父目录
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parentID")
    private ArchiveCatalogue parent;
    /**
     * 子目录
     */
     @OneToMany(mappedBy="parent",fetch = FetchType.LAZY)
    private java.util.Set<ArchiveCatalogue> children;

    private String description;
    /**
     * 年度
     */
    private int year;
    /**
     * 总页数
     */
    private int pageCount;
    /**
     * 期限
     */
    private int timeLimit;
    /**
     * 存放列/柜
     */
    private String depositary;
    /**
     * 案卷编号
     */
    private String serialNumber;
    private java.sql.Timestamp createTime;

    public ArchiveCatalogue()
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
    * @hibernate.set name="children" cascade="delete"
    * @hibernate.collection-key column="parentID"
    * @hibernate.collection-one-to-many
    *       class="com.lohool.jproject.xwohi.archive.po.ArchiveCatalogue"
    *       outer-join="false"
    *       lazy="false"
    *
    * @return java.util.collection
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
     *       class="com.lohool.jproject.xwohi.archive.po.ArchiveCatalogue"
     *       name="parent"
     *       column="parentID"
     *       cascade="none"
     *       outer-join="false"
     *
     * @return java.util.collection
     */
    public ArchiveCatalogue getParent()
    {
        return parent;
    }
    public void setParent(ArchiveCatalogue parent)
    {
        this.parent = parent;
    }
    /**
     * @hibernate.property length=50
     * @return
     */

    public String getDepositary()
    {
        return depositary;
    }
    public void setDepositary(String depositary)
    {
        this.depositary = depositary;
    }
    /**
     * @hibernate.property length=5
     * @return
     */

    public int getPageCount()
    {
        return pageCount;
    }
    public void setPageCount(int pageCount)
    {
        this.pageCount = pageCount;
    }
    /**
     * @hibernate.property length=100
     * @return
     */

    public String getSerialNumber()
    {
        return serialNumber;
    }
    public void setSerialNumber(String serialNumber)
    {
        this.serialNumber = serialNumber;
    }
    /**
     * @hibernate.property length=2
     * @return
     */

    public int getTimeLimit()
    {
        return timeLimit;
    }
    public void setTimeLimit(int timeLimit)
    {
        this.timeLimit = timeLimit;
    }
    /**
     * @hibernate.property length=4
     * @return
     */

    public int getYear()
    {
        return year;
    }
    public void setYear(int year)
    {
        this.year = year;
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



}