package com.lohool.jproject.xwohi.bussinessitem .po;
import java.sql.Date;
import com.lohool.jproject.xwohi.operator.po.*;
/**
 * @hibernate.class  table="T_BussinessItem"  dynamic-update="true"  dynamic-insert="true"
 * <p>办公用品 </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class BussinessItem
{
    private int id;
    /**
     * 物品名
     */
    private String name;
    /**
     * 物品详细说明
     */
    private String description;
    /**
     * 物品种类
     */
    private ItemType type;
    /**
     * 入库时间
     */
    private java.sql.Timestamp createTime;
    /**
     * 共有件数
     */
    private int count;
    /**
     * 借出件数
     */
    private int loanCount;
    /**
     * 物品编码
     */
    private String sign;
    public BussinessItem()
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
     *     class="com.lohool.jproject.xwohi.bussinessitem.po.ItemType"
     *     name="type"
     *     column="typeID"
     *     cascade="none"
     *     out-join="false"
     *
     * @return
     */

    public ItemType getType()
    {
        return type;
    }
    public void setType(ItemType type)
    {
        this.type = type;
    }
    /**
     * @hibernate.property
     * @return
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
     * @hibernate.property length="8"
     * @return
     */

    public int getCount()
    {
        return count;
    }
    public void setCount(int count)
    {
        this.count = count;
    }
    /**
     * @hibernate.property length="8"
     * @return
     */

    public int getLoanCount()
    {
        return loanCount;
    }
    public void setLoanCount(int loanCount)
    {
        this.loanCount = loanCount;
    }
    /**
     * @hibernate.property length="30"
     * @return
     */

    public String getSign()
    {
        return sign;
    }
    public void setSign(String sign)
    {
        this.sign = sign;
    }

}