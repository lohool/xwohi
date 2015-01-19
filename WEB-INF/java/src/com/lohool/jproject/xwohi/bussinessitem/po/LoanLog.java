package com.lohool.jproject.xwohi.bussinessitem.po;
import com.lohool.jproject.xwohi.operator.po.*;
import java.util.*;
/**
 * @hibernate.class  table="T_LoanLog"  dynamic-update="true"  dynamic-insert="true"
 * <p>租借历史记录</p>
 * <p>即出租物品归还历史记录 </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class LoanLog
{
    private int id;
    /**
     * 所租借的物品
     */
    private BussinessItem item;
    /**
     * 归还时间
     */
    private java.sql.Timestamp returnTime;
    /**
     * 租借时间
     */
    private java.sql.Timestamp loanTime;
    /**
     * 租借人
     */
    private com.lohool.jproject.xwohi.operator.po.Operator borrower;
    /**
     * 租借物品件数
     */
    private int count;

    public LoanLog()
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
     *     class="com.lohool.jproject.xwohi.bussinessitem.po.BussinessItem"
     *     name="item"
     *     column="itemID"
     *     cascade="none"
     *     out-join="false"
     *
     * @return
     */

    public BussinessItem getItem()
    {
        return item;
    }
    public void setItem(BussinessItem item)
    {
        this.item = item;
    }
    /**
     * @hibernate.property
     * @return
     */

    public java.sql.Timestamp getReturnTime()
    {
        return returnTime;
    }
    public void setReturnTime(java.sql.Timestamp returnTime)
    {
        this.returnTime = returnTime;
    }
    /**
     * @hibernate.property
     * @return
     */

    public java.sql.Timestamp getLoanTime()
    {
        return loanTime;
    }
    public void setLoanTime(java.sql.Timestamp loanTime)
    {
        this.loanTime = loanTime;
    }
    /**
 * @hibernate.many-to-one
 *     class="com.lohool.jproject.xwohi.operator.po.Operator"
 *     name="borrower"
 *     column="borrowerID"
 *     cascade="none"
 *     out-join="false"
 *
 * @return
 */

    public com.lohool.jproject.xwohi.operator.po.Operator getBorrower()
    {
        return borrower;
    }
    public void setBorrower(com.lohool.jproject.xwohi.operator.po.Operator borrower)
    {
        this.borrower = borrower;
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

}