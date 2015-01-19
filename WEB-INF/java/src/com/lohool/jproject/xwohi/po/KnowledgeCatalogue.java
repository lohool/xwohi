package com.lohool.jproject.xwohi.po;
import java.sql.Timestamp;
import com.lohool.jproject.xwohi.operator.po.*;
import com.xwohi.framework.common.security.po.LoginUser;
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
 * @hibernate.class  table="T_KnowledgeCatalogue"  dynamic-update="true"  dynamic-insert="true"
 * <p>Title: </p>
 * <p>����ͼ������</p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */
@Entity
@Table(name = "T_KnowledgeCatalogue")
public class KnowledgeCatalogue implements LoginUser
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    /**
     * Ŀ¼��
     */
    private String name;
    /**
     * ��Ŀ¼
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parentID")
    private KnowledgeCatalogue parent;
    /**
     * ��Ŀ¼
     */
     @OneToMany(mappedBy="parent",fetch = FetchType.LAZY)
    private java.util.Collection<KnowledgeCatalogue> children;

    private String description;
    private Timestamp createTime;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "userID")
    private com.lohool.jproject.xwohi.operator.po.Operator user;

    public KnowledgeCatalogue()
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
    *       class="com.lohool.jproject.xwohi.po.KnowledgeCatalogue"
    *       outer-join="false"
    *       lazy="false"
    *
    * @return java.util.collection
    */
    public java.util.Collection getChildren()
    {
        return children;
    }
    public void setChildren(java.util.Collection children)
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
     *       class="com.lohool.jproject.xwohi.po.KnowledgeCatalogue"
     *       name="parent"
     *       column="parentID"
     *       cascade="none"
     *       outer-join="false"
     *
     * @return java.util.collection
     */
    public KnowledgeCatalogue getParent()
    {
        return parent;
    }
    public void setParent(KnowledgeCatalogue parent)
    {
        this.parent = parent;
    }
    /**
     * @hibernate.property
     * @return
     */
    public Timestamp getCreateTime()
    {
        return createTime;
    }
    public void setCreateTime(Timestamp createTime)
    {
        this.createTime = createTime;
    }
    /**
     * @hibernate.many-to-one
     *       class="com.lohool.jproject.xwohi.operator.po.Operator"
     *       name="user"
     *       column="userID"
     *       cascade="none"
     *       outer-join="false"
     *
     * @return java.util.collection
     */

    public com.lohool.jproject.xwohi.operator.po.Operator getUser()
    {
        return user;
    }
    public void setUser(com.lohool.jproject.xwohi.operator.po.Operator user)
    {
        this.user = user;
    }
    public void setUser(com.xwohi.framework.common.security.po.Operator user)
    {
        this.user = (Operator)user;
    }

}
