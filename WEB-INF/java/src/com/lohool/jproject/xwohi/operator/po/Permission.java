package com.lohool.jproject.xwohi.operator.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: lohool.com</p>
 * <p>mail:lohool@hotmail.com</p>
 * @author Xing BaoHui
 * @version 1.0
 * @hibernate.class  table="t_Permission"  dynamic-update="true"  dynamic-insert="true"
 */
@Entity
@Table(name = "t_Permission")
public class Permission implements com.xwohi.framework.common.security.po.Permission
{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    //@SequenceGenerator(name = "SEQ_Permission_ID", allocationSize = 1, initialValue = 1, sequenceName = "SEQ_Permission_ID")
    //@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_Permission_ID")
    private int id;
    
    //useless, just a name now
    @Column(name="nameSpace")
    private String name;
    //useless
    private int value;
    //the acion's uri. The action is group limited and will be filtered
    private String uri;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "dataGroupId")
    private com.lohool.jproject.xwohi.operator.po.DataGroup dataGroup;

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
     * @hibernate.property column="nameSpace"
     */
    public String getName()
    {
        return this.name;
    }

    public void setValue(int value)
    {
        this.value = value;
    }

    /**
     * @hibernate.property column="value"
     */
    public int getValue()
    {
        return this.value;
    }

    public void setUri(String uri)
    {
        this.uri = uri;
    }

    /**
     * @hibernate.property column="uri"
     */
    public String getUri()
    {
        return this.uri;
    }

    public void setDataGroup(com.lohool.jproject.xwohi.operator.po.DataGroup dataGroup)
    {
        this.dataGroup = dataGroup;
    }

    /**
     * @hibernate.many-to-one
     *       class="com.xbreeze.framework.xwohi.operator.po.DataGroup"
     *       name="dataGroup"
     *       column="dataGroupId"
     *       cascade="none"
     *       lazy="false"
     *       outer-join="false"
     */
    public com.lohool.jproject.xwohi.operator.po.DataGroup getDataGroup()
    {
        return this.dataGroup;
    }
}
