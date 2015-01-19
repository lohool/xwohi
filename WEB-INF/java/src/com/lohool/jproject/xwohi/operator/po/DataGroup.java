package com.lohool.jproject.xwohi.operator.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


/**
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: lohool.com</p>
 * <p>mail:lohool@hotmail.com</p>
 * @author Xing BaoHui
 * @version 1.0
 * @hibernate.class  table="t_DataGroup"  dynamic-update="true"  dynamic-insert="true"
 */
@Entity
@Table(name = "t_DataGroup")
public class DataGroup implements com.xwohi.framework.common.security.po.DataGroup
{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    //@SequenceGenerator(name = "SEQ_DataGroup_ID", allocationSize = 1, initialValue = 1, sequenceName = "SEQ_DataGroup_ID")
    //@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_DataGroup_ID")
    private int id;
    private String name;
    @Column(name = "URI")
    private String URI;
    private String dataObjectKeyName;
    @Column(name="dataObjectKey")
    private String dataObjectName;
    private String groupObjectName;
    private String groupObjectKeyName;
    private String nameSpace;

    public void setId(int id)
    {
        this.id = id;
    }

    /**
     * @hibernate.id  generator-class="native" column="id"
     */
    public int getId()
    {
        return this.id;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    /**
     * @hibernate.property column="name"
     */
    public String getName()
    {
        return this.name;
    }

    public void setURI(String URI)
    {
        this.URI = URI;
    }

    /**
     * @hibernate.property column="URI"
     */
    public String getURI()
    {
        return this.URI;
    }

    public void setDataObjectKeyName(String dataObjectKeyName)
    {
        this.dataObjectKeyName = dataObjectKeyName;
    }

    /**
     * @hibernate.property column="dataObjectKeyName"
     */
    public String getDataObjectKeyName()
    {
        return this.dataObjectKeyName;
    }

    public void setDataObjectName(String dataObjectName)
    {
        this.dataObjectName = dataObjectName;
    }

    /**
     * @hibernate.property column="dataObjectKey"
     */
    public String getDataObjectName()
    {
        return this.dataObjectName;
    }

    public void setGroupObjectName(String groupObjectName)
    {
        this.groupObjectName = groupObjectName;
    }

    /**
     * @hibernate.property column="groupObjectName"
     */
    public String getGroupObjectName()
    {
        return this.groupObjectName;
    }

    public void setGroupObjectKeyName(String groupObjectKeyName)
    {
        this.groupObjectKeyName = groupObjectKeyName;
    }

    /**
     * @hibernate.property column="groupObjectKeyName"
     */
    public String getGroupObjectKeyName()
    {
        return this.groupObjectKeyName;
    }

    public void setNameSpace(String nameSpace)
    {
        this.nameSpace = nameSpace;
    }

    /**
     * @hibernate.property column="nameSpace"
     */
    public String getNameSpace()
    {
        return this.nameSpace;
    }
}
