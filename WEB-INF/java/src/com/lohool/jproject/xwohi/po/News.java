package com.lohool.jproject.xwohi.po;

/**
 * <p>新闻</p>
 * <p>Description: </p
 * @hibernate.class  table="T_News"  dynamic-update="true"  dynamic-insert="true"
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */
public class News
{

    private int id;
    private String title;
    private String content;
    private java.sql.Date createTime;
    private NewsType newsType;

    public News()
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
     * @hibernate.property length=50
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
     * @hibernate.property length=500
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
    public java.sql.Date getCreateTime()
    {
        return createTime;
    }

    public void setCreateTime(java.sql.Date createTime)
    {
        this.createTime = createTime;
    }
    
    /**
     * @hibernate.many-to-one
     *       class="com.lohool.jproject.xwohi.po.NewsType"
     *       name="newsType"
     *       column="newsTypeID"
     *       cascade="none"
     *       lazy="true"
     *       outer-join="false"
     * @return java.util.collection
     */
    public NewsType getNewsType()
    {
        return newsType;
    }

    public void setNewsType(NewsType newsType)
    {
        this.newsType = newsType;
    }
}
