package com.lohool.jproject.xwohi.po;


/**
 * @hibernate.class  table="T_BBSThread"  dynamic-update="true"  dynamic-insert="true"
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class BBSThread
{
    private int id;
    private String title;
    private String editor;
    private String content;
    private java.sql.Timestamp createTime;
    private BBSCatalogue catalogue;
    private String file;
    private BBSThread parent;
    public BBSThread()
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
     *       class="com.lohool.jproject.xwohi.po.BBSCatalogue"
     *       name="catalogue"
     *       column="catalogueID"
     *       cascade="none"
     *       outer-join="false"
     *
     * @return java.util.collection
     */

    public BBSCatalogue getCatalogue()
    {
        return catalogue;
    }
    public void setCatalogue(BBSCatalogue catalogue)
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
     *       class="com.lohool.jproject.xwohi.po.BBSThread"
     *       name="parent"
     *       column="parentID"
     *       cascade="none"
     *       outer-join="false"
     *
     * @return java.util.collection
     */
    public BBSThread getParent()
    {
        return parent;
    }
    public void setParent(BBSThread parent)
    {
        this.parent = parent;
    }

}
