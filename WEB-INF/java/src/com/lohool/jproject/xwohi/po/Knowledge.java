package com.lohool.jproject.xwohi.po;

import com.lohool.jproject.xwohi.operator.po.*;
import com.xwohi.framework.common.security.po.LoginUser;

import java.sql.*;
import javax.persistence.*;

/**
 * @hibernate.class  table="T_Knowledge"  dynamic-update="true"  dynamic-insert="true"
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */
@Entity
@Table(name = "T_Knowledge")
public class Knowledge implements LoginUser
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Column
    private String title;
    @Column
    private String content;
    @Column
    private Timestamp createTime;
    @ManyToOne
     @JoinColumn(name = "catalogueID")
    private KnowledgeCatalogue catalogue;
    @Column
    private String file;
    @ManyToOne
    @JoinColumn(name = "userID")
    private com.lohool.jproject.xwohi.operator.po.Operator user;
    public Knowledge()
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
     * @hibernate.property length="50"
     * @return String
     */

    public String getTitle()
    {
        return title;
    }
    public void setTitle(String title)
    {
        this.title = title;
    }

    /**
     * @hibernate.property length="1000"
     * @return String
     */

    public String getContent()
    {
        return content;
    }
    public void setContent(String content)
    {
        this.content = content;
    }
    /**
     * @hibernate.property
     * @return String
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
     *       class="com.lohool.jproject.xwohi.po.KnowledgeCatalogue"
     *       name="catalogue"
     *       column="catalogueID"
     *       cascade="none"
     *       outer-join="false"
     *
     * @return java.util.collection
     */

    public KnowledgeCatalogue getCatalogue()
    {
        return catalogue;
    }
    public void setCatalogue(KnowledgeCatalogue catalogue)
    {
        this.catalogue = catalogue;
    }
    /**
     * @hibernate.property length="50"
     * @return String
     */
    public String getFile()
    {
        return file;
    }
    public void setFile(String file)
    {
        this.file = file;
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
