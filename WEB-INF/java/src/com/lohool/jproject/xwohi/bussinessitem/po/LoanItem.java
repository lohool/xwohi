package com.lohool.jproject.xwohi.bussinessitem.po;
import com.lohool.jproject.xwohi.operator.po.*;
import java.util.*;
/**
 * @hibernate.class  table="T_LoanItem"  dynamic-update="true"  dynamic-insert="true"
 * <p>借出的物品</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class LoanItem
{
    private int id;
    /**
     * 借出的物品
     */
    private BussinessItem item;
    /**
     * 借出件数
     */
    private int count;
    /**
     * 借出时间
     */
    private java.sql.Timestamp loanTime;
    /**
     * 租借原因或物品用途
     */
    private String borrowReason;
    /**
     * 租借人
     */
    private com.lohool.jproject.xwohi.operator.po.Operator borrower;
    public LoanItem()
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
     * @hibernate.property length="255"
     * @return
     */

    public String getBorrowReason()
    {
        return borrowReason;
    }
    public void setBorrowReason(String borrowReason)
    {
        this.borrowReason = borrowReason;
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

}