package com.lohool.jproject.xwohi.po;

/**
 * <p>新闻类型 </p>
 * <p>Description: </p>
 * @hibernate.class  table="T_NewsType"  dynamic-update="true"  dynamic-insert="true"
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class NewsType
{
    private int id;
    /**
     * 类型编码
     */
    private String code;
    /**
     * 类型名
     */
    private String name;
    public NewsType()
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
     * @hibernate.property length=20
     * @return String
     */

    public String getCode()
    {
        return code;
    }
    public void setCode(String code)
    {
        this.code = code;
    }
    /**
     * @hibernate.property length=50
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

}
