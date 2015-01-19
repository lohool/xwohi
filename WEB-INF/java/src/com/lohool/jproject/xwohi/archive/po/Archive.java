package com.lohool.jproject.xwohi.archive.po;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @hibernate.class  table="T_Archive"  dynamic-update="true"  dynamic-insert="true"
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */
@Entity
@Table(name = "T_Archive")
public class Archive
{
     @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String title;
    private String editor;
    private String content;
    private java.sql.Timestamp createTime;
     @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "catalogueID")
    private ArchiveCatalogue catalogue;
    private String file;
    private String serialNumber;
    private int timeLimit;
    private int pageCount;
    private String absolutePath;
   /**
     *

     案卷题名 4
     案卷号 11 档案类别 科技档案
     档案类目 123 缩微底图号 3
     主题词 2
     编制单位 5 编制起时间 2005-3-1
     编制止时间 2005-3-1 页数 106
     件数 2 密级 内部
     保管期限 永久  归档年度 2005
     存放柜号 6 注销、移交 7
     备注 10
     案卷标识 8 分类号 9

     */
    public Archive()
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

    public String getTitle()
    {
        return title;
    }
    public void setTitle(String title)
    {
        this.title = title;
    }
    /**
     * @hibernate.property length="30"
     * @return String
     */

    public String getEditor()
    {
        return editor;
    }
    public void setEditor(String editor)
    {
        this.editor = editor;
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

    public java.sql.Timestamp getCreateTime()
    {
        return createTime;
    }
    public void setCreateTime(java.sql.Timestamp createTime)
    {
        this.createTime = createTime;
    }
    /**
     * @hibernate.many-to-one
     *       class="com.lohool.jproject.xwohi.archive.po.ArchiveCatalogue"
     *       name="catalogue"
     *       column="catalogueID"
     *       cascade="none"
     *       outer-join="false"
     *
     * @return java.util.collection
     */

    public ArchiveCatalogue getCatalogue()
    {
        return catalogue;
    }
    public void setCatalogue(ArchiveCatalogue catalogue)
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
    public String toString()
    {
        return title;
    }
    /**
     * @hibernate.property length="250"
     * @return
     */
    public String getAbsolutePath()
    {
        return absolutePath;
    }
    public void setAbsolutePath(String absolutePath)
    {
        this.absolutePath = absolutePath;
    }

}