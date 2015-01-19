package com.lohool.jproject.xwohi.po;
import java.sql.Date;
/**
 * @hibernate.class  table="T_DayScheme"  dynamic-update="true"  dynamic-insert="true"
 * <p>每周中的日工作计划</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class DayScheme
{
    private int id;
    private String content;
    private Date day;
    private int dayAtWeek;
    private WeekScheme weekScheme;
    private int weekSchemeID;
    public DayScheme()
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
     * @hibernate.many-to-one
     *       class="com.lohool.jproject.xwohi.po.WeekScheme"
     *       name="weekScheme"
     *       column="weekSchemeID"
     *       cascade="none"
     *       lazy="true"
     *       outer-join="false"
     */

    public WeekScheme getWeekScheme()
    {
        return weekScheme;
    }
    public void setWeekScheme(WeekScheme weekScheme)
    {
        this.weekScheme = weekScheme;
    }
    /**
     * @hibernate.property length="255"
     * @return
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
     * @return
     */

    public Date getDay()
    {
        return day;
    }
    public void setDay(Date day)
    {
        this.day = day;
    }
    /**
     * @hibernate.property length="2"
     * @return
     */

    public int getDayAtWeek()
    {
        return dayAtWeek;
    }
    public void setDayAtWeek(int dayAtWeek)
    {
        this.dayAtWeek = dayAtWeek;
    }
    public int getWeekSchemeID()
    {
        return weekSchemeID;
    }
    public void setWeekSchemeID(int weekSchemeID)
    {
        this.weekSchemeID = weekSchemeID;
    }

}