/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lohool.jproject.xwohi.po;

import com.lohool.jproject.xwohi.operator.po.Operator;
import com.xwohi.framework.common.security.po.LoginUser;
import javax.persistence.*;

/**
 *
 * @author xingbao-
 */
@Entity
@Table(name = "T_Album")
public class Album implements LoginUser {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    //@SequenceGenerator(name = "SEQ_Privilege_ID", allocationSize = 1, initialValue = 1, sequenceName = "SEQ_Privilege_ID")
    //@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_Privilege_ID")
    private int id;
    
    private String name;
    private String coverUrl;
    private String description;
    //1-imgage,2-audio,3-video,4-win doc,0-others
    private int type;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "userId")
    private com.lohool.jproject.xwohi.operator.po.Operator user;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the coverUrl
     */
    public String getCoverUrl() {
        return coverUrl;
    }

    /**
     * @param coverUrl the coverUrl to set
     */
    public void setCoverUrl(String coverUrl) {
        this.coverUrl = coverUrl;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the user
     */
    public com.lohool.jproject.xwohi.operator.po.Operator getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(com.lohool.jproject.xwohi.operator.po.Operator user) {
        this.user = user;
    }
    
    public void setUser(com.xwohi.framework.common.security.po.Operator user)
    {
        this.user = (Operator)user;
    }

    /**
     * @return the type
     */
    public int getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(int type) {
        this.type = type;
    }
}
