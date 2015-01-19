package com.lohool.jproject.xwohi.operator.po;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;


/**
 *
 * <p>Title: </p>
 * @hibernate.class  table="T_Resource"  dynamic-update="true"  dynamic-insert="true"
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: lohool.com</p>
 * <p>mail:lohool@hotmail.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */
@Entity
@Table(name="T_Resource")
public class Resource implements com.xwohi.framework.common.security.po.Resource, Serializable
{
    @Id 
    @GeneratedValue(strategy = GenerationType.AUTO)
    //@SequenceGenerator(name = "SEQ_Resource_ID", allocationSize = 1, initialValue = 1, sequenceName = "SEQ_Resource_ID")
    //@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_Resource_ID")
    private long resourceID;
    /**
     * resource name
     */
    @Column(length=30)
    private String name;
    private String description;
    @Column(length=4)
    private short type;
    @Column(length=4)
    private short state;
    @Column(length=30)
    private String userType;

    @Transient
    private java.util.Set roles;
        /**
     * @hibernate.set name="privileges" cascade="none"
     * @hibernate.collection-key column="resourceID"
     * @hibernate.collection-one-to-many
     *       class="com.lohool.jproject.xwohi.operator.po.Privilege"
     *       outer-join="false"
     * @return java.util.Set
     */
    @OneToMany(mappedBy="resource",fetch = FetchType.EAGER) 

    private java.util.Set<Privilege> privileges;

    public void setResourceID(long resourceID)
    {
        this.resourceID = resourceID;
    }

    /**
     * @hibernate.id  generator-class="native" length="8"
     * @return
     */
    public long getResourceID()

    {
        return this.resourceID;
    }

    public void setName(String name)

    {
        this.name = name;
    }

    /**
     * @hibernate.property length="30"
     * @return
     */
    public String getName()

    {
        return this.name;
    }

    public void setDescription(String description)

    {
        this.description = description;
    }

    /**
     * @hibernate.property length="100"
     * @param describe
     */
    public String getDescription()

    {
        return this.description;
    }

    public void setType(short type)

    {
        this.type = type;
    }

    /**
     * @hibernate.property length="4"
     * @return
     */
    public short getType()

    {
        return this.type;
    }

    public void setState(short state)

    {
        this.state = state;
    }

    /**
     * @hibernate.property length="4"
     * @return
     */
    public short getState()

    {
        return this.state;
    }

    /**
     * @hibernate.set name="roles" table="T_RoleRes" cascade="save-update" inverse="true"
     * @hibernate.collection-key column="resourceID"
     * @hibernate.collection-many-to-many
     *       class="com.lohool.jproject.xwohi.operator.po.Role"
     *       column="roleID"
     *       outer-join="false"
     *       inverse="true"
     *       lazy="true"
     * @return java.util.Set
     */
/*
    public java.util.Set getRoles()
    {
        return roles;
    }

    public void setRoles(java.util.Set roles)
    {
        this.roles = roles;
    }
*/
    /**
     * @hibernate.set name="privileges" cascade="none"
     * @hibernate.collection-key column="resourceID"
     * @hibernate.collection-one-to-many
     *       class="com.lohool.jproject.xwohi.operator.po.Privilege"
     *       outer-join="false"
     * @return java.util.Set
     */

    public java.util.Set getPrivileges()
    {
        return privileges;
    }

    public void setPrivileges(java.util.Set privileges)
    {
        this.privileges = privileges;
    }
    /**
     * Does this resource has a privilege pointed to the url
     * @param url privilege's url
     * @return
     */
    public boolean hasPrivilege(String url)
    {
        if(privileges==null)return false;
        for(int i=0;i<privileges.size() ;i++)
        {
            if(privileges.contains(new Privilege(url)) )
                return true;
        }
        return false;
    }
    public boolean equals(Object obj)
    {
        if(obj==null || !(obj instanceof Resource))return false;
        return ((Resource)obj).getResourceID() == this.getResourceID() ;
    }
    public int hashCode()
    {
        return (int)getResourceID();
    }
    public String toString()
    {
        return "Resource :name:"+this.getName() +";ID:"+this.getResourceID();
    }
    /**
     * @hibernate.property length="100"
     * @param describe
     */
    public String getUserType()
    {
        return userType;
    }
    public void setUserType(String userType)
    {
        this.userType = userType;
    }
    
        public String getSecondName()
    {
        String[] names=name.split("_");
        if(names.length>=2)return names[1];
        else return "";
    }
    public String getFirstName()
    {
        String[] names=name.split("_");

        return names[0];
    }
}
