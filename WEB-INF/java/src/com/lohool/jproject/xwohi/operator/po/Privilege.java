package com.lohool.jproject.xwohi.operator.po;

import java.io.Serializable;
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
 *
 * <p>Title: </p>
 * @hibernate.class  table="T_Privilege"  dynamic-update="true"  dynamic-insert="true"
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: lohool.com</p>
 * <p>mail:lohool@hotmail.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */
@Entity
@Table(name="T_Privilege")
public class Privilege implements  com.xwohi.framework.common.security.po.Privilege, Serializable
{
    @Id 
    @GeneratedValue(strategy = GenerationType.AUTO)
    //@SequenceGenerator(name = "SEQ_Privilege_ID", allocationSize = 1, initialValue = 1, sequenceName = "SEQ_Privilege_ID")
    //@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_Privilege_ID")
    private int privilegeID;
    private String name;
    private String url;
    
    /**
     * @hibernate.many-to-one
     *       class="com.lohool.jproject.xwohi.operator.po.Resource"
     *       name="resource"
     *       column="resourceID"
     *       cascade="none"
     *       outer-join="false"
     *
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "resourceID")
    private Resource resource;
    //取自页面上的属性resource对应的ID
    //private long resourceID;


    public Privilege()
    {

    }
    public Privilege(String url)
    {
        this.url = url;
    }

    public void setPrivilegeID(int privilegeID)
    {
        this.privilegeID = privilegeID;
    }

    /**
     * @hibernate.id  generator-class="native" length="8"
     * @return
     */
    public int getPrivilegeID()
    {
        return this.privilegeID;
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
    public String getSecondName()
    {
        String temp=this.name.replaceAll("([A-Z])", " $1");
        String[] names=temp.split(" ");
        return names[names.length-1];
    }
    public String getFirstName()
    {
        String temp=this.name.replaceAll("([A-Z])", " $1");
        String[] names=temp.split(" ");
        String s=names[0];

            for(int i=1;i<names.length-1;i++)
            {
                String ss=names[i].trim();
                if(!ss.equals(""))s+=ss;
            }

        return s;
    }
    
    /**
     * @hibernate.property length="50"
     * @return
     */
    public String getUrl()
    {
        return url;
    }

    public void setUrl(String url)
    {
        this.url = url;
    }

    /**
     * @hibernate.many-to-one
     *       class="com.lohool.jproject.xwohi.operator.po.Resource"
     *       name="resource"
     *       column="resourceID"
     *       cascade="none"
     *       outer-join="false"
     *
     */

    public Resource getResource()
    {
        return resource;
    }

    public void setResource(Resource resource)
    {
        this.resource = resource;
    }

    public boolean equals(Object obj)
    {
        if(obj==null || !(obj instanceof Privilege))return false;
        Privilege pri=(Privilege)obj;
        if(pri.getUrl() ==null || this.getUrl() ==null)return false;
        return pri.getUrl() .equals(this.getUrl() ) ;

    }
    public int hashCode()
    {
        if(url==null)return 0;
        return url.hashCode() ;
    }
    /*
    public long getResourceID()
    {
        return resourceID;
    }
    public void setResourceID(long resourceID)
    {
        this.resourceID = resourceID;
    }
        */
}
