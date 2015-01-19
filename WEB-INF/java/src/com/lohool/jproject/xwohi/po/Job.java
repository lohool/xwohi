package com.lohool.jproject.xwohi.po;


import com.lohool.jproject.xwohi.operator.po.Operator;
import java.util.*;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
/**
 * @hibernate.class  table="T_Job"  dynamic-update="true"  dynamic-insert="true"
 * <p>ְ�� </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: lohool.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */
@Entity
@Table(name = "T_Job")
public class Job
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    /**
     * ְ����
     */
    @Column
    private String name;
    /**
     * 
     */
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parentID")
    private Job parent;
    /**
     * �¼�
     */
    @OneToMany(mappedBy="parent",fetch = FetchType.LAZY)
    private java.util.Set<Job> children;
    @Column
    private String description;
     @OneToMany(mappedBy="job",fetch = FetchType.LAZY)
    private Set<Operator> employees;
    public Job()
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
     *       class="com.lohool.jproject.xwohi.po.Job"
     *       name="parent"
     *       column="parentID"
     *       cascade="none"
     *       outer-join="false"
     *
     * @return java.util.collection
     */

    public Job getParent()
    {
        return parent;
    }
    public void setParent(Job parent)
    {
        this.parent = parent;
    }
    /**
     * @hibernate.set name="children" cascade="all"
     * @hibernate.collection-key column="parentID"
     * @hibernate.collection-one-to-many
     *       class="com.lohool.jproject.xwohi.po.Job"
     *       outer-join="false"
     *       lazy="false"
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

    /*
     * @hibernate.set name="employees" cascade="none"
     * @hibernate.collection-key column="id"
     * @hibernate.collection-one-to-many
     *       class="com.lohool.jproject.xwohi.operator.po.Operator"
     *       outer-join="false"
     * @return java.util.collection
     */
    /**
     *
     * @return
     */
    public Set getEmployees()
    {
        return employees;
    }
    public void setEmployees(Set employees)
    {
        this.employees = employees;
    }

}