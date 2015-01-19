package com.lohool.jproject.xwohi.po;

import com.lohool.jproject.xwohi.operator.po.*;
import com.xwohi.framework.common.security.po.LoginUser;
import javax.persistence.*;


/**
 * @hibernate.class  table="T_File"  dynamic-update="true"  dynamic-insert="true"
 * <p>�ļ� </p>
 * <p>�����ļ��ϴ�������</p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */
@Entity
@Table(name = "T_File")
public class File implements LoginUser
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    /**
     * �ļ���
     */
    private String name;
    /**
     * �ļ��ڷ������ϵ�URL
     */
    private String url;
    String localFile;
    /**
     * �ļ�˵��
     */
    private String description;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "albumId")
    private Album album;
    
    /**
     * �ļ��ϴ���
     */
     @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "userId")
    private com.lohool.jproject.xwohi.operator.po.Operator user;
    public File()
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
     * @hibernate.property length="255"
     * @return
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
     * @hibernate.many-to-one
     *       class="com.lohool.jproject.xwohi.operator.po.Operator"
     *       name="user"
     *       column="userID"
     *       cascade="none"
     *       lazy="true"
     *       outer-join="false"
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

    /**
     * @return the album
     */
    public Album getAlbum() {
        return album;
    }

    /**
     * @param album the album to set
     */
    public void setAlbum(Album album) {
        this.album = album;
    }

}